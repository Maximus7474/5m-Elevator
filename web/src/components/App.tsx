import React, { useState } from "react";
import "./App.css";
import { debugData } from "../utils/debugData";
import { fetchNui } from "../utils/fetchNui";
import { useNuiEvent } from "../hooks/useNuiEvent";
import FloorView from "./elements/floor-view";
import FloorButton from "./elements/floor-button";
import AccessIcon from "./elements/restricted-accessicon";

interface floorButtons {
  floor:string,
  label:string,
  index:number,
  hasAccess:boolean,
}

interface setFloorProps {
  isRestricted: boolean;
  hasAccess: boolean | null;
  currentFloor: string;
  floorButtons: floorButtons[]
}

debugData([
  {
    action: "setFloors",
    data: {
      isRestricted: false,
      hasAccess: false,
      currentFloor: 1,
      floorButtons: [
        {floor: "-1", label: "Underground 1", index: 1, hasAccess: true},
        {floor: "0", label: "Lobby", index: 2, hasAccess: false},
        {floor: "1", label: "First Floor", index: 3, hasAccess: false},
      ]
    },
  },
]);

debugData([
  {
    action: "setVisible",
    data: true,
  },
]);

const App: React.FC< any > = () => {

  const [currentFloor, setCurrentFloor] = useState<string>("0");
  const [restricted, setRestricted] = useState<boolean>(false);
  const [access, setAccess] = useState<boolean>(false);
  const [floorButtons, setFloorButtons] = useState<floorButtons[]>([]);

  useNuiEvent<setFloorProps>('setFloors', (data) => {
    setCurrentFloor(data.currentFloor);
    setFloorButtons(data.floorButtons);
    setRestricted(data.isRestricted);
    if (data.hasAccess && data.isRestricted) {
      setAccess(data.hasAccess);
    }
  });

  const handleButtonClick = (floorIndex: number, clickedFloor: string, hasAccess: boolean) => {
    
    console.log(restricted && !access, restricted, !access);

    if (!hasAccess) {
      setAccess(false);
      return setCurrentFloor("X");
    }

    if (restricted && !access) {
      return setCurrentFloor("X");
    }

    fetchNui<boolean>("setNewFloor", {floorIndex: floorIndex}, true)
      .then((retData) => {
        if (retData) {
          setCurrentFloor(clickedFloor)
        } else if (typeof clickedFloor === "boolean") {
          setCurrentFloor("ERR");
        };
      })
      .catch((e) => {
        setCurrentFloor("ERR");
      });
  };

  return (
    <div className="nui-wrapper">
      <div className="elevator-panel">
        <FloorView floor={currentFloor} />
        <div className="button-grid">
          {
            floorButtons.map(({ floor, label, index, hasAccess }) => (
              <FloorButton key={floor} floor={floor} label={label} onClick={() => handleButtonClick(index, floor, hasAccess)} />
            ))
          }
        </div>
        <AccessIcon restricted={restricted} hasAccess={access}></AccessIcon>
      </div>
    </div>
  );
};

export default App;
