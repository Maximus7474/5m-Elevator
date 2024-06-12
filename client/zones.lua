local Zones, TARGET = {}, {}
local resourceName = GetCurrentResourceName()

for _, target in pairs(Config.Targets) do
    if IsResourceStarting(target) then
        TARGET = require ("client.modules.targets."..target)
        break
    end
end

for elevator, data in pairs(Config.Elevators) do
    Zones[elevator] = {}
    for k, v in pairs(data.floors) do
        Zones[elevator][#Zones[elevator]+1] = TARGET.AddSphereZone(v.panel, Config.Options.Label, { floor = k, elevator = elevator }, Config.Options.Icon)
    end
end

AddEventHandler("onResourceStop", function(resource)
    if resource ~= resourceName then return end

    for _, data in pairs(Zones) do
        for _, id in pairs(data) do
            TARGET.RemoveZone(id)
        end
    end
end)