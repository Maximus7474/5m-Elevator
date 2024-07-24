local resourceName = GetCurrentResourceName()

return {
    AddSphereZone = function (coords, label, data, isVehicle, icon)
        return exports.ox_target:addSphereZone({
            coords = coords,
            radius = 2.0,
            debug = Config.DebugZones,
            options = {{
                label = label,
                data = data,
                icon  = icon,
                canInteract = function ()
                    if not isVehicle then return true end
                    if not cache.vehicle then return true end
                    return cache.vehicle and cache.seat == -1
                end,
                event = ("%s:openElevator"):format(resourceName),
                distance = Config.Options.Distance,
            }}
        })
    end,
    RemoveZone = function (id)
        exports.ox_target:removeZone(id)
    end,
}