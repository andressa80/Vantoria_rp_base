local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

local radar = {
	shown = false,
	freeze = false,
	info = "INICIANDO RADAR...",
	info2 = "INICIANDO RADAR..."
}

local LIMITE = 120
local MULTA = 500
local COOLDOWN = 5000

local lastFine = {}

Citizen.CreateThread(function()
	while true do
		local sleep = 500
		local ped = PlayerPedId()

		if IsPedInAnyVehicle(ped) then
			local veh = GetVehiclePedIsIn(ped)

			-- 🔘 LIGAR RADAR
			if IsControlJustPressed(1,306) and IsPedInAnyPoliceVehicle(ped) then
				radar.shown = not radar.shown
			end

			-- 🔘 FREEZE
			if IsControlJustPressed(1,301) and IsPedInAnyPoliceVehicle(ped) then
				radar.freeze = not radar.freeze
			end

			if radar.shown then
				sleep = 5

				if not radar.freeze then
					----------------------------------------------------------
					-- 🚗 FRENTE
					----------------------------------------------------------
					local coordA = GetOffsetFromEntityInWorldCoords(veh,0.0,1.0,1.0)
					local coordB = GetOffsetFromEntityInWorldCoords(veh,0.0,80.0,0.0)

					local ray = StartShapeTestCapsule(coordA,coordB,3.0,10,veh,7)
					local _,_,_,_,vehicle = GetShapeTestResult(ray)

					if IsEntityAVehicle(vehicle) then
						local speed = GetEntitySpeed(vehicle) * 3.6
						local plate = GetVehicleNumberPlateText(vehicle)
						local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))

						radar.info = string.format("🚗 %s | %s | %d KM/H",plate,model,math.ceil(speed))

						-- 🔎 PUXAR DONO (vRP)
						local rows = vRP.query("vRP/get_vehicle",{ plate = plate })
						if rows[1] then
							local identity = vRP.getUserIdentity(rows[1].user_id)
							radar.info = radar.info .. string.format(" | 👤 %s [%s]", identity.name, rows[1].user_id)
						end

						-- 🚨 MULTA + SOM
						if speed > LIMITE then
							radar.info = radar.info .. " ~r~[MULTA]"
							PlaySoundFrontend(-1,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET",true)

							if not lastFine[plate] or (GetGameTimer() - lastFine[plate]) > COOLDOWN then
								lastFine[plate] = GetGameTimer()

								if rows[1] then
									vRP.execute("vRP/add_fine",{
										user_id = rows[1].user_id,
										amount = MULTA,
										text = "Radar: "..math.floor(speed).." KM/H"
									})

									-- 📸 LOG
									print("==== RADAR ====")
									print("Placa:", plate)
									print("Velocidade:", speed)
									print("Multado ID:", rows[1].user_id)
									print("================")
								end
							end
						end
					else
						radar.info = "🚗 NENHUM VEÍCULO NA FRENTE"
					end

					----------------------------------------------------------
					-- 🚗 ATRÁS
					----------------------------------------------------------
					local coordC = GetOffsetFromEntityInWorldCoords(veh,0.0,-80.0,0.0)

					local ray2 = StartShapeTestCapsule(coordA,coordC,3.0,10,veh,7)
					local _,_,_,_,vehicle2 = GetShapeTestResult(ray2)

					if IsEntityAVehicle(vehicle2) then
						local speed2 = GetEntitySpeed(vehicle2) * 3.6
						local plate2 = GetVehicleNumberPlateText(vehicle2)
						local model2 = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle2))

						radar.info2 = string.format("🚓 %s | %s | %d KM/H",plate2,model2,math.ceil(speed2))
					else
						radar.info2 = "🚓 NENHUM VEÍCULO ATRÁS"
					end
				end

				----------------------------------------------------------
				-- 🎨 HUD
				----------------------------------------------------------
				drawTxt("~b~RADAR POLICIAL",4,0.5,0.88,0.55,0,150,255,200)
				drawTxt(radar.info,4,0.5,0.91,0.45,255,255,255,200)
				drawTxt(radar.info2,4,0.5,0.94,0.45,255,255,255,200)

				if radar.freeze then
					drawTxt("~y~MODO CONGELADO",4,0.5,0.97,0.40,255,255,0,200)
				end
			end
		else
			radar.shown = false
		end

		Citizen.Wait(sleep)
	end
end)

---------------------------------------------------------------------
-- 🎨 TEXTO
---------------------------------------------------------------------
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