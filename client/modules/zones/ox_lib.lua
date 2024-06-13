local resourceName = GetCurrentResourceName()

local textUI, keyID = Config.Options.TextUI:format(Config.Options.Key.name), Config.Options.Key.id
local onEnter, inside, onExit

if Config.Options.DrawMarker then
    onEnter = function()
        DebugPrint("txt ui", textUI, keyID)
    end
    inside = function (self)
        local coords = GetEntityCoords(cache.ped or PlayerPedId())
        if #(self.coords - coords) < Config.Options.Distance then
            if not lib.isTextUIOpen() then
                lib.showTextUI(textUI)
            end
            if IsControlJustPressed(keyID, keyID) then
                lib.hideTextUI()
                TriggerEvent(("%s:openElevator"):format(resourceName), self)
            end
        elseif lib.isTextUIOpen() then
            lib.hideTextUI()
        end
        DrawMarker(
            Config.Options.Marker.marker,
            self.coords.x, self.coords.y, self.coords.z,
            0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
            Config.Options.Marker.size.x, Config.Options.Marker.size.y, Config.Options.Marker.size.z,
            Config.Options.Marker.color.r, Config.Options.Marker.color.g, Config.Options.Marker.color.b, Config.Options.Marker.color.a,
            true, true, 2, false, false, false, false
        )
    end
else
    onEnter = function()

        DebugPrint("txt ui", textUI, keyID)
        lib.showTextUI(textUI)
    end
    inside = function (self)
        if IsControlJustPressed(keyID, keyID) then
            lib.hideTextUI()
            TriggerEvent(("%s:openElevator"):format(resourceName), self)
        end
    end
end

onExit = function ()
    lib.hideTextUI()
end

return {
    AddSphereZone = function (coords, label, data, icon)
        return lib.zones.sphere({
            coords = coords,
            radius = Config.Options.Distance + (Config.Options.DrawMarker and 10.0 or 0.0),
            debug = Config.DebugZones,
            data = data,
            onEnter = onEnter,
            inside = inside,
            onExit = onExit
        })
    end,
    RemoveZone = function (zone)
        if zone:contains(GetEntityCoords(cache.ped)) then
            lib.hideTextUI()
        end
        zone:remove()
    end,
}