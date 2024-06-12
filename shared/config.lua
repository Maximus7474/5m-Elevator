Config = {}

--[[ Set Debug Mode ]]
Config.Debug = true
Config.DebugZones = false

--[[ Set to false if you do not want to be notified on updates ]]
Config.VersionCheck = true

Config.Options = {

    --[[ Set the target Icon & Label ]]
    Icon = "fa-solid fa-arrows-up-down",
    Label = "Elevator",

    --[[ if false teleports immediatly ]]
    ScreenFade = true,

    --[[ fade in and out duration in ms (ignore if ScreenFade is false) ]]
    FadeDuration = 500,
}

Config.Elevators = {
    ["Maze Bank Tower"] = {
        restricted = false,
        vehicle = false,
        floors = {
            ["-2"] = {
                label = "Garage Entrance",
                panel = vector4(-82.5941, -819.1429, 36.0281, 260.1323),
                position = vector4(-84.2893, -821.5383, 36.0281, 344.3796)
            },
            ["57"] = {
                label = "Interior Garage",
                panel = vector4(-92.1781, -821.9614, 222.0004, 251.2057),
                position = vector4(-91.8228, -821.1077, 222.0004, 255.4299)
            },
            ["65"] = {
                label = "Mod Shop",
                panel = vector4(-73.5848, -809.6722, 285.0000, 163.1215),
                position = vector4(-71.4348, -810.7918, 285.0000, 159.1122)
            },
        }
    }
}

--[[ 
    Don't change unless you know what you're doing
]]
Config.Targets = {
    "ox_target", "qb-target"
}