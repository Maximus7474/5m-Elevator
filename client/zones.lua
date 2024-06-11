local Zones = {}
local resourceName = GetCurrentResourceName()

for elevator, data in pairs(Config.Elevators) do
    Zones[elevator] = {}
    for k, v in pairs(data.floors) do
        Zones[elevator][#Zones[elevator]+1] = exports.ox_target:addSphereZone({
            coords = v.panel,
            radius = 1.5,
            debug = Config.DebugZones,
            options = {{
                label = Config.Options.Label,
                data = { floor = k, elevator = elevator },
                icon  = Config.Options.Icon,
                event = ("%s:openElevator"):format(resourceName)
            }}
        })
    end
end

AddEventHandler("onResourceStop", function(resource)
    if resource ~= resourceName then return end

    for _, data in pairs(Zones) do
        for _, id in pairs(data) do
            exports.ox_target:removeZone(id)
        end
    end
end)