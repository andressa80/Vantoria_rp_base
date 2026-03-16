----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS HUD
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local plyInVehicle = false
local isPauseMenu = false
local cacheStreet = {}
local street = "Rua Hero da Silva Boliva Sauro"
local seatbelt = false
local lastTimer = GetGameTimer()
local hotkey = true
local voice = 1
local radio = 0
local radioDisplay = ""
local plyInfos = {
    active = true
}
local hudVisible = true

local vehInfos = {}
local cfgInfos = {
    hungerSystem = { active = Config.Hud.active },
    cupom = Config.Hud.cupom,
    assault = Config.Hud.assault,
    colors = Config.Hud.colors,
    dir = Config.NotifyItens.imgDir,
    filterCommands = Config.Chat.filter
}


RegisterNetEvent("hud:RadioDisplay")
AddEventHandler("hud:RadioDisplay", function(number)
    if parseInt(number) <= 0 then
        radioDisplay = ""
    else
        radioDisplay = parseInt(number)
    end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- MAIN THREADS HUD
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        local ped = PlayerPedId()

        if (GetGameTimer() - lastTimer) > 0 then
            local coords = GetEntityCoords(ped)

            local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
            if not cacheStreet[streetHash] then
                cacheStreet[streetHash] = GetStreetNameFromHashKey(streetHash)
            end
            street = cacheStreet[streetHash]

            lastTimer = (GetGameTimer() + 10000)
        end

        local heading = GetEntityHeading(ped)
        if heading >= 315 or heading < 45 then
            plyDirection = "Norte"
        elseif heading >= 45 and heading < 135 then
            plyDirection = "Oeste"
        elseif heading >= 135 and heading < 225 then
            plyDirection = "Sul"
        elseif heading >= 225 and heading < 315 then
            plyDirection = "Leste"
        end

        local hours = GetClockHours()
        local minutes = GetClockMinutes()

        if hours <= 9 then
            hours = "0" .. hours
        end

        if minutes <= 9 then
            minutes = "0" .. minutes
        end

        local pedMaxHealth = (GetPedMaxHealth(PlayerPedId()) or 200)
        local health = (GetEntityHealth(ped) - 100) * 100
        local calc_health = health / (pedMaxHealth - 100)

        if Config.Debug then
            print(calc_health)
        end

        plyInfos = {
            active = plyInfos.active,
            health = calc_health,
            armour = GetPedArmour(ped),
            hunger = plyInfos.hunger or 0,
            thrist = plyInfos.thrist or 0,
            hours = hours,
            minutes = minutes,
            direction = plyDirection,
            street = street,
            voice = voice or 1,
            radio = radioDisplay or 1,
            speaking = MumbleIsPlayerTalking(PlayerId()) == 1
        }

        if not plyInVehicle then
            SendNUIMessage({ action = "hud", vehicle = false, plyInfos = plyInfos, cfgInfos = cfgInfos, hotkey = hotkey })
        end

        DisplayRadar(plyInVehicle)

        Wait(Config.Hud.threadPlyDelay)
    end
end)

function initThreadVehicle(veh)
    local vehicle = veh

    CreateThread(function()
        while plyInVehicle do
            local ped = PlayerPedId()

            if IsPedSittingInAnyVehicle(ped) then
                local vehicle = GetVehiclePedIsUsing(ped)
                local doorstatus = (GetVehicleDoorLockStatus(vehicle) == 2)
                local _, lights, highlights = GetVehicleLightsState(vehicle)
                local engine = GetVehicleEngineHealth(vehicle) / 10
                local fuel = GetVehicleFuelLevel(vehicle)
                local speed = GetEntitySpeed(vehicle) * Config.Hud.speedometer
                local rpm = GetVehicleCurrentRpm(vehicle) * 100

                if lights == 1 and highlights == 0 then
                    lights = 1
                end

                if highlights == 1 then
                    lights = 2
                end

                vehInfos = {
                    active = true,
                    vehicle = veh,
                    speed = speed,
                    rpm = rpm,
                    doorstatus = doorstatus,
                    lights = lights,
                    engine = engine,
                    fuel = fuel,
                    seatbealt = vehInfos.seatbealt or false
                }

                if vehInfos.active then
                    SendNUIMessage({
                        action = "hud",
                        vehicle = true,
                        plyInfos = plyInfos,
                        vehInfos = vehInfos,
                        cfgInfos =
                            cfgInfos
                    })
                end
            end

            Wait(Config.Hud.threadVehicleDelay)
        end
    end)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- COMANDOS HUD
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping('mirtin:cinto_seguranca', 'Cinto de Seguranca', 'keyboard', Config.Hud.seatbelt.key)
RegisterCommand('mirtin:cinto_seguranca', function(source, args)
    if plyInVehicle and IsCar(vehInfos.vehicle) then
        vehInfos.seatbealt = not vehInfos.seatbealt

        if not vehInfos.seatbealt then
            SetFlyThroughWindscreenParams(15.0, 2.0, 0.0, 1800.0)
            TriggerEvent("vrp_sound:source", "unbelt", 0.5)
        else
            SetFlyThroughWindscreenParams(10000.0, 10000.0, 17.0, 500.0);
            TriggerEvent("vrp_sound:source", "belt", 0.5)
        end

        CreateThread(function()
            while vehInfos.seatbealt do
                DisableControlAction(0, 75)
                Wait(1)
            end
        end)
    end
end)

IsCar = function(veh)
    if plyInVehicle then
        local vc = GetVehicleClass(veh)
        return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
    end

    return false
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- HANDLER HUD
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler('gameEventTriggered', function(eventName, eventArgs)
    if eventName == 'CEventNetworkPlayerEnteredVehicle' then
        if eventArgs[1] == PlayerId() then
            plyInVehicle = true

            CreateThread(function()
                while plyInVehicle do
                    if not IsPedInAnyVehicle(PlayerPedId()) then
                        plyInVehicle = false
                    end
                    Wait(1000)
                end
            end)

            SetFlyThroughWindscreenParams(15.0, 2.0, 0.0, 1800.0)
            vehInfos.seatbealt = false
            initThreadVehicle(eventArgs[2])
        end
    end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- REGISTER EVENTS HUD
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent(Config.Hud.events.range, function(status)
    voice = status
end)



RegisterNetEvent(Config.Hud.foodSystem.eventHunger, function(status)
    plyInfos.hunger = status
end)

RegisterNetEvent(Config.Hud.foodSystem.eventThrist, function(status)
    plyInfos.thrist = status
end)

RegisterNetEvent("hud:status", function(status)
    plyInfos.active = status
end)

RegisterCommand('hud', function(source)
    plyInfos.active = not plyInfos.active
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- NOTIFY
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent(Config.Notify.eventName, function(css, message, timer)
    timer = parseInt(timer)
    if not timer or timer == "" or timer < 1000 then
        timer = 5000
    end

    SendNUIMessage({ action = "Notify", ntfInfos = { css = css, mensagem = message, timer = timer, hotkey = hotkey } })
end)

RegisterNetEvent(Config.Chat.eventNameAlerts, function(index, message, author)
    if not Config.Chat.Alerts[index] then return end

    SendNUIMessage({ action = "NotifyAlert", ntfInfos = { mensagem = message, author = author, title = Config.Chat.Alerts[index].title, timer = Config.Chat.Alerts[index].time * 1000, color = Config.Chat.Alerts[index].color, hotkey = hotkey } })
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PROGRESSBAR
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent(Config.ProgressBar.eventName, function(time, title)
    if tonumber(title) then time = parseInt(title) end
    if not title or tonumber(title) then title = "Carregando" end
    if time <= 1000 then time = time * 1000 end
    if time >= 100000 then time = time / 1000 end

    print("Tempo Enviado para o front-end: " .. time)

    SendNUIMessage({ action = "ProgressBar", pgInfos = { title = title, time = time, color = Config.ProgressBar.color, hotkey = hotkey } })
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OTHERS TUNNELS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterTunnel.GetClosestPlayers = function(dist)
    if not dist then dist = 10.0 end
    local peds = GetGamePool("CPed")
    local t = {}

    for i = 1, #peds do
        local ply = peds[i]
        local distance = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(ply))
        if IsPedAPlayer(ply) and distance < dist then
            t[#t + 1] = GetPlayerServerId(NetworkGetPlayerIndexFromPed(ply))
        end
    end

    return t
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- ITENSNOTIFY
-----------------------------------------------------------------------------------------------------------------------------------------
--[[RegisterNetEvent(Config.NotifyItens.eventName)
 AddEventHandler(Config.NotifyItens.eventName,function(mode, quantidade, itemname, idname, kgTotal)
     SendNUIMessage({ action = 'notifyItem', ntfItem = {mode = mode, quantidade = quantidade, nome = itemname, item = idname, kgTotal = kgTotal, hotkey = hotkey} })
 end)]]

-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVER COMPONENTES HUD
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    for i = 1, 51 do
        if i ~= 10 and i ~= 14 and i ~= 16 and i ~= 19 then
            SetHudComponentPosition(i, 1000.0001, 1000.0001)
        end
    end
end)

local Morto = false
local IsPaused = false
local HideHud = false

CreateThread(function()
    while true do
        if (GetEntityHealth(PlayerPedId()) <= 105) and not Morto then
            Morto = true
            HideHud = true
        end

        if (GetEntityHealth(PlayerPedId()) > 105) and Morto then
            Morto = false
            HideHud = false
        end

        --[[  if IsPauseMenuActive() then
            TriggerEvent('hud:status', false)
         else
            TriggerEvent('hud:status', true)
         end ]]

        if IsPauseMenuActive() then
            if not isPauseMenu then
                isPauseMenu = not isPauseMenu
                --   if hud then
                TriggerEvent('hud:status', false)
                -- end
            end
        else
            if isPauseMenu then
                isPauseMenu = not isPauseMenu
                --		if hud then
                TriggerEvent('hud:status', true)
                --      end
            end
        end


        SendNUIMessage({ action = 'hideHud', status = HideHud })
        Wait(1000)
    end
end)

RegisterKeyMapping('shortcuts', 'Atalhos', 'keyboard', 'u')
RegisterCommand("shortcuts", function()
    hotkey = false
end)
