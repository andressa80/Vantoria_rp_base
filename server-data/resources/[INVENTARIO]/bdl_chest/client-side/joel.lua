local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

--[ CONEXÃO ]----------------------------------------------------------------------------------------------------------------------------

src = {}
Tunnel.bindInterface("bdl_chest",src)
vSERVER = Tunnel.getInterface("bdl_chest")

--[ VARIAVEIS ]--------------------------------------------------------------------------------------------------------------------------

local chestTimer = 0
local chestOpen = ""
onMenu = false


--[ CHESTCLOSE ]-------------------------------------------------------------------------------------------------------------------------

RegisterNUICallback("chestClose",function(data)
	onMenu = false
	TransitionFromBlurred(1000)
	SetNuiFocus(false,false)
	TriggerEvent("bdl:triggerhud")
	SendNUIMessage({ action = "hideMenu" })
end)

--[ TAKEITEM ]---------------------------------------------------------------------------------------------------------------------------

RegisterNUICallback("takeItem",function(data)
	vSERVER.takeItem(tostring(chestOpen),data.item,data.amount)
end)

--[ STOREITEM ]--------------------------------------------------------------------------------------------------------------------------

RegisterNUICallback("storeItem",function(data)
	vSERVER.storeItem(tostring(chestOpen),data.item,data.amount)
end)

--[ AUTO-UPDATE ]------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("Chest:UpdateChest")
AddEventHandler("Chest:UpdateChest",function(action)
	SendNUIMessage({ action = action })
end)

--[ REQUESTCHEST ]-----------------------------------------------------------------------------------------------------------------------

RegisterNUICallback("requestChest",function(data,cb)
	local inventario,inventario2,peso,maxpeso,peso2,maxpeso2 = vSERVER.openChest(tostring(chestOpen))
	if inventario then
		cb({ inventario = inventario, inventario2 = inventario2, peso = peso, maxpeso = maxpeso, peso2 = peso2, maxpeso2 = maxpeso2 })
	end
end)

--[ VARIAVEIS ]--------------------------------------------------------------------------------------------------------------------------

local chest = {
	{ "mafia",-1881.88,2064.0,135.92,0,140,255, "[~b~E~w~] Para ~b~ABRIR~w~ o baú da ~b~MAFIA~w~" },
	{ "dpnorte",2520.14,-325.62,101.9,255,25,25, "[~r~E~w~] Para ~r~ABRIR~w~ o baú da ~r~DP~w~" },
	{ "dpcivil",436.69, -991.01, 30.69,255,25,25, "[~r~E~w~] Para ~r~ABRIR~w~ o baú da ~r~DP~w~" },
	{ "TDT",1413.17, -729.76, 71.82,255,180,0, "[~y~E~w~] Para ~y~ABRIR~w~ o baú da ~y~TDT~w~" },
	
	{ "TDJ",429.69,4.57,91.94,25,255,25, "[~g~E~w~] Para ~g~ABRIR~w~ o baú da ~g~TDJ.~w~" },
	{ "TDB",862.84, -251.38, 68.34,130,0,255, "[~p~E~w~] Para ~p~ABRIR~w~ o baú dos ~p~TDB~w~" },
	{ "TDF",2045.5, 3377.27, 47.77,255,255,25, "[~y~E~w~] Para ~y~ABRIR~w~ o baú dos ~y~TDF~w~" },
	
	{ "cartel",1403.06, 1152.65, 114.34,50,50,50, "[~c~E~w~] Para ~c~ABRIR~w~ o baú do ~c~CARTEL~w~" },
	{ "vanilla",-1795.78,-3128.79,13.95,50,50,50, "[~c~E~w~] Para ~c~ABRIR~w~ o baú do ~c~VANILLA~w~" },
	{ "bennys",-196.45, -1314.67, 31.27,50,50,50, "[~c~E~w~] Para ~c~ABRIR~w~ o baú da ~c~BENNYS~w~" },
}

--[ CHESTTIMER ]-------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)
		if chestTimer > 0 then
			chestTimer = chestTimer - 3
		end
	end
end)

--[ CHEST ]------------------------------------------------------------------------------------------------------------------------------

RegisterCommand("chest",function(source,args)
	local ped = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(ped))
	for k,v in pairs(chest) do
		local distance = GetDistanceBetweenCoords(x,y,z,v[2],v[3],v[4],true)
		if distance <= 2.0 and chestTimer <= 0 then
			chestTimer = 3
			if vSERVER.checkIntPermissions(v[1]) then
				onMenu = true
				TransitionToBlurred(1000)
				SetNuiFocus(true,true)
				TriggerEvent("bdl:triggerhud")
				SendNUIMessage({ action = "showMenu" })
				chestOpen = tostring(v[1])
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(ped))
		for k,v in pairs(chest) do
			local distance = GetDistanceBetweenCoords(x,y,z,v[2],v[3],v[4],true)
			if distance < 5 then
				if not onMenu then
					idle = 5
					DrawMarker(23,v[2],v[3],v[4]-1,0,0,0,0,180.0,130.0,1.2,1.2,1.2,v[5],v[6],v[7],50,0,0,0,1)
					if distance <= 2 then
						DrawText3D(v[2],v[3],v[4],v[8])
						if distance < 1.1 then
							if IsControlJustPressed(0,38) and chestTimer <= 0 then
								chestTimer = 3
								if vSERVER.checkIntPermissions(v[1]) then
									onMenu = true
									TransitionToBlurred(1000)
									SetNuiFocus(true,true)
									TriggerEvent("bdl:triggerhud")
									SendNUIMessage({ action = "showMenu" })
									chestOpen = tostring(v[1])
								end
							end
						end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.40, 0.40)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end