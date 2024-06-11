local Utils = {}

---Convert Config file structure to NUI structure
---@param floors table
---@return table
function Utils.FormatFloors(floors)
    local table = {}
    for k, v in pairs(floors) do
        table[#table+1] = {
            floor = k,
            label = v.label
        }
    end
    return table
end

return Utils