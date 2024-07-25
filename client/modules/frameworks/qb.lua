local Framework = {}

local QB = exports["qb-core"]:GetCoreObject()

---Checks if the user has the adequate group
---@param restrictions table
---@return boolean HasGroup
function Framework:HasGroup(restrictions)
    local PlayerData = QB.Functions.GetPlayerData()
    local playerJob, playerRank = PlayerData.job.name, PlayerData.job.grade.level

    for key, value in pairs(restrictions) do
        if type(key) == "string" and key == playerJob and value <= playerRank then
            return true
        elseif type(key) == "number" and value == playerJob then

            return true
        end
    end
    return false
end

return Framework