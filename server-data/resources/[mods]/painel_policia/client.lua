local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

local preso = false
local jailCoords = vector3(1847.4, 2586.2, 45.6) -- Coordenada da porta da prisão

-- =========================================================================
-- SISTEMA DE TRANSPORTE NPC (VIATURA AUTOMÁTICA)
-- =========================================================================
RegisterNetEvent("dinastia:iniciarTransporte")
AddEventHandler("dinastia:iniciarTransporte", function(tempo)
    preso = true
    local ped = PlayerPedId()
    
    -- Cria a Viatura Policial
    local mHash = GetHashKey("police") -- Mude para o nome da sua viatura principal
    RequestModel(mHash)
    while not HasModelLoaded(mHash) do Wait(1) end
    
    -- Spawna a viatura atrás do preso
    local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, -8.0, 0.0)
    local viatura = CreateVehicle(mHash, coords.x, coords.y, coords.z, GetEntityHeading(ped), true, false)
    local motorista = CreatePedInsideVehicle(viatura, 4, GetHashKey("s_m_y_cop_01"), -1, true, false)
    
    -- Coloca o preso e tranca
    SetPedIntoVehicle(ped, viatura, 2)
    SetVehicleDoorsLocked(viatura, 4)
    
    -- Faz o NPC dirigir até a Penitenciária
    TaskVehicleDriveToCoord(motorista, viatura, jailCoords.x, jailCoords.y, jailCoords.z, 25.0, 0, mHash, 786603, 1.0, true)
    
    TriggerEvent("Notify", "importante", "Você está sob custódia da Dinastia. Destino: Penitenciária Federal.")

    -- Checa se chegou na prisão
    Citizen.CreateThread(function()
        while preso do
            local dist = #(GetEntityCoords(ped) - jailCoords)
            if dist < 10.0 then
                DeleteEntity(motorista)
                DeleteEntity(viatura)
                SetEntityCoords(ped, 1680.1, 2513.0, 45.5) -- Pátio Interno
                break
            end
            Wait(1000)
        end
    end)
end)

-- =========================================================================
-- TRABALHO FORÇADO (LOCAIS DENTRO DA PRISÃO)
-- =========================================================================
local pontosTrabalho = {
    {1691.5, 2565.9, 45.5, "Limpar Pátio"},
    {1651.9, 2564.0, 45.5, "Cozinha da Cela"},
    {1644.4, 2527.1, 45.5, "Lavar Uniformes"}
}

Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        if preso then
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            for k, v in pairs(pontosTrabalho) do
                local dist = #(coords - vector3(v[1], v[2], v[3]))
                if dist < 1.5 then
                    sleep = 5
                    DrawText3D(v[1], v[2], v[3], "~y~[E] ~w~TRABALHAR NA DINASTIA (-1 MÊS)")
                    if IsControlJustPressed(0, 38) then
                        FreezeEntityPosition(ped, true)
                        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_MAID_CLEAN", 0, true)
                        Wait(10000) -- Tempo de trabalho
                        ClearPedTasks(ped)
                        FreezeEntityPosition(ped, false)
                        TriggerServerEvent("dinastia:reduzirPena")
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

-- =========================================================================
-- ABRIR/FECHAR MDT (MENU DE DADOS)
-- =========================================================================
RegisterCommand("mdt", function()
    -- Abre a NUI do MDT
    SetNuiFocus(true, true)
    SendNUIMessage({ action = "open", name = "Oficial Dinastia", rank = "Membro Elite" })
end)

RegisterNUICallback("close", function()
    SetNuiFocus(false, false)
end)

RegisterNetEvent("dinastia:liberarPreso")
AddEventHandler("dinastia:liberarPreso", function()
    preso = false
    SetEntityCoords(PlayerPedId(), 1847.4, 2586.2, 45.6) -- Fora da prisão
end)

-- =========================================================================
-- UTILITÁRIOS (TEXTO 3D DOURADO)
-- =========================================================================
function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(197, 160, 89, 215) -- Dourado da Logo Dinastia
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end