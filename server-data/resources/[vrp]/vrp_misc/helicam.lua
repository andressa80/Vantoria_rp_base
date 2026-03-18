-- CONFIGURAÇÕES DA CÂMERA
local fov_max = 80.0
local fov_min = 10.0
local zoomspeed = 2.0
local speed_lr = 3.0
local speed_ud = 3.0

-- CONTROLE
local helicam = false
local fov = (fov_max+fov_min)*0.5

-- 🎯 SISTEMA DE LOCK
local lockedVehicle = nil
local isLocked = false

-- THREAD PRINCIPAL
Citizen.CreateThread(function()
	while true do
        local idle = 1000

		-- 🚁 VERIFICA SE ESTÁ EM HELICÓPTERO POLICIAL
		if IsPlayerInPolmav() then
			idle = 5
			local heli = GetVehiclePedIsIn(PlayerPedId())

			-- 🔇 DESLIGA RÁDIO
			SetVehicleRadioEnabled(heli,false)

			-- ALTURA MÍNIMA
			if IsHeliHighEnough(heli) then

				-- ATIVAR HELICAM (E)
				if IsControlJustPressed(0,51) then
					PlaySoundFrontend(-1,"SELECT","HUD_FRONTEND_DEFAULT_SOUNDSET",false)
					helicam = true
				end

				-- RAPPEL (H)
				if IsControlJustPressed(0,154) then
					if GetPedInVehicleSeat(heli,1) == PlayerPedId() or GetPedInVehicleSeat(heli,2) == PlayerPedId() then
						PlaySoundFrontend(-1,"SELECT","HUD_FRONTEND_DEFAULT_SOUNDSET",false)
						TaskRappelFromHeli(PlayerPedId(),1)
					end
				end
			end
		end

		-- 🚁 HELICAM ATIVA
		if helicam then
			SetTimecycleModifier("heliGunCam")
			SetTimecycleModifierStrength(0.3)

			local scaleform = RequestScaleformMovie("HELI_CAM")
			while not HasScaleformMovieLoaded(scaleform) do
				Citizen.Wait(10)
			end

			local heli = GetVehiclePedIsIn(PlayerPedId())

			-- 🎥 CRIA CÂMERA
			local cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA",true)
			AttachCamToEntity(cam,heli,0.0,0.0,-1.5,true)
			SetCamRot(cam,0.0,0.0,GetEntityHeading(heli))
			SetCamFov(cam,fov)

			RenderScriptCams(true, false, 0, 1, 0)

			while helicam and not IsEntityDead(PlayerPedId()) and (GetVehiclePedIsIn(PlayerPedId()) == heli) and IsHeliHighEnough(heli) do
				
				-- DESLIGAR HELICAM
				if IsControlJustPressed(0,51) then
					helicam = false
				end

				-- 🎯 PEGAR VEÍCULO NA MIRA
				local vehicle = GetVehicleInCrosshair(cam)

				-- 🔒 TRAVAR ALVO (BOTÃO DIREITO)
				if IsControlJustPressed(0,25) then
					if vehicle then
						lockedVehicle = vehicle
						isLocked = true
					end
				end

				-- ❌ DESTRAVAR (BACKSPACE)
				if IsControlJustPressed(0,177) then
					lockedVehicle = nil
					isLocked = false
				end

				-- 🎯 COMPORTAMENTO DO LOCK
				if isLocked and lockedVehicle then
					PointCamAtEntity(cam, lockedVehicle, 0.0, 0.0, 0.0, true)

					local plate = GetVehiclePlate(lockedVehicle)

					DrawHeliText("~r~ALVO TRAVADO", 0.45, 0.85)
					DrawHeliText("PLACA: "..plate, 0.45, 0.88)
				else
					if vehicle then
						local plate = GetVehiclePlate(vehicle)
						DrawHeliText("PLACA: "..plate, 0.45, 0.88)
					end
				end

				-- CONTROLE DA CÂMERA
				local zoomvalue = (1.0/(fov_max-fov_min))*(fov-fov_min)
				CheckInputRotation(cam,zoomvalue)
				HandleZoom(cam)
				HideHUDThisFrame()

				Citizen.Wait(5)
			end

			-- RESET
			helicam = false
			ClearTimecycleModifier()
			fov = (fov_max+fov_min)*0.5
			RenderScriptCams(false,false,0,1,0)
			DestroyCam(cam,false)
			SetNightvision(false)
			SetSeethrough(false)
		end

		Citizen.Wait(idle)
	end
end)

-- 🚁 VERIFICA HELI
function IsPlayerInPolmav()
	local vehicle = GetVehiclePedIsIn(PlayerPedId())
	return IsVehicleModel(vehicle,GetHashKey("paramedicoheli")) or IsVehicleModel(vehicle,GetHashKey("policiaheli"))
end

-- ALTURA
function IsHeliHighEnough(heli)
	return GetEntityHeightAboveGround(heli) > 1.5
end

-- ESCONDER HUD
function HideHUDThisFrame()
	HideHelpTextThisFrame()
	HideHudAndRadarThisFrame()
end

-- 🎯 PEGAR VEÍCULO NA MIRA
function GetVehicleInCrosshair(cam)
	local coords = GetCamCoord(cam)
	local forward = RotAnglesToVec(GetCamRot(cam, 2))

	local ray = CastRayPointToPoint(coords, coords + (forward * 200.0), 10, PlayerPedId(), 0)
	local _, _, _, _, entityHit = GetRaycastResult(ray)

	if entityHit and IsEntityAVehicle(entityHit) then
		return entityHit
	end

	return nil
end

-- 🚔 PLACA
function GetVehiclePlate(vehicle)
	if vehicle and DoesEntityExist(vehicle) then
		return GetVehicleNumberPlateText(vehicle)
	end
	return "N/A"
end

-- 🎥 CONTROLE CÂMERA
function CheckInputRotation(cam,zoomvalue)
	local rightAxisX = GetDisabledControlNormal(0,220)
	local rightAxisY = GetDisabledControlNormal(0,221)
	local rotation = GetCamRot(cam,2)

	if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
		local new_z = rotation.z+rightAxisX*-1.0*(speed_ud)*(zoomvalue+0.1)
		local new_x = math.max(math.min(20.0,rotation.x+rightAxisY*-1.0*(speed_lr)*(zoomvalue+0.1)),-89.5)
		SetCamRot(cam,new_x,0.0,new_z,2)
	end
end

-- 🔍 ZOOM
function HandleZoom(cam)
	if IsControlJustPressed(0,241) then
		fov = math.max(fov-zoomspeed,fov_min)
	end

	if IsControlJustPressed(0,242) then
		fov = math.min(fov+zoomspeed,fov_max)
	end

	local current_fov = GetCamFov(cam)

	if math.abs(fov-current_fov) < 0.1 then
		fov = current_fov
	end

	SetCamFov(cam,current_fov+(fov-current_fov)*0.05)
end

-- 🎯 DIREÇÃO DA CÂMERA
function RotAnglesToVec(rot)
	local z = math.rad(rot.z)
	local x = math.rad(rot.x)
	local num = math.abs(math.cos(x))
	return vector3(-math.sin(z)*num,math.cos(z)*num,math.sin(x))
end

-- 📺 TEXTO HELICAM
function DrawHeliText(text, x, y)
	SetTextFont(4)
	SetTextScale(0.45, 0.45)
	SetTextColour(0, 255, 0, 200)
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end