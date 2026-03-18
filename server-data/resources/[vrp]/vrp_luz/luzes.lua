-- CONFIG DE LUZES (FÁCIL DE EDITAR)
lightsConfig = {
    -- HOSPITAL 🏥
    {306.12, -595.15, 43.28, 255, 255, 255, 8.0, 0.3},
    {310.45, -598.22, 43.28, 255, 255, 255, 8.0, 0.3},

    -- POLÍCIA 🚔
    {441.25, -981.96, 30.68, 0, 102, 255, 10.0, 0.5},
    {455.12, -987.45, 30.68, 0, 102, 255, 10.0, 0.5},
}

-- THREAD PRINCIPAL (OTIMIZADA)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500) -- reduz uso (antes era 0)

        local hour = GetClockHours()

        -- Só ativa à noite
        if hour >= 19 or hour <= 6 then
            for _,v in ipairs(lightsConfig) do
                local x,y,z,r,g,b,range,intensity = table.unpack(v)
                DrawLightWithRangeAndShadow(x, y, z, r, g, b, range, intensity, 0.2)
            end
        end
    end
end)