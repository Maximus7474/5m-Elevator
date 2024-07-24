import React from "react";
import "../App.css";

interface FloorViewProps {
    floor: number | string | null; // Assuming floor is a number
}

const FloorView: React.FC<FloorViewProps> = ({ floor }) => {
    const paddedFloor = floor === "X" || floor === "ERR" ? floor : floor != null ? String(floor).padStart(2, '0') : '00';
    return (
        <div className="floor-indicator" style={floor === "ERR" || floor === "X" ? { color: "red" } : {}}>
            {paddedFloor}
        </div>
    );
}

export default FloorView;
