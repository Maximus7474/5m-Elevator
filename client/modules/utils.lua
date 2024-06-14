local Utils = {}

---Convert Config file structure to NUI structure
---@param floors table
---@return table formattedFloors
function Utils.FormatFloors(floors)
    local formattedFloors = {}
    for i = 1, #floors do
        formattedFloors[i] = {
            index = i,
            floor = floors[i].floor,
            label = floors[i].label,
        }
    end
    return formattedFloors
end

return Utils