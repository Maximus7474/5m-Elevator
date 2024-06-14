import React, { useState } from "react";
import "./App.css";
import { debugData } from "../utils/debugData";
import { fetchNui } from "../utils/fetchNui";
import { useNuiEvent } from "../hooks/useNuiEvent";
import FloorView from "./elements/floor-view";
import FloorButton from "./elements/floor-button";

interface floorButtons {
  floor:string,
  label:string,
  index:number,
}

debugData([
  {
    action: "setFloors",
    data: {
      currentFloor: 1,
      floorButtons: [
        {floor: "-1", label: "Underground 1", index: 1},
        {floor: "0", label: "Lobby", index: 2},
        {floor: "1", label: "First Floor", index: 3},
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
  const [floorButtons, setFloorButtons] = useState<floorButtons[]>([]);

  useNuiEvent<{ currentFloor: string; floorButtons: floorButtons[] }>('setFloors', (data) => {
    setCurrentFloor(data.currentFloor);
    setFloorButtons(data.floorButtons);
  });

  const handleButtonClick = (floorIndex: number, clickedFloor: string) => {
    fetchNui<boolean>("setNewFloor", {floorIndex: floorIndex})
      .then((retData) => {
        if (retData) setCurrentFloor(clickedFloor);
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
            floorButtons.map(({ floor, label, index }) => (
              <FloorButton key={floor} floor={floor} label={label} onClick={() => handleButtonClick(index, floor)} />
            ))
          }
        </div>
      </div>
    </div>
  );
};

export default App;
