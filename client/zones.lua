if not CanResourceBeUsed() then return end

local Zones = {}
local TARGET = require ("client.modules."..lib.callback.await("5m-Elevator:ZoneHandler", false))
local resourceName = GetCurrentResourceName()

for elevator, data in pairs(Config.Elevators) do
    Zones[elevator] = {}
    for _, v in pairs(data.floors) do
        local coords = vector3(v.position.x, v.position.y, v.panel.z)
        Zones[elevator][#Zones[elevator]+1] = TARGET.AddSphereZone(coords, Config.Options.Label, { floor = v.floor, elevator = elevator }, data.vehicle, Config.Options.Icon)
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