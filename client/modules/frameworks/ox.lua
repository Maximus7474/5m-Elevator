local Framework = {}

local Ox = require '@ox_core.lib.init'

---Checks if the user has the adequate group
---@param restrictions table
---@return boolean HasGroup
function Framework:HasGroup(restrictions)
    local Player = Ox.GetPlayer()

    return Player.getGroup(restrictions)
end

return Framework