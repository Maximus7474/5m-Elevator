local Framework = {}

local QB = exports["qb-core"]:GetCoreObject()

---Checks if the user has the adequate group
---@param restrictions table
---@return boolean HasGroup
function Framework:HasGroup(restrictions)
    local PlayerData = QB.Functions.GetPlayerData()
    local playerJob, playerRank = PlayerData.job.name, PlayerData.job.grade.level

    for job, grade in pairs(restrictions) do
        if job == playerJob and grade <= playerRank then
            return true
        end
    end
    return false
end

return Framework