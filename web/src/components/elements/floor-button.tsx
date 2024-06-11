import React from "react";
import "../App.css";

interface FloorButtonProps {
    floor: number | string;
    label: string;
    onClick: () => void; // onClick function prop
}

const FloorButton: React.FC<FloorButtonProps> = ({ floor, label, onClick }) => {
    return (
        <div className="elevator-button" onClick={onClick}>
            <div className="button-circle">{floor}</div>
            <div className="button-label">{label}</div>
        </div>
    );
}

export default FloorButton;
