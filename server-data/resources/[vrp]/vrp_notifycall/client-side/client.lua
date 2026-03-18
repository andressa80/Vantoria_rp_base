-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADFOCUS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- NOTIFY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("notify",function()
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 then
		SendNUIMessage({ action = "showAll" })
	end
end)

RegisterKeyMapping("notify","Abrir as notificações","keyboard","F2")

-----------------------------------------------------------------------------------------------------------------------------------------
-- NOTIFYPUSH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("NotifyPush")
AddEventHandler("NotifyPush",function(data)
	data.street = GetStreetNameFromHashKey(GetStreetNameAtCoord(data.x,data.y,data.z))

	SendNUIMessage({ action = "notify", data = data })

	-- 🔴 BLIP MELHORADO
	local blip = AddBlipForCoord(data.x,data.y,data.z)
	SetBlipSprite(blip,161)
	SetBlipColour(blip,1)
	SetBlipScale(blip,0.7)
	SetBlipFlashes(blip,true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(data.title)
	EndTextCommandSetBlipName(blip)

	SetTimeout(60000,function()
		RemoveBlip(blip)
	end)

	-- 🔊 SOM MELHORADO
	PlaySoundFrontend(-1,"Event_Message_Purple","GTAO_FM_Events_Soundset",false)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- NUI CALLBACKS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("focusOn",function()
	SetNuiFocus(true,true)
end)

RegisterNUICallback("focusOff",function()
	SetNuiFocus(false,false)
end)

RegisterNUICallback("setWay",function(data)
	SetNewWaypoint(data.x+0.0001,data.y+0.0001)
	SendNUIMessage({ action = "hideAll" })
end)

RegisterNUICallback("phoneCall",function(data)
	SendNUIMessage({ action = "hideAll" })
	TriggerEvent("gcPhone:callNotifyPush",data.phone)
end)