local targetScripts, _ = lib.getFilesInDirectory(("@%s/client/modules/targets/"):format(GetCurrentResourceName()), "%.lua")
local target
for _, script in pairs(targetScripts) do
    if IsResourceStarting(script:gsub("%.lua$", "")) then
        target = script:gsub("%.lua$", "")
        break
    end
end
if not target then error("No Target Script Defined ! This resource will not work.") end


lib.callback.register("5m-Elevator:TargetScripts", function () return target end)

if Config.VersionCheck then
    lib.versionCheck('Maximus7474/5M-Elevator')
end