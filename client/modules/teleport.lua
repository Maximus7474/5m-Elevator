local TP = {}

local DoScreenFadeOut, DoScreenFadeIn, IsScreenFadedOut, IsScreenFadedIn = DoScreenFadeOut, DoScreenFadeIn, IsScreenFadedOut, IsScreenFadedIn
local SetEntityCoords, SetEntityHeading = SetEntityCoords, SetEntityHeading

---GoTo new floor (duh)
---@param elevator string|nil
---@param newfloor string
---@return promise success?
function TP.GoToNewFloor(elevator, newfloor)
    local success = promise.new()
    local newfloor = Config.Elevators?[elevator]?.floors?[newfloor]?.position

    if elevator == nil or newfloor == nil or newfloor?.xyz == nil then
        DebugPrint("[^2TP^7] ^1Invalid Parameters^7", {elevator=elevator, newfloor=newfloor})
        success:resolve(false)
    elseif Config.Options.ScreenFade then
        DebugPrint("[^2TP^7] ^2Valid Parameters^7, Teleporting to", newfloor)

        DoScreenFadeOut(Config.Options.FadeDuration)
        while not IsScreenFadedOut() do Citizen.Wait(10) end

        SetEntityCoords(cache.ped or PlayerPedId(), newfloor.x, newfloor.y, newfloor.z, true, true, true, false)
        SetEntityHeading(cache.ped or PlayerPedId(), newfloor.w)

        DoScreenFadeIn(Config.Options.FadeDuration)
        while not IsScreenFadedIn() do Citizen.Wait(10) end

        success:resolve(true)
    else
        DebugPrint("[^2TP^7] ^2Valid Parameters^7, Teleporting")

        SetEntityCoords(cache.ped or PlayerPedId(), newfloor.x, newfloor.y, newfloor.z, true, true, true, false)
        SetEntityHeading(cache.ped or PlayerPedId(), newfloor.w)

        success:resolve(true)
    end

    return success
end

return TP