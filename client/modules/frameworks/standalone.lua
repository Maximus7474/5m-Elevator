local Framework = {}

---Checks if the user has the adequate group
---@param restrictions table
---@return boolean HasGroup
function Framework:HasGroup(restrictions)
    local playerJob, playerRank
    for key, value in pairs(restrictions) do
        if type(key) == "string" and key == playerJob and value <= playerRank then
            return true
        elseif type(key) == "number" and value == playerJob then

            return true
        end
    end
    return true
end

return Framework