Config.Elevators = {
    ["Maze Bank Tower"] = {
        restricted = { ["police"] = 0 }, --[[ or {"police", "ambulance"} or false to disable ]]
        vehicle = false,
        floors = {
            {
                floor = "-2",
                label = "Garage Entrance",
                panel = vector4(-82.5941, -819.1429, 36.0281, 260.1323),
                position = vector4(-84.2893, -821.5383, 36.0281 - 0.98, 344.3796)
            },
            {
                floor = "57",
                label = "Interior Garage",
                panel = vector4(-92.1781, -821.9614, 222.0004, 251.2057),
                position = vector4(-88.2165, -821.2771, 222.0004 - 0.98, 254.0536)
            },
            {
                floor = "65",
                label = "Mod Shop",
                panel = vector4(-73.5848, -809.6722, 285.0000, 163.1215),
                position = vector4(-73.3622, -813.9121, 284.9999 - 0.98, 163.1935)
            },
        }
    }
}