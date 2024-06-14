local NUI = require 'client.modules.nui'
local Utils = require 'client.modules.utils'
local TP = require 'client.modules.teleport'

local resourceName = GetCurrentResourceName()
local currentElevator, isMoving = nil, false
State = {}

AddEventHandler(("%s:openElevator"):format(resourceName), function (data)
    local data = data.data
    DebugPrint('[^2openElevator^7]', data)
    currentElevator = data.elevator
    NUI.SendReactMessage('setFloors', {
        currentFloor = data.floor,
        floorButtons = Utils.FormatFloors(Config.Elevators?[data.elevator]?.floors)
    })
    State.UIOpen = true
    NUI.ToggleNui(true)
end)

if Config.Debug then
    RegisterCommand('show-nui', function()
        NUI.ToggleNui(true)
        State.UIOpen = true
        DebugPrint('Show NUI frame')
    end)
end

RegisterNUICallback('hideFrame', function(_, cb)
    State.UIOpen = false
    NUI.ToggleNui(false)
    currentElevator = nil
    DebugPrint('Hide NUI frame')
    cb({})
end)

RegisterNUICallback('setNewFloor', function(data, cb)

    if isMoving then DebugPrint("Player is already moving, cancelling") return cb(false) end

    isMoving = true
    DebugPrint('Data received from NUI', json.encode(data))

    local success = Citizen.Await(TP.GoToNewFloor(currentElevator, data.floorIndex))

    cb(success)

    SetTimeout(success and 250 or 500, function ()
        isMoving = false
        NUI.ToggleNui(false)
    end)
end)