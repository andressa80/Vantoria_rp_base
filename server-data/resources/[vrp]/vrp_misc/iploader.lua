-- 🔥 THREAD PRINCIPAL
Citizen.CreateThread(function()

    -- 🔄 Carrega todos os interiores configurados
    for _, interior in pairs(interiors) do
        LoadInteriorSet(interior)
    end

end)

---------------------------------------------------------------------
-- 📦 FUNÇÃO: CARREGAR INTERIOR
---------------------------------------------------------------------
function LoadInteriorSet(data)
    for _, coords in pairs(data.coords) do
        
        -- 📍 Pega o ID do interior
        local interiorID = GetInteriorAtCoords(coords.x, coords.y, coords.z)

        -- ⚠️ Evita erro se não existir
        if interiorID ~= 0 then
            
            -- 🔄 Carrega interior
            LoadInterior(interiorID)

            -- 🧱 Ativa props (decoração, equipamentos, etc)
            for _, prop in pairs(data.props) do
                EnableInteriorProp(interiorID, prop)
            end

            -- 🔄 Atualiza interior
            RefreshInterior(interiorID)
        end
    end
end

---------------------------------------------------------------------
-- 🏙️ MAPAS DA CIDADE
---------------------------------------------------------------------
interiors = {

    -- 👮 POLÍCIA (MRPD)
    {
        coords = {
            { x = 440.84, y = -983.14, z = 30.69 }
        },
        props = {
            -- coloque props se usar mapa custom
        }
    },

    -- 🏥 HOSPITAL
    {
        coords = {
            { x = 312.97, y = -592.83, z = 43.28 }
        },
        props = {
            -- coloque props se usar mapa custom
        }
    }

}