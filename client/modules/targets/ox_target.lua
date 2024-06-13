local resourceName = GetCurrentResourceName()

return {
    AddSphereZone = function (coords, label, data, icon)
        return exports.ox_target:addSphereZone({
            coords = coords,
            radius = 2.0,
            debug = Config.DebugZones,
            options = {{
                label = label,
                data = data,
                icon  = icon,
                event = ("%s:openElevator"):format(resourceName),
                distance = Config.Options.Distance,
            }}
        })
    end,
    RemoveZone = function (id)
        exports['qb-target']:RemoveZone(id)
    end,
}