if Config.VersionCheck then
    lib.versionCheck('Maximus7474/5M-Elevator')
end

local target = false
for _, script in pairs(Config.Targets) do
    if IsResourceStarting(script) then
        target = true
        break
    end
end

if not target then
    error("No Target Script Defined ! This resource will not work.")
end