Config.Elevators = {
    ["Maze Bank Tower"] = {
        restricted = false, --[[ { ["police"] = 0 } or {"police", "ambulance"} or false to disable ]]
        vehicle = true,
        floors = {
            {
                floor = "-2",
                label = "Garage Entrance",
                panel = vector4(-82.5941, -819.1429, 36.0281, 260.1323),
                position = vector4(-82.2491, -819.4501, 36.0281 - 0.98, 352.8853),
                carposition = vector4(-84.2893, -821.5383, 36.0281 - 0.98, 344.3796),
            },
            {
                floor = "57",
                label = "Interior Garage",
                panel = vector4(-92.1781, -821.9614, 222.0004, 251.2057),
                position = vector4(-91.4152, -821.3260, 222.0006 - 0.98, 252.8723),
                carposition = vector4(-88.2165, -821.2771, 222.0004 - 0.98, 254.0536)
            },
            {
                floor = "65",
                label = "Mod Shop",
                panel = vector4(-73.5848, -809.6722, 285.0000, 163.1215),
                position = vector4(-71.4800, -810.8328, 285.0002 - 0.98, 166.4717),
                carposition = vector4(-72.6307, -814.1168, 285.0003 - 0.98, 157.9103)
            },
        }
    },
    ["FBI Tower"] = {
        restricted = false, --[[ { ["police"] = 0 } or {"police", "ambulance"} or false to disable ]]
        vehicle = false,
        floors = {
            {
                floor = "-1",
                label = "Basement",
                panel = vector4(134.7442, -735.1460, 42.1525, 349.8235),
                position = vector4(135.8726, -736.2706, 42.1525 - 0.98, 342.7188),
            },
            {
                floor = "1",
                label = "Ground Floor",
                panel = vector4(136.6215, -763.0034, 45.7520, 185.6503),
                position = vector4(136.2213, -761.7458, 45.7520 - 0.98, 162.8805),
            },
            {
                floor = "49",
                label = "Communications",
                panel = vector4(136.6781, -763.0528, 242.1518, 191.5057),
                position = vector4(136.2172, -761.7249, 242.1518 - 0.98, 155.2966),
            },
            {
                floor = "47",
                label = "Legal Affairs",
                panel = vector4(136.6105, -763.0298, 234.1519, 186.5914),
                position = vector4(136.2080, -761.6084, 234.1519 - 0.98, 134.1221),
            },
        }
    },
    ["3 Alta Street"] = {
        restricted = false, --[[ { ["police"] = 0 } or {"police", "ambulance"} or false to disable ]]
        vehicle = false,
        floors = {
            {
                floor = "1",
                label = "Reception",
                panel = vector4(-269.3997, -961.1256, 31.2231, 107.8347),
                position = vector4(-268.9292, -962.3444, 31.2231 - 0.98, 298.5627),
            },
            {
                floor = "11",
                label = "Appartment 114",
                panel = vector4(-272.6676, -968.4616, 77.2313, 220.5240),
                position = vector4(-273.3964, -967.1097, 77.2313 - 0.98, 245.2495),
            },
            {
                floor = "14",
                label = "Appartment 142",
                panel = vector4(-271.1436, -941.5916, 92.5122, 118.6130),
                position = vector4(-270.0823, -941.1799, 92.5109 - 0.98, 67.5789),
            }
        }
    },
    ["LomBank"] = {
        restricted = false, --[[ { ["police"] = 0 } or {"police", "ambulance"} or false to disable ]]
        vehicle = true,
        floors = {
            {
                floor = "-1",
                label = "Garage Entrance",
                panel = vector4(-1537.2441, -574.4737, 25.7079, 299.4772),
                position = vector4(-1538.3264, -574.9943, 25.7079 - 0.98, 30.2928),
                carposition = vector4(-1537.3937, -577.7695, 25.7078 - 0.98, 31.8109),
            },
            {
                floor = "14",
                label = "Interior Garage",
                panel = vector4(-1586.9918, -562.0741, 86.5004, 41.1348),
                position = vector4(-1586.0583, -561.5680, 86.5004 - 0.98, 218.5790),
                carposition = vector4(-1583.5637, -563.7531, 86.5004 - 0.98, 243.2050)
            }
        }
    },
}