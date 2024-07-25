function DebugPrint(...)
    if not Config.Debug then return end
    local args = { ... }

    for k, v in ipairs(args) do
        if type(v) == "table" then
            args[k] = json.encode(
                v,
                {
                    indent=4, sort_keys=true
                }
            )
        else
            args[k] = tostring(v)
        end
    end

    print("[^3DEBUG^7]", table.concat(args, '\t'))
end

function IsResourceStarting(resource)
    local state = GetResourceState(resource)
    return state == "started" or state == "starting"
end

function GetFrameworkRequirePath()
    if IsResourceStarting('es_extended') then return 'esx' end
    if IsResourceStarting('ox_core') then return 'qb' end
    if IsResourceStarting('qb-core') then return 'qb' end
    return 'standalone'
end
