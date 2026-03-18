local macas = {
    { x = 307.15, y = -581.33, z = 43.26, h = 160.0 },
    { x = 311.15, y = -582.33, z = 43.26, h = 160.0 },
}

-- Sintoniza rádio 192 automaticamente
RegisterNetEvent("dinastia:setRadio")
AddEventHandler("dinastia:setRadio", function(freq)
    -- Verifica se o recurso pma-voice existe
    if exports["pma-voice"] then
        exports["pma-voice"]:setRadioChannel(freq)
    else
        print("^1[ERRO] pma-voice não encontrado!")
    end
end)

-- Sistema de Cura (Freeze e Animação)
RegisterNetEvent("dinastia:startHeal")
AddEventHandler("dinastia:startHeal", function(time)
    local ped = PlayerPedId()
    
    -- Salvar posição atual para evitar bugs
    local pos = GetEntityCoords(ped)
    
    FreezeEntityPosition(ped, true)
    SetEntityHealth(ped, 400) -- Enche a vida
    
    -- Animação deitado
    RequestAnimDict("amb@world_human_sunbathe@male@back@idle_a")
    while not HasAnimDictLoaded("amb@world_human_sunbathe@male@back@idle_a") do
        Citizen.Wait(100)
    end
    
    TaskPlayAnim(ped, "amb@world_human_sunbathe@male@back@idle_a", "idle_a", 8.0, -8.0, -1, 1, 0, false, false, false)
    
    local count = time / 1000
    while count > 0 do
        count = count - 1
        TriggerEvent("Notify", "importante", "Tratamento em curso: "..count.."s restantes.", 1000)
        Citizen.Wait(1000)
    end
    
    ClearPedTasks(ped)
    FreezeEntityPosition(ped, false)
    TriggerEvent("Notify", "sucesso", "Tratamento concluído! Você foi curado.")
end)

-- Abrir Painel
RegisterCommand("hp", function()
    SetNuiFocus(true, true)
    SendNUIMessage({ action = "open" })
end)

-- Callbacks do NUI
RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback("toggleDuty", function(data, cb)
    TriggerServerEvent("dinastia:toggleDuty", data.status)
    cb('ok')
end)

RegisterNUICallback("requestTreatment", function(data, cb)
    TriggerServerEvent("dinastia:requestTreatment", data.type)
    cb('ok')
end)

RegisterNUICallback("applyVaccine", function(data, cb)
    if data.id and data.id ~= "" then
        TriggerServerEvent("dinastia:applyVaccine", data.id)
    else
        TriggerEvent("Notify", "negado", "Digite o ID do paciente.")
    end
    cb('ok')
end)

RegisterNUICallback("sellItem", function(data, cb)
    if data.id and data.qtd and data.val then
        TriggerServerEvent("dinastia:trySale", data.id, "bandagem", data.qtd, data.val)
    else
        TriggerEvent("Notify", "negado", "Preencha todos os campos.")
    end
    cb('ok')
end)

-- Fechar com ESC
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 322) then -- ESC
            SetNuiFocus(false, false)
            SendNUIMessage({ action = "close" })
        end
    end
end)

-- Comando para debug (opcional)
RegisterCommand("testemaca", function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    print("Maca: { x = "..coords.x..", y = "..coords.y..", z = "..coords.z..", h = "..GetEntityHeading(ped).." },")
end)