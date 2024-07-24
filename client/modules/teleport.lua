local TP = {}

local DoScreenFadeOut, DoScreenFadeIn, IsScreenFadedOut, IsScreenFadedIn = DoScreenFadeOut, DoScreenFadeIn, IsScreenFadedOut, IsScreenFadedIn
local SetEntityCoords, SetEntityHeading = SetEntityCoords, SetEntityHeading

function TeleportPlayer(floor)
    SetEntityCoords(cache.ped or PlayerPedId(), floor.x, floor.y, floor.z, true, true, true, false)
    SetEntityHeading(cache.ped or PlayerPedId(), floor.w)
end

function TeleportVehicle(floor)
    local vehicle = cache.vehicle
    -- FreezeEntityPosition(vehicle, true)

    SetEntityCoords(vehicle, floor.x, floor.y, floor.z, true, true, true, false)
    SetEntityHeading(vehicle, floor.w)

    -- FreezeEntityPosition(vehicle, false)
end

---GoTo new floor (duh)
---@param elevator string|nil
---@param newfloor string
---@return promise success?
function TP.GoToNewFloor(elevator, newfloor)
    local success = promise.new()
    local isVehicle = Config.Elevators?[elevator].vehicle == true
    local newfloor = Config.Elevators?[elevator]?.floors?[newfloor]?.position

    if elevator == nil or newfloor == nil or newfloor?.xyz == nil then
        DebugPrint("[^2TP^7] ^1Invalid Parameters^7", elevator)
        DebugPrint(
            "^3Elevator Data:^7", Config.Elevators?[elevator] or "^1undefined^7",
            "^3Floor list:^7", Config.Elevators?[elevator]?.floors or "^1undefined^7",
            "^3Floor Data^7", Config.Elevators?[elevator]?.floors?[newfloor] or "^1undefined^7",
            "^3Position^7", Config.Elevators?[elevator]?.floors?[newfloor]?.position or "^1undefined^7"
        )
        success:resolve(false)
    elseif (isVehicle and (cache.vehicle and cache.seat ~= -1)) then
        DebugPrint("[^2TP^7] ^1Invalid Use^7", elevator, "you're in a vehicle but not the driver", ("Seat Index: %d"):format(cache.seat))
    elseif Config.Options.ScreenFade then
        DebugPrint("[^2TP^7] ^2Valid Parameters^7, Teleporting to", newfloor)

        DoScreenFadeOut(Config.Options.FadeDuration)
        while not IsScreenFadedOut() do Citizen.Wait(10) end

        if isVehicle and (cache.vehicle and cache.seat == -1) then
            TeleportVehicle(newfloor)
        elseif not cache.vehicle then
            TeleportPlayer(newfloor)
        end

        DoScreenFadeIn(Config.Options.FadeDuration)
        while not IsScreenFadedIn() do Citizen.Wait(10) end

        success:resolve(true)
    else
        DebugPrint("[^2TP^7] ^2Valid Parameters^7, Teleporting")

        if isVehicle and (cache.vehicle and cache.seat == -1) then
            TeleportVehicle(newfloor)
        elseif not cache.vehicle then
            TeleportPlayer(newfloor)
        end

        success:resolve(true)
    end

    return success
end

return TP