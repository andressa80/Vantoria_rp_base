local recoils = {
	[453432689] = 0.25, -- pistol
	[3219281620] = 0.25,
	[1593441988] = 0.2,
	[584646201] = 0.3,

	[324215364] = 0.4, -- smg
	[736523883] = 0.15,
	[2024373456] = 0.1,

	[3220176749] = 0.6, -- rifle
	[961495388] = 0.2,
	[2210333304] = 0.7,
	[4208062921] = 0.15,

	[100416529] = 0.9, -- sniper
	[205991906] = 1.2,

	[487013001] = 0.35,
	[1432025498] = 0.3,
	[2017895192] = 0.6,
	[3800352039] = 0.35
}

-- CONFIG
local BASE_RECOIL = 0.0
local MULTIPLIER = 1.2
local RECOVERY_TIME = 300 -- tempo pra resetar spray

local lastShot = 0
local recoilCount = 0

Citizen.CreateThread(function()
	while true do
		local sleep = 500
		local ped = PlayerPedId()

		if IsPedArmed(ped,6) then
			sleep = 0

			-- 🚫 Bloqueio melee
			DisableControlAction(1,140,true)
			DisableControlAction(1,141,true)
			DisableControlAction(1,142,true)

			-- 🔫 Detecta tiro
			if IsPedShooting(ped) and not IsPedDoingDriveby(ped) then
				local _, weapon = GetCurrentPedWeapon(ped)

				if recoils[weapon] and recoils[weapon] > 0 then
					local now = GetGameTimer()

					-- 🧠 Reset spray se parar de atirar
					if (now - lastShot) > RECOVERY_TIME then
						recoilCount = 0
					end

					lastShot = now
					recoilCount = recoilCount + 1

					-- 🎯 Recoil progressivo
					local recoil = recoils[weapon] * (1 + (recoilCount * 0.05)) * MULTIPLIER

					ApplyRecoil(recoil)
				end
			end
		end

		Citizen.Wait(sleep)
	end
end)

----------------------------------------------------------
-- 🎯 FUNÇÃO DE RECOIL SUAVE
----------------------------------------------------------
function ApplyRecoil(amount)
	local steps = math.floor(amount * 10)
	local strength = amount / steps

	for i = 1, steps do
		Citizen.Wait(5)

		local pitch = GetGameplayCamRelativePitch()
		SetGameplayCamRelativePitch(pitch + strength, 0.2)
	end
end