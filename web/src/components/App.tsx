import React, { useState } from "react";
import "./App.css";
import { debugData } from "../utils/debugData";
import { fetchNui } from "../utils/fetchNui";
import { useNuiEvent } from "../hooks/useNuiEvent";
import FloorView from "./elements/floor-view";
import FloorButton from "./elements/floor-button";

// This will set the NUI to visible if we are
// developing in browser
debugData([
  {
    action: "setFloors",
    data: {
      currentFloor: 1,
      floorButtons: [
        {floor: -1, label: "Underground 1"},
        {floor: 0, label: "Lobby"},
        {floor: 1, label: "First Floor"},
      ]
    },
  },
])
debugData([
  {
    action: "setVisible",
    data: true
  }
]);

const App: React.FC< any > = () => {

  const [currentFloor, setCurrentFloor] = useState<number | string>(0);
  const [floorButtons, setFloorButtons] = useState<{ floor: number; label: string; }[]>([]);

  useNuiEvent<{ currentFloor: number; floorButtons: { floor: number; label: string; }[] }>('setFloors', (data) => {
    setCurrentFloor(data.currentFloor);
    setFloorButtons(data.floorButtons);
  });

  const handleButtonClick = (clickedFloor: number) => {
    fetchNui<boolean>("setNewFloor")
      .then((retData) => {
        setCurrentFloor(retData ? clickedFloor : "ERR");
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
          {floorButtons.map(({ floor, label }) => (
            <FloorButton key={floor} floor={floor} label={label} onClick={() => handleButtonClick(floor)} />
          ))}
        </div>
      </div>
    </div>
  );
};

export default App;
