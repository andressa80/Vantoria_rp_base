local pedlist = {
    -- 🏥 HOSPITAL
    {
        name = "Hospital",
        x = 312.97,
        y = -592.83,
        z = 43.28,
        h = 70.0,
        model = "s_m_m_doctor_01"
    },

    -- 🚔 POLÍCIA
    {
        name = "Policia",
        x = 440.84,
        y = -983.14,
        z = 30.69,
        h = 90.0,
        model = "s_m_y_cop_01"
    }
}

local spawnedPeds = {}
local DISTANCE_SPAWN = 50.0
local DISTANCE_DESPAWN = 60.0

---------------------------------------------------------------------
-- 📏 CALCULAR DISTÂNCIA
---------------------------------------------------------------------
local function GetDistance(coords)
    local playerCoords = GetEntityCoords(PlayerPedId())
    return #(playerCoords - vector3(coords.x, coords.y, coords.z))
end

---------------------------------------------------------------------
-- 👤 CRIAR NPC
---------------------------------------------------------------------
function SpawnPed(index, data)
    RequestModel(data.model)

    while not HasModelLoaded(data.model) do
        Citizen.Wait(10)
    end

    local ped = CreatePed(4, GetHashKey(data.model), data.x, data.y, data.z - 1, data.h, false, true)

    FreezeEntityPosition(ped, true) -- ❄️ trava no lugar
    SetEntityInvincible(ped, true) -- 🛡️ imortal
    SetBlockingOfNonTemporaryEvents(ped, true) -- 🚫 não reage ao mundo

    spawnedPeds[index] = ped
end

---------------------------------------------------------------------
-- ❌ REMOVER NPC
---------------------------------------------------------------------
function DeletePedSafe(index)
    if spawnedPeds[index] then
        DeleteEntity(spawnedPeds[index])
        spawnedPeds[index] = nil
    end
end

---------------------------------------------------------------------
-- 🔄 SISTEMA PRINCIPAL
---------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local sleep = 1000

        for i, data in pairs(pedlist) do
            local distance = GetDistance(data)

            -- 🔥 CRIA NPC
            if distance <= DISTANCE_SPAWN and not spawnedPeds[i] then
                SpawnPed(i, data)
            end

            -- ❌ REMOVE NPC
            if distance > DISTANCE_DESPAWN and spawnedPeds[i] then
                DeletePedSafe(i)
            end
        end

        Citizen.Wait(sleep)
    end
end)