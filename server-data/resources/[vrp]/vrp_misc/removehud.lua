-- 🔫 CONFIG DE DANO
Citizen.CreateThread(function()
	N_0xf4f2c0d4ee209e20()

	SetWeaponDamageModifier(GetHashKey("WEAPON_UNARMED"),1.2)
	SetWeaponDamageModifier(GetHashKey("WEAPON_KNIFE"),0.4)
	SetWeaponDamageModifier(GetHashKey("WEAPON_COMBATPISTOL"),1.1)
	SetWeaponDamageModifier(GetHashKey("WEAPON_MACHINEPISTOL"),1.2)
	SetWeaponDamageModifier(GetHashKey("WEAPON_PUMPSHOTGUN_MK2"),2.0)
end)

----------------------------------------------------------
-- 🧼 HUD (RODA LEVE)
----------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		for i = 1, 51 do
			HideHudComponentThisFrame(i)
		end
	end
end)

----------------------------------------------------------
-- 🚫 REMOVER PICKUPS (RODA 1 VEZ)
----------------------------------------------------------
Citizen.CreateThread(function()
	local pickups = {
		0x6C5B941A,0xF33C83B0,0xDF711959,0xB2B5325E
	}

	for _,pickup in ipairs(pickups) do
		RemoveAllPickupsOfType(pickup)
	end
end)

----------------------------------------------------------
-- 🚔 DESATIVAR SISTEMAS GTA (1 VEZ)
----------------------------------------------------------
Citizen.CreateThread(function()
	SetCreateRandomCops(false)
	SetGarbageTrucks(false)
	SetRandomBoats(false)
	DisablePlayerVehicleRewards(PlayerId())
end)

----------------------------------------------------------
-- 🚗 LIMPAR VEÍCULOS (CONTROLADO)
----------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000) -- a cada 10 segundos

		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(ped))

		RemoveVehiclesFromGeneratorsInArea(
			x-500.0,y-500.0,z-500.0,
			x+500.0,y+500.0,z+500.0
		)
	end
end)

----------------------------------------------------------
-- 🔥 MUNIÇÃO INFINITA (EXTINTOR)
----------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		SetPedInfiniteAmmo(PlayerPedId(),true,GetHashKey("WEAPON_FIREEXTINGUISHER"))
	end
end)