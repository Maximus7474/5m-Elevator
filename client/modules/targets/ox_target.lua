local resourceName = GetCurrentResourceName()

return {
    AddSphereZone = function (coords, label, data, icon)
        return exports.ox_target:addSphereZone({
            coords = coords,
            radius = 1.5,
            debug = Config.DebugZones,
            options = {{
                label = label,
                data = data,
                icon  = icon,
                event = ("%s:openElevator"):format(resourceName)
            }}
        })
    end,
    RemoveZone = function (id)
        exports['qb-target']:RemoveZone(id)
    end,
}