local Framework = {}

local ESX = exports.es_extended:getSharedObject()

---Checks if the user has the adequate group
---@param restrictions table
---@return boolean HasGroup
function Framework:HasGroup(restrictions)
    local PlayerData = ESX.GetPlayerData()
    local playerJob, playerRank = PlayerData.job.name, PlayerData.job.grade

    for job, grade in pairs(restrictions) do
        if job == playerJob and grade <= playerRank then
            return true
        end
    end
    return false
end

return Framework