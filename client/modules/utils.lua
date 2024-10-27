local Framework = require (('client.modules.frameworks.%s'):format(GetFrameworkRequirePath()))

local Utils = {}

---Convert Config file structure to NUI structure
---@param floors table
---@return table, boolean
function Utils.FormatFloors(floors)
    local formattedFloors = {}
    local restricted = false
    for i = 1, #floors do
        local floor = floors[i];

        if not restricted and floor.restrictions then restricted = true end

        formattedFloors[i] = {
            index = i,
            floor = floor.floor,
            label = floor.label,
            hasAccess = floor.restrictions and Framework:HasGroup(floor.restrictions) or true
        }
    end
    return formattedFloors, restricted
end

return Utils