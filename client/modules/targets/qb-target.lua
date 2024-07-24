local resourceName = GetCurrentResourceName()

return {
    AddSphereZone = function (coords, label, data, isVehicle, icon)
        local name = ("%s_%s_%s"):format(resourceName, data.elevator, data.floor)
        exports['qb-target']:AddCircleZone(
            name,
            vector3(coords.x, coords.y, coords.z), 2.0,
            {
                name = name,
                debugPoly = Config.DebugZones,
            },
            {
                options = {
                    {
                        type = "client",
                        event = ("%s:openElevator"):format(resourceName),
                        icon = icon,
                        label = label,
                        data = data,
                        canInteract = function ()
                            if not isVehicle then return true end
                            if not cache.vehicle then return true end
                            return cache.vehicle and cache.seat == -1
                        end
                    }
                },
                distance = Config.Options.Distance,
            }
        )
        return name
    end,
    RemoveZone = function (id)
        exports['qb-target']:RemoveZone(id)
    end,
}