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