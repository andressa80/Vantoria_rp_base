local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
local idgens = Tools.newIDGenerator()
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookarsenal = "https://discord.com/api/webhooks/838788240767975444/EALG_Wnt-8Ol-v6jxRdFSCaIW9joKwJliYFStv7Ddm31s-DSgtAe1f8Mb1egTdp28oKo"
local webhookprender = "https://canary.discord.com/api/webhooks/878623283631771728/oLarHPjUiqzSWEpjV4ZssCAIW4qTPr4U76WlAK7X4XgVcOtsC8WwtwvzNkp--ltVINWU"
local webhookmultas = "https://canary.discord.com/api/webhooks/878623574863282186/UomP3KL3jsbC0_9ry2piC7bLd3vgTjX8OynRh_eYA46fSBnlmik_ell3lRHnWevisB26"
local webhookocorrencias = "https://canary.discord.com/api/webhooks/878623731176575016/uarvcep5j53-Dhs1My_fZcsSO5yHZEOoGiqJsywzC0gHnFmKqc2HHNlD6BSdge-9IKIt"
local webhookdetido = "https://canary.discord.com/api/webhooks/878624978994610237/gDo8JnBJZ9r4CqSY-NwEuXQ-yEOJ7Sd7wM6T6f-1Tkg1V966_zgyfpyuKCU9lS-wSgr0"
local webhookponto = "https://discord.com/api/webhooks/852276964604772452/PHScB7f1dDNwFp0XQCsLAi7iM_3AYjfQ0_6-mSQTzbpRh8Tx8wd9YBU8cNRQsqP3c0Gr"
local webhookparamedico = "https://discord.com/api/webhooks/852270950636322847/N1HddbibtojbiXWZpn24WUrQ-t683Z27RfUUhrTHnuGHNcrbXe2i32T9dP7ZPeQk0hdi"
local webhookmecanico = "https://discord.com/api/webhooks/852270950636322847/N1HddbibtojbiXWZpn24WUrQ-t683Z27RfUUhrTHnuGHNcrbXe2i32T9dP7ZPeQk0hdi"
local webhookre = "https://discord.com/api/webhooks/838789605490294815/a5dkpewRgNtisELYV3kXk7r1C9VaUkTtPCZ4d2PA6XojZd0j2RlMEwFIl5KrxL157eIJ"
local webhookpoliciaapreendidos = "https://canary.discord.com/api/webhooks/878623880275722280/z5EXVRF5vxgLf_5DkmBNoV7VMTJQ-DoqQ6fhQMSw4uaXquk5eGGuk72tQ52rMTzhWEqI"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLACA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('placa',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"policia.permissao") or vRP.terPemissao(user_id,"desmanche.permissao") then
		if args[1] then
			local user_id = vRP.getUserByRegistration(args[1])
			if user_id then
				local identity = vRP.getUserIdentity(user_id)
				if identity then
					vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
					TriggerClientEvent('chatMessage',source,"911",{64,64,255},"^1Passaporte: ^0"..identity.user_id.."   ^2|   ^1Placa: ^0"..identity.registration.."   ^2|   ^1Proprietário: ^0"..identity.name.." "..identity.firstname.."   ^2|   ^1Idade: ^0"..identity.age.." anos   ^2|   ^1Telefone: ^0"..identity.phone)
				end
			else
				TriggerClientEvent("Notify",source,"importante","Placa inválida ou veículo de americano.")
			end
		else
			local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,7)
			local placa_user = vRP.getUserByRegistration(placa)
			if placa then
				if placa_user then
					local identity = vRP.getUserIdentity(placa_user)
					if identity then
						local vehicleName = vRP.vehicleName(vname)
						vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
						TriggerClientEvent('chatMessage',source,"911",{64,64,255},"^1Passaporte: ^0"..identity.user_id.."   ^2|   ^1Placa: ^0"..identity.registration.."   ^2|   ^1Placa: ^0"..identity.registration.."   ^2|   ^1Proprietário: ^0"..identity.name.." "..identity.firstname.."   ^2|   ^1Modelo: ^0"..vehicleName.."   ^2|   ^1Idade: ^0"..identity.age.." anos   ^2|   ^1Telefone: ^0"..identity.phone)
					end
				else
					TriggerClientEvent("Notify",source,"importante","Placa inválida ou veículo de americano.")
				end
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- bvida
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('bruxo',function(source,rawCommand)
	local user_id = vRP.getUserId(source)		
		vRPclient._setCustomization(source,vRPclient.getCustomization(source))
		vRP.removeCloak(source)			
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- PTR
 ----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ptr2', function(source,args,rawCommand)
 	local user_id = vRP.getUserId(source)
 	local player = vRP.getUserSource(user_id)
 	local oficiais = vRP.getUsersByPermission("policia.permissao")
 	local paramedicos = 0
 	local oficiais_nomes = ""
 	if vRP.terPemissao(user_id,"policia.permissao") or vRP.terPemissao(user_id,"admin.permissao") then
 		for k,v in ipairs(oficiais) do
 			local identity = vRP.getUserIdentity(parseInt(v))
 			oficiais_nomes = oficiais_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.firstname .. "<br>"
 			paramedicos = paramedicos + 1
 		end
 		TriggerClientEvent("Notify",source,"importante", "Atualmente <b>"..paramedicos.." Oficiais</b> em serviço.")
 		if parseInt(paramedicos) > 0 then
 			TriggerClientEvent("Notify",source,"importante", oficiais_nomes)
 		end
 	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PTR
 ----------------------------------------------------------------------------------------------------------------------------------------
 RegisterCommand('ptr', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local oficiais = vRP.getUsersByPermission("policia.permissao")
	local paramedicos = 0
	local oficiais_nomes = ""
	--if vRP.terPemissao(user_id,"policia.permissao") or vRP.terPemissao(user_id,"admin.permissao") then
		for k,v in ipairs(oficiais) do
			--local identity = vRP.getUserIdentity(parseInt(v))
			--oficiais_nomes = oficiais_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.firstname .. "<br>"
			paramedicos = paramedicos + 1
		end
		vRP.tryFullPayment(user_id, 150)
		TriggerClientEvent("Notify",source,"importante", "Atualmente <b>"..paramedicos.." Oficiais</b> em serviço.")
		TriggerClientEvent("Notify",source,"negado","Você gastou <b>150$</b>.",5000)
		TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		if parseInt(paramedicos) > 0 then
			TriggerClientEvent("Notify",source,"importante", oficiais_nomes)
		end
	--end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EMS
 ----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ems', function(source,args,rawCommand)
 	local user_id = vRP.getUserId(source)
 	local player = vRP.getUserSource(user_id)
 	local oficiais = vRP.getUsersByPermission("paramedico.permissao")
 	local paramedicos = 0
 	local paramedicos_nomes = ""
 	--if vRP.terPemissao(user_id,"paramedico.permissao") or vRP.terPemissao(user_id,"admin.permissao") then
 		for k,v in ipairs(oficiais) do
 			local identity = vRP.getUserIdentity(parseInt(v))
 			paramedicos_nomes = paramedicos_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.firstname .. "<br>"
 			paramedicos = paramedicos + 1
 		end
		TriggerClientEvent("Notify",source,"importante", "Atualmente <b>"..paramedicos.." Paramédicos</b> em serviço.")
		TriggerClientEvent("vrp_sound:source",source,'message',0.5)
 		if parseInt(paramedicos) > 0 then
	 		TriggerClientEvent("Notify",source,"importante", paramedicos_nomes)
	 	end
 	--end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MECANICOS
 ----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mecs', function(source,args,rawCommand)
 	local user_id = vRP.getUserId(source)
 	local player = vRP.getUserSource(user_id)
 	local oficiais = vRP.getUsersByPermission("callmec.permissao")
 	local paramedicos = 0
 	local oficiais_nomes = ""
 	--if vRP.terPemissao(user_id,"mecanicolider.permissao") or vRP.terPemissao(user_id,"admin.permissao") then
 		for k,v in ipairs(oficiais) do
 			local identity = vRP.getUserIdentity(parseInt(v))
 			oficiais_nomes = oficiais_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.firstname .. "<br>"
 			paramedicos = paramedicos + 1
 		end
 		TriggerClientEvent("Notify",source,"importante", "Atualmente <b>"..paramedicos.." Mecânicos</b> em serviço.")
 		if parseInt(paramedicos) > 0 then
			TriggerClientEvent("Notify",source,"importante", oficiais_nomes)
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
 		end
 	--end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- P
-----------------------------------------------------------------------------------------------------------------------------------------
local policia = {}
RegisterCommand('p',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local uplayer = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if vRPclient.getHealth(source) > 100 then
		if vRP.terPemissao(user_id,"policia.permissao") then
			local soldado = vRP.getUsersByPermission("policia.permissao")
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player and player ~= uplayer then
					async(function()
						local id = idgens:gen()
						policia[id] = vRPclient.addBlip(player,x,y,z,153,84,"Localização de "..identity.name.." "..identity.firstname,0.5,false)
						TriggerClientEvent("NotifyPush",player,{ code = 31, title = "Localização recebida de <b>"..identity.name.." "..identity.firstname.."</b>.", x = x, y = y, z = z, badge = "Localização." })
						vRPclient._playSound(player,"Out_Of_Bounds_Timer","DLC_HEISTS_GENERAL_FRONTEND_SOUNDS")
						SetTimeout(60000,function() vRPclient.removeBlip(player,policia[id]) idgens:free(id) end)
					end)
				end
			end
			TriggerClientEvent("Notify",source,"sucesso","Localização enviada com sucesso.")
			vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 911
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('911',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if vRP.terPemissao(user_id,"policia.permissao") or vRP.terPemissao(user_id,"juiz.permissao") or vRP.terPemissao(user_id,"advogado.permissao") then
			if user_id then
				TriggerClientEvent('chatMessage',-1,identity.name.." "..identity.firstname,{64,64,255},rawCommand:sub(4))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('pd',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "policia.permissao"
		if vRP.terPemissao(user_id,permission) then
			local soldado = vRP.getUsersByPermission(permission)
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname,{64,179,255},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 112
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('112',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if vRP.terPemissao(user_id,"paramedico.permissao") then
			if user_id then
				TriggerClientEvent('chatMessage',-1,identity.name.." "..identity.firstname,{255,70,135},rawCommand:sub(4))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('pr',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "paramedico.permissao"
		if vRP.terPemissao(user_id,permission) then
			local soldado = vRP.getUsersByPermission(permission)
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname,{255,175,175},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYTOW
-----------------------------------------------------------------------------------------------------------------------------------------
--[[RegisterCommand('paytow',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"policia.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			local nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				vRP.giveMoney(nuser_id,200)
				vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
				vRPclient._playAnim(nplayer,true,{{"mp_common","givetake1_a"}},false)
				TriggerClientEvent("Notify",source,"sucesso","Efetuou o pagamento pelo serviço do mecânico.")
				TriggerClientEvent("Notify",nplayer,"sucesso","Recebeu <b>$200 dólares</b> pelo serviço de mecânico.") as
			end
		end
	end
end)]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- TOOGLE
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('toogle',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

	  -- RECRUTA --------------------------------------------------------------------------------------------------------------------------
	if vRP.terPemissao(user_id,"recruta.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaRecruta")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[RECRUTA]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.terPemissao(user_id,"recruta.folga") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"Recruta")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[RECRUTA]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		
	  -------------------------------------------------------------------------------------------------------------------------------------
	  -- SOLDADO --------------------------------------------------------------------------------------------------------------------------
    elseif vRP.terPemissao(user_id,"soldado.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaSoldado")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[SOLDADO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	
	elseif vRP.terPemissao(user_id,"soldado.folga") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"Soldado")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[SOLDADO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  -------------------------------------------------------------------------------------------------------------------------------------
	  -- SARGENTO -------------------------------------------------------------------------------------------------------------------------
    elseif vRP.terPemissao(user_id,"sargento.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaSargento")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[SARGENTO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	
	elseif vRP.terPemissao(user_id,"sargento.folga") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"Sargento")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[SARGENTO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  -------------------------------------------------------------------------------------------------------------------------------------
	  -- TENENTE -------------------------------------------------------------------------------------------------------------------------
    elseif vRP.terPemissao(user_id,"tenente.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaTenente")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[TENENTE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	
	elseif vRP.terPemissao(user_id,"tenente.folga") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"Tenente")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[TENENTE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  -------------------------------------------------------------------------------------------------------------------------------------
	  -- CAPITÃO -------------------------------------------------------------------------------------------------------------------------
    elseif vRP.terPemissao(user_id,"capitao.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaCapitão")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[CAPITAO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	
	elseif vRP.terPemissao(user_id,"capitao.folga") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"Capitão")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[CAPITAO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  -------------------------------------------------------------------------------------------------------------------------------------
	  -- TENENTE CORONEL -------------------------------------------------------------------------------------------------------------------------
    elseif vRP.terPemissao(user_id,"tencoronel.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaTenCoronel")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[TEN. CORONEL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.terPemissao(user_id,"tencoronel.folga") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"TenCoronel")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[TEN. CORONEL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  -------------------------------------------------------------------------------------------------------------------------------------
	  -- CORONEL -------------------------------------------------------------------------------------------------------------------------
    elseif vRP.terPemissao(user_id,"coronel.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaCoronel")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[CORONEL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	
	elseif vRP.terPemissao(user_id,"coronel.folga") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"Coronel")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[CORONEL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  -------------------------------------------------------------------------------------------------------------------------------------
	  	elseif vRP.terPemissao(user_id,"cabo.permissao") then
		vRP.addUserGroup(user_id,"PaisanaCabo")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	elseif vRP.terPemissao(user_id,"paisanacabo.permissao") then
		vRP.addUserGroup(user_id,"Cabo")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	-------------------------------------------------------------------------------------------------------------------------------------
		  	elseif vRP.terPemissao(user_id,"major.permissao") then
		vRP.addUserGroup(user_id,"PaisanaMajor")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	elseif vRP.terPemissao(user_id,"paisanamajor.permissao") then
		vRP.addUserGroup(user_id,"Major")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	-------------------------------------------------------------------------------------------------------------------------------------
			  	elseif vRP.terPemissao(user_id,"subcomando.permissao") then
		vRP.addUserGroup(user_id,"PaisanaSubComando")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	elseif vRP.terPemissao(user_id,"paisanasubcomando.permissao") then
		vRP.addUserGroup(user_id,"SubComando")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	-------------------------------------------------------------------------------------------------------------------------------------
				  	elseif vRP.terPemissao(user_id,"subtenente.permissao") then
		vRP.addUserGroup(user_id,"PaisanaSubTenente")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	elseif vRP.terPemissao(user_id,"paisanasubtenente.permissao") then
		vRP.addUserGroup(user_id,"SubTenente")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	-------------------------------------------------------------------------------------------------------------------------------------
elseif vRP.terPemissao(user_id,"aspirante.permissao") then
	vRP.addUserGroup(user_id,"PaisanaAspirante")
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
elseif vRP.terPemissao(user_id,"paisanaaspirante.permissao") then
	vRP.addUserGroup(user_id,"Aspirante")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
-------------------------------------------------------------------------------------------------------------------------------------
elseif vRP.terPemissao(user_id,"comandantegeral.permissao") then
	vRP.addUserGroup(user_id,"PaisanaComandanteGeral")
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
elseif vRP.terPemissao(user_id,"paisanacomandantegeral.permissao") then
	vRP.addUserGroup(user_id,"ComandanteGeral")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
-------------------------------------------------------------------------------------------------------------------------------------
elseif vRP.terPemissao(user_id,"escrivao.permissao") then
	vRP.addUserGroup(user_id,"PaisanaEscrivao")
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
elseif vRP.terPemissao(user_id,"paisanaescrivao.permissao") then
	vRP.addUserGroup(user_id,"Escrivao")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
-------------------------------------------------------------------------------------------------------------------------------------
elseif vRP.terPemissao(user_id,"delegadopc.permissao") then
	vRP.addUserGroup(user_id,"PaisanaDelegadoPC")
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
elseif vRP.terPemissao(user_id,"paisanadelegadopc.permissao") then
	vRP.addUserGroup(user_id,"DelegadoPC")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
---------------------------------------------------------------------------------------
elseif vRP.terPemissao(user_id,"investigador.permissao") then
	vRP.addUserGroup(user_id,"PaisanaInvestigador")
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
elseif vRP.terPemissao(user_id,"paisanainvestigador.permissao") then
	vRP.addUserGroup(user_id,"Investigador")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
---------------------------------------------------------------------------------------
elseif vRP.terPemissao(user_id,"prfterceiraclasse.permissao") then
	vRP.addUserGroup(user_id,"PaisanaPRFTerceiraClasse")
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
elseif vRP.terPemissao(user_id,"paisanaprfterceiraclasse.permissao") then
	vRP.addUserGroup(user_id,"PRFTerceiraClasse")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
---------------------------------------------------------------------------------------
elseif vRP.terPemissao(user_id,"prfsegundaclasse.permissao") then
	vRP.addUserGroup(user_id,"PaisanaPRFSegundaClasse")
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
elseif vRP.terPemissao(user_id,"paisanaprfsegundaclasse.permissao") then
	vRP.addUserGroup(user_id,"PRFSegundaClasse")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
---------------------------------------------------------------------------------------
elseif vRP.terPemissao(user_id,"prfprimeiraclasse.permissao") then
	vRP.addUserGroup(user_id,"PaisanaPRFPrimeiraClasse")
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
elseif vRP.terPemissao(user_id,"paisanaprfprimeiraclasse.permissao") then
	vRP.addUserGroup(user_id,"PRFPrimeiraClasse")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
---------------------------------------------------------------------------------------
elseif vRP.terPemissao(user_id,"prfespecial.permissao") then
	vRP.addUserGroup(user_id,"PaisanaPRFEspecial")
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
elseif vRP.terPemissao(user_id,"paisanaprfespecial.permissao") then
	vRP.addUserGroup(user_id,"PRFEspecial")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
---------------------------------------------------------------------------------------
	-------- Hospital
	----------------------------------------------------------------------------------------------------------------------------

				  	elseif vRP.terPemissao(user_id,"enfermeirohp.permissao") then
		vRP.addUserGroup(user_id,"PaisanaEnfermeiroHP")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	elseif vRP.terPemissao(user_id,"paisanaenfermeirohp.permissao") then
		vRP.addUserGroup(user_id,"EnfermeiroHP")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	-----------------------------------------------------------------------------------------------------------------------------------
				  	elseif vRP.terPemissao(user_id,"paramedicohp.permissao") then
		vRP.addUserGroup(user_id,"PaisanaParamedicoHP")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	elseif vRP.terPemissao(user_id,"paisanaparamedicohp.permissao") then
		vRP.addUserGroup(user_id,"ParamedicoHP")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	----------------------------------------------------------------------------------------------------------------------------------
	elseif vRP.terPemissao(user_id,"medicohp.permissao") then
		vRP.addUserGroup(user_id,"PaisanaMedicoHP")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	elseif vRP.terPemissao(user_id,"paisanamedicohp.permissao") then
		vRP.addUserGroup(user_id,"MedicoHP")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	----------------------------------------------------------------------------------------------------------------------------------	
	elseif vRP.terPemissao(user_id,"medicochefehp.permissao") then
		vRP.addUserGroup(user_id,"PaisanaMedicoChefeHP")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	elseif vRP.terPemissao(user_id,"paisanamedicochefehp.permissao") then
		vRP.addUserGroup(user_id,"MedicoChefeHP")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	---------------------------------------------------------------------------------------------------------------------------------- 
	elseif vRP.terPemissao(user_id,"diretorhp.permissao") then
		vRP.addUserGroup(user_id,"PaisanaDiretorHP")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	elseif vRP.terPemissao(user_id,"paisanadiretorhp.permissao") then
		vRP.addUserGroup(user_id,"DiretorHP")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	----------------------------------------------------------------------------------------------------------------------------------
	elseif vRP.terPemissao(user_id,"vicediretorhp.permissao") then
		vRP.addUserGroup(user_id,"PaisanaViceDiretorHP")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	elseif vRP.terPemissao(user_id,"paisanavicediretorhp.permissao") then
		vRP.addUserGroup(user_id,"ViceDiretorHP")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	----------------------------------------------------------------------------------------------------------------------------------

	--------------------------------------------------------------------------------------------------------------------------------
	-------------------- Mecanica Sense Customs -----------
	--------------------------------------------------------------------------------------------------------------------------------
elseif vRP.terPemissao(user_id,"liderls.permissao") then
		vRP.addUserGroup(user_id,"PaisanaLiderLS")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	elseif vRP.terPemissao(user_id,"paisanaliderls.permissao") then
		vRP.addUserGroup(user_id,"LiderLS")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	-----------------------------------------------------------------------------------
elseif vRP.terPemissao(user_id,"viceliderls.permissao") then
	vRP.addUserGroup(user_id,"PaisanaViceLiderLS")
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
elseif vRP.terPemissao(user_id,"paisanaviceliderls.permissao") then
	vRP.addUserGroup(user_id,"ViceLiderLS")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
-----------------------------------------------------------------------------------
elseif vRP.terPemissao(user_id,"gerentels.permissao") then
	vRP.addUserGroup(user_id,"PaisanaGerenteLS")
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
elseif vRP.terPemissao(user_id,"paisanagerentels.permissao") then
	vRP.addUserGroup(user_id,"GerenteLS")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
-----------------------------------------------------------------------------------
elseif vRP.terPemissao(user_id,"tunagemls.permissao") then
	vRP.addUserGroup(user_id,"PaisanaTunagemLS")
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
elseif vRP.terPemissao(user_id,"paisanatunagemls.permissao") then
	vRP.addUserGroup(user_id,"TunagemLS")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
-----------------------------------------------------------------------------------
elseif vRP.terPemissao(user_id,"reparols.permissao") then
	vRP.addUserGroup(user_id,"PaisanaReparoLS")
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
elseif vRP.terPemissao(user_id,"paisanareparols.permissao") then
	vRP.addUserGroup(user_id,"ReparoLS")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
-----------------------------------------------------------------------------------



	end
end)
	----------------------------------------------------------------------------------------------------------------------------------




-----------------------------------------------------------------------------------------------------------------------------------------
--[[ REANIMAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('reanimar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"medico.permissao") then
		TriggerClientEvent('reanimar',source)
	end
end)

RegisterServerEvent("reanimar:pagamento")
AddEventHandler("reanimar:pagamento",function()
	local user_id = vRP.getUserId(source)
	if user_id then
		pagamento = math.random(50,80)
		vRP.giveMoney(user_id,pagamento)
		TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>$"..pagamento.." dólares</b> de gorjeta do americano.")
	end
end)]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- MULTAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('multar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"policia.permissao") then
		local id = vRP.prompt(source,"Passaporte:","")
		local valor = vRP.prompt(source,"Valor:","")
		local motivo = vRP.prompt(source,"Motivo:","")
		if id == "" or valor == "" or motivo == "" then
			return
		end
		local value = vRP.getUData(parseInt(id),"vRP:multas")
		local multas = json.decode(value) or 0
		vRP.setUData(parseInt(id),"vRP:multas",json.encode(parseInt(multas)+parseInt(valor)))
		local oficialid = vRP.getUserIdentity(user_id)
		local identity = vRP.getUserIdentity(parseInt(id))
		local nplayer = vRP.getUserSource(parseInt(id))
		SendWebhookMessage(webhookmultas,"```prolog\n[OFICIAL]: "..user_id.." "..oficialid.name.." "..oficialid.firstname.." \n[==============MULTOU==============] \n[PASSAPORTE]: "..id.." "..identity.name.." "..identity.firstname.." \n[VALOR]: $"..vRP.format(parseInt(valor)).." \n[MOTIVO]: "..motivo.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

		randmoney = math.random(90,150)
		vRP.giveMoney(user_id,parseInt(randmoney))
		TriggerClientEvent("Notify",source,"sucesso","Multa aplicada com sucesso.")
		TriggerClientEvent("Notify",source,"importante","Você recebeu <b>$"..vRP.format(parseInt(randmoney)).." dólares</b> de bonificação.")
		TriggerClientEvent("Notify",nplayer,"importante","Você foi multado em <b>$"..vRP.format(parseInt(valor)).." dólares</b>.<br><b>Motivo:</b> "..motivo..".")
		vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OCORRENCIA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ocorrencia',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"policia.permissao") then
		local id = vRP.prompt(source,"Passaporte:","")
		local ocorrencia = vRP.prompt(source,"Ocorrência:","")
		if id == "" or ocorrencia == "" then
			return
		end
		local oficialid = vRP.getUserIdentity(user_id)
		local identity = vRP.getUserIdentity(parseInt(id))
		local nplayer = vRP.getUserSource(parseInt(id))
		SendWebhookMessage(webhookocorrencias,"```prolog\n[OFICIAL]: "..user_id.." "..oficialid.name.." "..oficialid.firstname.." \n[==============OCORRENCIA==============] \n[PASSAPORTE]: "..id.." "..identity.name.." "..identity.firstname.."\n[IDENTIDADE]: "..identity.registration.." \n[TELEFONE]: "..identity.phone.." \n[OCORRENCIA]: "..ocorrencia.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

		TriggerClientEvent("Notify",source,"sucesso","Ocorrência registrada com sucesso.")
		TriggerClientEvent("Notify",nplayer,"importante","Sua <b>Ocorrência</b> foi registrada com sucesso.")
		vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DETIDO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('detido',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.terPemissao(user_id,"policia.permissao") then
        local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,5)
        local motivo = vRP.prompt(source,"Motivo:","")
        if motivo == "" then
			return
		end
		local oficialid = vRP.getUserIdentity(user_id)
        if vehicle then
            local puser_id = vRP.getUserByRegistration(placa)
            local rows = vRP.query("vRP/getVehicle", {user_id = user_id, vehicle = vehicle})
            if vehicleInfo and #vehicleInfo > 0 then
        if (vehicleInfo[1].detido and vehicleInfo[1].detido == 0) or (vehicleInfo[1].arrest and vehicleInfo[1].arrest == 0) then
                    TriggerClientEvent("Notify",source,"importante","Este veículo já se encontra detido.",8000)
                else
                	local identity = vRP.getUserIdentity(puser_id)
                	local nplayer = vRP.getUserSource(parseInt(puser_id))
                	SendWebhookMessage(webhookdetido,"```prolog\n[OFICIAL]: "..user_id.." "..oficialid.name.." "..oficialid.firstname.." \n[==============PRENDEU==============] \n[CARRO]: "..vname.." \n[PASSAPORTE]: "..puser_id.." "..identity.name.." "..identity.firstname.." \n[MOTIVO]: "..motivo.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                    vRP.execute("creative/set_detido",{ user_id = parseInt(puser_id), vehicle = vname, detido = 1, time = parseInt(os.time()) })

					randmoney = math.random(90,150)
					vRP.giveMoney(user_id,parseInt(randmoney))
					TriggerClientEvent("Notify",source,"sucesso","Carro apreendido com sucesso.")
					TriggerClientEvent("Notify",source,"importante","Você recebeu <b>$"..vRP.format(parseInt(randmoney)).." dólares</b> de bonificação.")
					TriggerClientEvent("Notify",nplayer,"importante","Seu Veículo foi <b>Detido</b>.<br><b>Motivo:</b> "..motivo..".")
					vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
                end
            end
        end
    end
end) 
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRENDER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('prender',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"policia.permissao") then
		local crimes = vRP.prompt(source,"Crimes:","")
		if crimes == "" then
			return
		end

		local player = vRP.getUserSource(parseInt(args[1]))
		if player then
			vRP.setUData(parseInt(args[1]),"vRP:prisao",json.encode(parseInt(args[2])))
			vRPclient.setHandcuffed(player,false)
			TriggerClientEvent('prisioneiro',player,true)
			vRPclient.teleport(player,1680.1,2513.0,45.5)
			prison_lock(parseInt(args[1]))
			TriggerClientEvent('removealgemas',player)
			TriggerClientEvent("vrp_sound:source",player,'jaildoor',0.7)
			TriggerClientEvent("vrp_sound:source",source,'jaildoor',0.7)

			
			local oficialid = vRP.getUserIdentity(user_id)
			local identity = vRP.getUserIdentity(parseInt(args[1]))
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			SendWebhookMessage(webhookprender,"```prolog\n[OFICIAL]: "..user_id.." "..oficialid.name.." "..oficialid.firstname.." \n[==============PRENDEU==============] \n[PASSAPORTE]: "..(args[1]).." "..identity.name.." "..identity.firstname.." \n[TEMPO]: "..vRP.format(parseInt(args[2])).." Meses \n[CRIMES]: "..crimes.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			
			randmoney = math.random(90,150)
			vRP.giveMoney(user_id,parseInt(randmoney))
			TriggerClientEvent("Notify",source,"sucesso","Prisão efetuada com sucesso.")
			TriggerClientEvent("Notify",source,"importante","Você recebeu <b>$"..vRP.format(parseInt(randmoney)).." dólares</b> de bonificação.")
			TriggerClientEvent("Notify",nplayer,"importante","Você foi preso por <b>"..vRP.format(parseInt(args[2])).." meses</b>.<br><b>Motivo:</b> "..crimes..".")
			vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
		end 
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RG
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rg',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"polpar.permissao") or vRP.terPemissao(user_id,"conce.permissao") or vRP.terPemissao(user_id,"juiz.permissao") then
		if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer == nil then
				TriggerClientEvent("Notify",source,"aviso","Passaporte <b>"..vRP.format(args[1]).."</b> indisponível no momento.")
				return
			end
			nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				local value = vRP.getUData(nuser_id,"vRP:multas")
				local valormultas = json.decode(value) or 0
				local identity = vRP.getUserIdentity(nuser_id)
				local carteira = vRP.getMoney(nuser_id)
				local banco = vRP.getBankMoney(nuser_id)
				vRPclient.setDiv(source,"completerg",".div_completerg { background-color: rgba(0,0,0,0.60); font-size: 13px; font-family: arial; color: #fff; width: 420px; padding: 20px 20px 5px; bottom: 8%; right: 2.5%; position: absolute; border: 1px solid rgba(255,255,255,0.2); letter-spacing: 0.5px; } .local { width: 220px; padding-bottom: 15px; float: left; } .local2 { width: 200px; padding-bottom: 15px; float: left; } .local b, .local2 b { color: #d1257d; }","<div class=\"local\"><b>Nome:</b> "..identity.name.." "..identity.firstname.." ( "..vRP.format(identity.user_id).." )</div><div class=\"local2\"><b>Identidade:</b> "..identity.registration.."</div><div class=\"local\"><b>Idade:</b> "..identity.age.." Anos</div><div class=\"local2\"><b>Telefone:</b> "..identity.phone.."</div><div class=\"local\"><b>Multas pendentes:</b> "..vRP.format(parseInt(valormultas)).."</div><div class=\"local2\"><b>Carteira:</b> "..vRP.format(parseInt(carteira)).."</div>")
				vRP.request(source,"Você deseja fechar o registro geral?",1000)
				vRPclient.removeDiv(source,"completerg")
			end
		else
			local nplayer = vRPclient.getNearestPlayer(source,2)
			local nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				local value = vRP.getUData(nuser_id,"vRP:multas")
				local valormultas = json.decode(value) or 0
				local identityv = vRP.getUserIdentity(user_id)
				local identity = vRP.getUserIdentity(nuser_id)
				local carteira = vRP.getMoney(nuser_id)
				local banco = vRP.getBankMoney(nuser_id)
				TriggerClientEvent("Notify",nplayer,"importante","Seu documento está sendo verificado por <b>"..identityv.name.." "..identityv.firstname.."</b>.")
				vRPclient.setDiv(source,"completerg",".div_completerg { background-color: rgba(0,0,0,0.60); font-size: 13px; font-family: arial; color: #fff; width: 420px; padding: 20px 20px 5px; bottom: 8%; right: 2.5%; position: absolute; border: 1px solid rgba(255,255,255,0.2); letter-spacing: 0.5px; } .local { width: 220px; padding-bottom: 15px; float: left; } .local2 { width: 200px; padding-bottom: 15px; float: left; } .local b, .local2 b { color: #d1257d; }","<div class=\"local\"><b>Nome:</b> "..identity.name.." "..identity.firstname.." ( "..vRP.format(identity.user_id).." )</div><div class=\"local2\"><b>Identidade:</b> "..identity.registration.."</div><div class=\"local\"><b>Idade:</b> "..identity.age.." Anos</div><div class=\"local2\"><b>Telefone:</b> "..identity.phone.."</div><div class=\"local\"><b>Multas pendentes:</b> "..vRP.format(parseInt(valormultas)).."</div><div class=\"local2\"><b>Carteira:</b> "..vRP.format(parseInt(carteira)).."</div>")
				vRP.request(source,"Você deseja fechar o registro geral?",1000)
				vRPclient.removeDiv(source,"completerg")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ALGEMAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vrp_policia:algemar")
AddEventHandler("vrp_policia:algemar",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if nplayer then
		if not vRPclient.isHandcuffed(source) then
			if vRP.getInventoryItemAmount(user_id,"algemas") >= 1 then
				if vRPclient.isHandcuffed(nplayer) then
					TriggerClientEvent('carregar',nplayer,source)
					vRPclient._playAnim(source,false,{{"mp_arresting","a_uncuff"}},false)
					SetTimeout(5000,function()
						vRPclient.toggleHandcuff(nplayer)
						TriggerClientEvent('carregar',nplayer,source)
						TriggerClientEvent("vrp_sound:source",source,'uncuff',0.1)
						TriggerClientEvent("vrp_sound:source",nplayer,'uncuff',0.1)
						TriggerClientEvent('removealgemas',nplayer)
					end)
				else
					TriggerClientEvent('cancelando',source,true)
					TriggerClientEvent('cancelando',nplayer,true)
					TriggerClientEvent('carregar',nplayer,source)
					vRPclient._playAnim(source,false,{{"mp_arrest_paired","cop_p2_back_left"}},false)
					vRPclient._playAnim(nplayer,false,{{"mp_arrest_paired","crook_p2_back_left"}},false)
					SetTimeout(3500,function()
						vRPclient._stopAnim(source,false)
						vRPclient.toggleHandcuff(nplayer)
						TriggerClientEvent('carregar',nplayer,source)
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent('cancelando',nplayer,false)
						TriggerClientEvent("vrp_sound:source",source,'cuff',0.1)
						TriggerClientEvent("vrp_sound:source",nplayer,'cuff',0.1)
						TriggerClientEvent('setalgemas',nplayer)
					end)
				end
			else
				if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"policia.permissao") then
					if vRPclient.isHandcuffed(nplayer) then
						TriggerClientEvent('carregar',nplayer,source)
						vRPclient._playAnim(source,false,{{"mp_arresting","a_uncuff"}},false)
						SetTimeout(5000,function()
							vRPclient.toggleHandcuff(nplayer)
							TriggerClientEvent('carregar',nplayer,source)
							TriggerClientEvent("vrp_sound:source",source,'uncuff',0.1)
							TriggerClientEvent("vrp_sound:source",nplayer,'uncuff',0.1)
							TriggerClientEvent('removealgemas',nplayer)
						end)
					else
						TriggerClientEvent('cancelando',source,true)
						TriggerClientEvent('cancelando',nplayer,true)
						TriggerClientEvent('carregar',nplayer,source)
						vRPclient._playAnim(source,false,{{"mp_arrest_paired","cop_p2_back_left"}},false)
						vRPclient._playAnim(nplayer,false,{{"mp_arrest_paired","crook_p2_back_left"}},false)
						SetTimeout(3500,function()
							vRPclient._stopAnim(source,false)
							vRPclient.toggleHandcuff(nplayer)
							TriggerClientEvent('carregar',nplayer,source)
							TriggerClientEvent('cancelando',source,false)
							TriggerClientEvent('cancelando',nplayer,false)
							TriggerClientEvent("vrp_sound:source",source,'cuff',0.1)
							TriggerClientEvent("vrp_sound:source",nplayer,'cuff',0.1)
							TriggerClientEvent('setalgemas',nplayer)
						end)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CARREGAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vrp_policia:carregar")
AddEventHandler("vrp_policia:carregar",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"polpar.permissao") then	
		if nplayer then
			if not vRPclient.isHandcuffed(source) then
				TriggerClientEvent('carregar',nplayer,source)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RMASCARA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rmascara',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"policia.permissao") or vRP.terPemissao(user_id,"medico.permissao")  then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			TriggerClientEvent('rmascara',nplayer)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RCHAPEU
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rchapeu',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"polpar.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			TriggerClientEvent('rchapeu',nplayer)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RCAPUZ
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rcapuz',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"polpar.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			if vRPclient.isCapuz(nplayer) then
				vRPclient.setCapuz(nplayer)
				TriggerClientEvent("Notify",source,"sucesso","Capuz colocado com sucesso.")
			else
				TriggerClientEvent("Notify",source,"importante","A pessoa não está com o capuz na cabeça.")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('re',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"medico.permissao") or vRP.terPemissao(user_id,"policia.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			if vRPclient.isInComa(nplayer) then
				local identity_user = vRP.getUserIdentity(user_id)
				local nuser_id = vRP.getUserId(nplayer)
				local identity_coma = vRP.getUserIdentity(nuser_id)
				local set_user = "Policia"
				if vRP.terPemissao(user_id,"paramedico.permissao") then
					set_user = "Paramedico"
				end
				TriggerClientEvent('cancelando',source,true)
				vRPclient._playAnim(source,false,{{"amb@medic@standing@tendtodead@base","base"},{"mini@cpr@char_a@cpr_str","cpr_pumpchest"}},true)
				TriggerClientEvent("progress",source,30000,"reanimando")
				SetTimeout(30000,function()
					SendWebhookMessage(webhookre,"```prolog\n[ID]: "..user_id.." "..identity_user.name.." "..identity_user.firstname.." \n[REVIVEU]: "..nuser_id.." "..identity_coma.name.." "..identity_coma.firstname .. "\n[SET]: "..set_user..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
					vRPclient.killGod(nplayer)
					vRPclient._stopAnim(source,false)
					vRP.giveMoney(user_id,200)
					TriggerClientEvent("resetBleeding",nplayer)
					TriggerClientEvent('cancelando',source,false)
				end)
			else
				TriggerClientEvent("Notify",source,"importante","A pessoa precisa estar em coma para prosseguir.")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"dono.permissao") or vRP.terPemissao(user_id,"policia.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,10)
		if nplayer then
			vRPclient.putInNearestVehicleAsPassenger(nplayer,7)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"polpar.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,10)
		if nplayer then
			vRPclient.ejectVehicle(nplayer)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- APREENDER
-----------------------------------------------------------------------------------------------------------------------------------------
local itemlist = {
	"dinheirosujo",
	"capsula",
	"algemas",
	"capuz",
	"lockpick",
	"masterpick",
	"orgao",
	"orgaobatido",
	"orgaos",
	"pecaeletronica",
	"computadormontado",
	"identidadedigital",
	"identidadefisica",
	"tartaruga",
	"carnedetartaruga",
	"etiqueta",
	"pendrive",
	"relogioroubado",
	"pulseiraroubada",
	"anelroubado",
	"colarroubado",
	"vibradorroubado",
	"perfumeroubado",
	"brincoroubado",
	"carteiraroubada",
	"tabletroubado",
	"sapatosroubado",
	"armacaodearma",
	"pecadearma",
	-- Maconha ------------------
	"maconha",
	"ramosdemaconha",
	"maconhanaoprocessada",
	"maconhamisturada",
	"baseado",
	"seda",
	"receita1",
	"receita2",
	-----------------------------
	-- Ecstasy ------------------
	"ecstasy",
	"ociacido",
	"ocitocina",
	"primaecstasy",
	-----------------------------
	-- Cocaína ------------------
	"folhadecoca",
	"pastadecoca",
	"cocamisturada",
	"cocaina",
	"impostoderendafalso",
	-----------------------------
	"metanfetamina",
	"anfetamina",
	"cristal",
	"lsd",
	"logsinvasao",
	"acessodeepweb",
	"keysinvasao",
	"pendriveinformacoes",
	"radio",
	"keycard",
	"c4",
	"serra",
	"furadeira",
	"wbody|WEAPON_DAGGER",
	"wbody|WEAPON_BAT",
	"wbody|WEAPON_BOTTLE",
	"wbody|WEAPON_CROWBAR",
	"wbody|WEAPON_FLASHLIGHT",
	"wbody|WEAPON_GOLFCLUB",
	"wbody|WEAPON_HAMMER",
	"wbody|WEAPON_HATCHET",
	"wbody|WEAPON_KNUCKLE",
	"wbody|WEAPON_KNIFE",
	"wbody|WEAPON_MACHETE",
	"wbody|WEAPON_SWITCHBLADE",
	"wbody|WEAPON_NIGHTSTICK",
	"wbody|WEAPON_WRENCH",
	"wbody|WEAPON_BATTLEAXE",
	"wbody|WEAPON_POOLCUE",
	"wbody|WEAPON_STONE_HATCHET",
	"wbody|WEAPON_PISTOL",
	"wbody|WEAPON_COMBATPISTOL",
	"wbody|WEAPON_CARBINERIFLE",
	"wbody|WEAPON_SMG",
	"wbody|WEAPON_PUMPSHOTGUN_MK2",
	"wbody|WEAPON_STUNGUN",
	"wbody|WEAPON_NIGHTSTICK",
	"wbody|WEAPON_SNSPISTOL",
	"wbody|WEAPON_MICROSMG",
	"wbody|WEAPON_ASSAULTRIFLE",
	"wbody|WEAPON_SPECIALCARBINE",
	"wbody|WEAPON_BZGAS",
	"wbody|WEAPON_FIREEXTINGUISHER",
	"wbody|WEAPON_FLARE",
	"wbody|WEAPON_REVOLVER",
	"wbody|WEAPON_PISTOL_MK2",
	"wbody|WEAPON_VINTAGEPISTOL",
	"wbody|WEAPON_MUSKET",
	"wbody|WEAPON_GUSENBERG",
	"wbody|WEAPON_ASSAULTSMG",
	"wbody|WEAPON_COMBATPDW",
	"wbody|WEAPON_COMPACTRIFLE",
	"wbody|WEAPON_CARBINERIFLE_MK2",
 	"wbody|WEAPON_MACHINEPISTOL",
	"wbody|WEAPON_PUMPSHOTGUN",
	"wbody|WEAPON_SAWNOFFSHOTGUN",
	"wbody|WEAPON_BULLPUPRIFLE",
	"wammo|WEAPON_SAWNOFFSHOTGUN",
	"wammo|WEAPON_BULLPUPRIFLE",
	"wammo|WEAPON_DAGGER",
	"wammo|WEAPON_BAT",
	"wammo|WEAPON_BOTTLE",
	"wammo|WEAPON_CROWBAR",
	"wammo|WEAPON_FLASHLIGHT",
	"wammo|WEAPON_GOLFCLUB",
	"wammo|WEAPON_HAMMER",
	"wammo|WEAPON_HATCHET",
	"wammo|WEAPON_KNUCKLE",
	"wammo|WEAPON_KNIFE",
	"wammo|WEAPON_MACHETE",
	"wammo|WEAPON_SWITCHBLADE",
	"wammo|WEAPON_NIGHTSTICK",
	"wammo|WEAPON_WRENCH",
	"wammo|WEAPON_BATTLEAXE",
	"wammo|WEAPON_POOLCUE",
	"wammo|WEAPON_STONE_HATCHET",
	"wammo|WEAPON_PISTOL",
	"wammo|WEAPON_COMBATPISTOL",
	"wammo|WEAPON_CARBINERIFLE",
	"wammo|WEAPON_SMG",
	"wammo|WEAPON_PUMPSHOTGUN",
	"wammo|WEAPON_PUMPSHOTGUN_MK2",
	"wammo|WEAPON_STUNGUN",
	"wammo|WEAPON_NIGHTSTICK",
	"wammo|WEAPON_SNSPISTOL",
	"wammo|WEAPON_MICROSMG",
	"wammo|WEAPON_ASSAULTRIFLE",
	"wammo|WEAPON_SPECIALCARBINE",
	"wammo|WEAPON_FIREEXTINGUISHER",
	"wammo|WEAPON_FLARE",
	"wammo|WEAPON_REVOLVER",
	"wammo|WEAPON_PISTOL_MK2",
	"wammo|WEAPON_VINTAGEPISTOL",
	"wammo|WEAPON_MUSKET",
	"wammo|WEAPON_GUSENBERG",
	"wammo|WEAPON_ASSAULTSMG",
	"wammo|WEAPON_COMBATPDW",
	"wammo|WEAPON_MACHINEPISTOL",
	"wammo|WEAPON_CARBINERIFLE_MK2",
	"wammo|WEAPON_COMPACTRIFLE",
	"projetoassaultrifle",
	"projetoassaultsmg",
	"projetobullpuprifle",
	"projetocarbinerifle",
	"projetocombatpdw",
	"projetocombatpistol",
	"projetogusenberg",
	"projetopistol",
	"projetopumpshotgun",
	"projetosawnoffshotgun",
	"projetosmg",
	"ferramentas",
	"detonador"
}

RegisterCommand('apreender',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"policia.permissao") then
		local user_id = vRP.getUserId(source)

		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			local identity = vRP.getUserIdentity(user_id)
			local nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				local nidentity = vRP.getUserIdentity(nuser_id)
				local itens_apreendidos = {}
				local weapons = vRPclient.replaceWeapons(nplayer,{})
				for k,v in pairs(weapons) do
					vRP.giveInventoryItem(nuser_id,"wbody|"..k,1)
					if v.ammo > 0 then
						vRP.giveInventoryItem(nuser_id,"wammo|"..k,v.ammo)
					end
				end

				local inv = vRP.getInventory(nuser_id)
				for k,v in pairs(itemlist) do
					local sub_items = { v }
					if string.sub(v,1,1) == "*" then
						local idname = string.sub(v,2)
						sub_items = {}
						for fidname,_ in pairs(inv) do
							if splitString(fidname,"|")[1] == idname then
								table.insert(sub_items,fidname)

							end
						end
					end

					for _,idname in pairs(sub_items) do
						local amount = vRP.getInventoryItemAmount(nuser_id,idname)
						if amount > 0 then
							local item_name,item_weight = vRP.getItemDefinition(idname)
							if item_name then
								if vRP.tryGetInventoryItem(nuser_id,idname,amount,true) then
									vRP.giveInventoryItem(user_id,idname,amount)
									table.insert(itens_apreendidos, "[ITEM]: "..vRP.itemNameList(idname).." [QUANTIDADE]: "..amount)
								end
							end
						end
					end
				end
				local apreendidos = table.concat(itens_apreendidos, "\n")
				SendWebhookMessage(webhookpoliciaapreendidos,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[APREENDEU DE]:  "..nuser_id.." "..nidentity.name.." "..nidentity.firstname.."\n" .. apreendidos ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				TriggerClientEvent("Notify",nplayer,"importante","Todos os seus pertences foram apreendidos.")
				TriggerClientEvent("Notify",source,"importante","Apreendeu todos os pertences da pessoa.")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARSENAL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('arsenal',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"policia.permissao") then
		TriggerClientEvent('arsenal',source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXTRAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('extras',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.terPemissao(user_id,"policia.permissao") then
        if vRPclient.isInVehicle(source) then
            TriggerClientEvent('extras',source)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYEXTRAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryextras")
AddEventHandler("tryextras",function(index,extra)
    TriggerClientEvent("syncextras",-1,index,parseInt(extra))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cone',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"polpar.permissao") or vRP.terPemissao(user_id,"speed.permissao") or vRP.terPemissao(user_id,"mecanico.permissao") or vRP.terPemissao(user_id,"speed.permissao") then
		TriggerClientEvent('cone',source,args[1])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BARREIRA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('barreira',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"polpar.permissao") or vRP.terPemissao(user_id,"speed.permissao") or vRP.terPemissao(user_id,"mecanico.permissao") or vRP.terPemissao(user_id,"speed.permissao") then
		TriggerClientEvent('barreira',source,args[1])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPIKE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('spike',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"policia.permissao") then
		TriggerClientEvent('spike',source,args[1])
	end
end)
--------------------------------------------------------------------------------------------------------------------------------------------------
-- DISPAROS
--------------------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('atirando')
AddEventHandler('atirando',function(x,y,z,infos)
    local user_id = vRP.getUserId(source)
    if user_id then
        if not vRP.hasPermission(user_id,"policia.permissao") then
            local policiais = vRP.getUsersByPermission("policia.permissao")
            for l,w in pairs(policiais) do
                local player = vRP.getUserSource(w)
                if player then
                    TriggerClientEvent('notificacao',player,x,y,z,user_id,infos)
                end
            end
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ANUNCIO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('anuncio',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"admin.permissao") or vRP.terPemissao(user_id,"policia.permissao") or vRP.terPemissao(user_id,"conce.permissao") or vRP.terPemissao(user_id,"news.permissao") then
		local identity = vRP.getUserIdentity(user_id)
		local mensagem = vRP.prompt(source,"Mensagem:","")
		if mensagem == "" then
			return
		end
		vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(0,128,192,0.8); font-size: 11px; font-family: arial; color: #fff; padding: 20px; bottom: 7%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 15px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: "..identity.name.." "..identity.firstname)
		SetTimeout(30000,function()
			vRPclient.removeDiv(-1,"anuncio")
		end)
	end
end)
--------------------------------------------------------------------------------------------------------------------------------------------------
-- PRISÃO
--------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	local player = vRP.getUserSource(parseInt(user_id))
	if player then
		SetTimeout(30000,function()
			local value = vRP.getUData(parseInt(user_id),"vRP:prisao")
			local tempo = json.decode(value) or -1

			if tempo == -1 then
				return
			end

			if tempo > 0 then
				TriggerClientEvent('prisioneiro',player,true)
				vRPclient.teleport(player,1680.1,2513.0,46.5)
				prison_lock(parseInt(user_id))
			end
		end)
	end
end)

function prison_lock(target_id)
	local player = vRP.getUserSource(parseInt(target_id))
	if player then
		SetTimeout(60000,function()
			local value = vRP.getUData(parseInt(target_id),"vRP:prisao")
			local tempo = json.decode(value) or 0
			if parseInt(tempo) >= 1 then
				TriggerClientEvent("Notify",player,"importante","Ainda vai passar <b>"..parseInt(tempo).." meses</b> preso.")
				vRP.setUData(parseInt(target_id),"vRP:prisao",json.encode(parseInt(tempo)-1))
				prison_lock(parseInt(target_id))
			elseif parseInt(tempo) == 0 then
				TriggerClientEvent('prisioneiro',player,false)
				vRPclient.teleport(player,1850.5,2604.0,45.5)
				vRP.setUData(parseInt(target_id),"vRP:prisao",json.encode(-1))
				TriggerClientEvent("Notify",player,"importante","Sua sentença terminou, esperamos não ve-lo novamente.")
			end
			vRPclient.PrisionGod(player)
		end)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DIMINUIR PENA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("diminuirpena")
AddEventHandler("diminuirpena",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local value = vRP.getUData(parseInt(user_id),"vRP:prisao")
	local tempo = json.decode(value) or 0
	if tempo >= 2 then
		vRP.setUData(parseInt(user_id),"vRP:prisao",json.encode(parseInt(tempo)-2))
		TriggerClientEvent("Notify",source,"importante","Sua pena foi reduzida em <b>2 meses</b>, continue o trabalho.")
	else
		TriggerClientEvent("Notify",source,"importante","Atingiu o limite da redução de pena, não precisa mais trabalhar.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[[ PRESET
-----------------------------------------------------------------------------------------------------------------------------------------
local presets = {
	["1"] = {
		[1885233650] = {
			[1] = { 121,0 },
			[3] = { 4,0 },
			[4] = { 25,0 },
			[5] = { -1,0 },
			[6] = { 21,0 },
			[7] = { -1,0 },			
			[8] = { 58,0 },
			[9] = { 13,0 },
			[10] = { -1,0 },
			[11] = { 26,0 },
			["p0"] = { 13,0 },
			["p1"] = { 5,5 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { 121,0 },
			[3] = { 14,0 },
			[4] = { 41,0 },
			[5] = { -1,0 },
			[6] = { 59,1 },
			[7] = { -1,0 },			
			[8] = { 35,0 },
			[9] = { 14,0 },
			[10] = { -1,0 },
			[11] = { 25,0 },			
			["p0"] = { 13,0 },
			["p1"] = { 11,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["2"] = {
		[1885233650] = {
			[1] = { 121,0 },
			[3] = { 0,0 },
			[4] = { 47,0 },
			[5] = { -1,0 },
			[6] = { 25,0 },
			[7] = { 1,0 },			
			[8] = { 57,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 93,0 },		
			["p0"] = { 10,0 },
			["p1"] = { 5,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { 121,0 },
			[3] = { 14,0 },
			[4] = { 49,0 },
			[5] = { -1,0 },
			[6] = { 25,0 },
			[7] = { 1,0 },			
			[8] = { 34,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 84,0 },
			["p0"] = { 10,0 },
			["p1"] = { 11,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["3"] = {
		[1885233650] = {
			[1] = { 121,0 },
			[3] = { 59,0 },
			[4] = { 31,0 },
			[5] = { -1,0 },
			[6] = { 25,0 },
			[7] = { 1,0 },			
			[8] = { 57,0 },
			[9] = { 7,1 },
			[10] = { -1,0 },
			[11] = { 222,20 },		
			["p0"] = { 10,0 },
			["p1"] = { 5,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { 121,0 },
			[3] = { 60,0 },
			[4] = { 30,0 },
			[5] = { -1,0 },
			[6] = { 25,0 },
			[7] = { 1,0 },			
			[8] = { 34,0 },
			[9] = { 7,1 },
			[10] = { -1,0 },
			[11] = { 232,20 },
			["p0"] = { 10,0 },
			["p1"] = { 11,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["4"] = {
		[1885233650] = {
			[1] = { 121,0 },
			[3] = { 4,0 },
			[4] = { 25,1 },
			[5] = { -1,0 },
			[6] = { 21,0 },
			[7] = { -1,0 },			
			[8] = { 58,0 },
			[9] = { 13,0 },
			[10] = { -1,0 },
			[11] = { 26,1 },
			["p0"] = { 13,1 },
			["p1"] = { 5,5 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { 121,0 },
			[3] = { 14,0 },
			[4] = { 41,1 },
			[5] = { -1,0 },
			[6] = { 59,1 },
			[7] = { -1,0 },			
			[8] = { 35,0 },
			[9] = { 14,0 },
			[10] = { -1,0 },
			[11] = { 25,1 },			
			["p0"] = { 13,1 },
			["p1"] = { 11,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["5"] = {
		[1885233650] = {
			[1] = { 121,1 },
			[3] = { 0,0 },
			[4] = { 47,1 },
			[5] = { -1,0 },
			[6] = { 25,0 },
			[7] = { 1,0 },			
			[8] = { 57,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 93,1 },		
			["p0"] = { 10,1 },
			["p1"] = { 5,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { 121,0 },
			[3] = { 14,0 },
			[4] = { 49,1 },
			[5] = { -1,0 },
			[6] = { 25,0 },
			[7] = { 1,0 },			
			[8] = { 34,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 84,1 },
			["p0"] = { 10,1 },
			["p1"] = { 11,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["6"] = {
		[1885233650] = {
			[1] = { 121,0 },
			[3] = { 74,0 },
			[4] = { 96,0 },
			[5] = { -1,0 },
			[6] = { 56,1 },
			[7] = { 127,0 },
			[8] = { 56,1 },
			[9] = { -1,0 },
			[10] = { 58,0 },
			[11] = { 250,0 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { 121,0 },
			[3] = { 96,0 },
			[4] = { 99,0 },
			[5] = { -1,0 },
			[6] = { 27,0 },
			[7] = { 97,0 },
			[8] = { 27,1 },
			[9] = { -1,0 },
			[10] = { 66,0 },
			[11] = { 258,0 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["7"] = {
		[1885233650] = {
			[1] = { 121,0 },
			[3] = { 81,0 },
			[4] = { 10,0 },
			[5] = { -1,0 },
			[6] = { 56,1 },
			[7] = { 127,0 },			
			[8] = { 56,1 },
			[9] = { -1,0 },
			[10] = { 58,0 },
			[11] = { 95,1 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { 0,0 },
			[3] = { 106,1 },
			[4] = { 37,0 },
			[5] = { 0,0 },
			[6] = { 27,0 },
			[7] = { 97,0 },			
			[8] = { 27,1 },
			[9] = { -1,0 },
			[10] = { 66,0 },
			[11] = { 86,1 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["8"] = {
		[1885233650] = {
			[1] = { 121,0 },
			[3] = { 38,0 },
			[4] = { 96,0 },
			[5] = { -1,0 },
			[6] = { 56,1 },
			[7] = { 126,0 },			
			[8] = { 71,3 },
			[9] = { -1,0 },
			[10] = { 57,0 },
			[11] = { 249,0 },
			["p0"] = { -1,0 },
			["p1"] = { -1,1 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { 121,0 },
			[3] = { 18,0 },
			[4] = { 99,0 },
			[5] = { -1,0 },
			[6] = { 27,0 },
			[7] = { 14,3 },
			[8] = { 77,3 },		
			[9] = { -1,0 },
			[10] = { 65,0 },
			[11] = { 257,0 },		
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["9"] = {
		[1885233650] = {
			[1] = { -1,0 },
			[3] = { 81,0 },
			[4] = { 25,5 },
			[5] = { -1,0 },
			[6] = { 21,9 },
			[7] = { 126,0 },			
			[8] = { 56,1 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 13,0 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 85,0 },
			[4] = { 37,5 },
			[5] = { -1,0 },
			[6] = { 10,1 },
			[7] = { 14,3 },		
			[8] = { 27,1 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 27,0 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["10"] = {
		[1885233650] = {
			[1] = { -1,0 },
			[3] = { 4,0 },
			[4] = { 25,5 },
			[5] = { -1,0 },
			[6] = { 21,9 },
			[7] = { 126,0 },			
			[8] = { 31,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 31,7 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 1,0 },
			[4] = { 37,5 },
			[5] = { -1,0 },
			[6] = { 0,2 },
			[7] = { 14,3 },		
			[8] = { 64,2 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 57,7 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["11"] = {
		[1885233650] = {
			[1] = { -1,0 },
			[3] = { 74,0 },
			[4] = { 3,3 },
			[5] = { -1,0 },
			[6] = { 7,0 },
			[7] = { 126,0 },			
			[8] = { 15,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 16,1 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 96,0 },
			[4] = { 3,13 },
			[5] = { -1,0 },
			[6] = { 10,1 },
			[7] = { 14,3 },
			[8] = { 15,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },	
			[11] = { 141,1 },		
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["12"] = {
		-- male
		[1885233650] = {
			[1] = { -1,0 },
			[3] = { 26,0 },
			[4] = { 4,0 },
			[5] = { 34,0 },
			[6] = { 24,0 },
			[7] = { -1,0 },			
			[8] = { -1,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 234,5 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		-- female
		[-1667301416] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 20,0 }, -- maos
			[4] = { 75,0 }, -- calça
			[5] = { 34,0 }, -- mochila
			[6] = { 24,0 }, -- sapato
			[7] = { -1,0 }, -- acessorios
			[8] = { -1,0 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 86,1 }, -- jaqueta
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
	},
	["13"] = {
		-- male
		[1885233650] = {
			[2] = {10,0,0},
			[3] = {20,0,2},
			[4] = {33,0,2},
			[6] = {25,0,2},
			[7] = {1,0,2},
			[8] = {94,0,2},
			[9] = {21,0,2},
			[10] = {0,0,2},
			[11] = {36,0,2}
		},
		-- female
		[-1667301416] = {
			[2] = {10,0,0},
			[3] = {154,0,2},
			[4] = {49,0,2},
			[6] = {30,0,2},
			[7] = {0,0,2},
			[8] = {152,0,2},
			[9] = {20,1,2},
			[11] = {44,1,2}
		},
	}
}

RegisterCommand('preset',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.terPemissao(user_id,"polpar.permissao") or vRP.terPemissao(user_id,"news.permissao") then
		if args[1] then
			local custom = presets[tostring(args[1])]
			if custom then
				local old_custom = vRPclient.getCustomization(source)
				local idle_copy = {}

				idle_copy = vRP.save_idle_custom(source,old_custom)
				idle_copy.modelhash = nil

				for l,w in pairs(custom[old_custom.modelhash]) do
					idle_copy[l] = w
				end
				vRPclient._setCustomization(source,idle_copy)
			end
		else
			vRP.removeCloak(source)
		end
	end
end)]]
-----------------------------------------------------------------------------------------------------------------------------------------
--[[ ARSENAL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('a',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if user_id then
    	SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..(args[1]).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		if args[1] == "taser" and vRP.terPemissao(user_id,"polpar.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
		elseif args[1] == "rayp" and vRP.terPemissao(user_id,"admin.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_RAYPISTOL"] = { ammo = 0 }})	
		elseif args[1] == "fire" and vRP.terPemissao(user_id,"admin.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_FIREWORK"] = { ammo = 20 }})				
		elseif args[1] == "cassetete" and vRP.terPemissao(user_id,"polpar.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
		elseif args[1] == "lanterna" and vRP.terPemissao(user_id,"polpar.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
		elseif args[1] == "extintor" and vRP.terPemissao(user_id,"polpar.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_FIREEXTINGUISHER"] = { ammo = 0 }})
		elseif args[1] == "1911GB" and vRP.terPemissao(user_id,"policia.permissao") and vRP.tryFullPayment(user_id,60000) then
			vRPclient.giveWeapons(source,{["WEAPON_PISTOL"] = { ammo = 100 }})
			TriggerClientEvent("Notify",source,"importante","Você comprou <b>1x Pistola</b> por <b>$60.000 dólares</b>, do porte legal de armas.")
		elseif args[1] == "glock" and vRP.terPemissao(user_id,"policia.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 100 }})
		elseif args[1] == "magnum357" and vRP.terPemissao(user_id,"admin.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_REVOLVER_MK2"] = { ammo = 14 }})		
		elseif args[1] == "mp5" and vRP.terPemissao(user_id,"policia.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_SMG"] = { ammo = 200 }})
		elseif args[1] == "sigsauer" and vRP.terPemissao(user_id,"policia.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_COMBATPDW"] = { ammo = 200 }})
		elseif args[1] == "remington" and vRP.terPemissao(user_id,"policia.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_PUMPSHOTGUN_MK2"] = { ammo = 30 }})
		elseif args[1] == "m4a1" and vRP.terPemissao(user_id,"policia.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_CARBINERIFLE"] = { ammo = 200 }})
		elseif args[1] == "sniper" and vRP.terPemissao(user_id,"admin.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_HEAVYSNIPER_MK2"] = { ammo = 50 }})
		elseif args[1] == "gas" and vRP.terPemissao(user_id,"policia.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_BZGAS"] = { ammo = 1 }})	
		-- elseif args[1] == "colete" and vRP.terPemissao(user_id,"policia.permissao") then
		-- 	vRPclient.setArmour(source,100)
		elseif args[1] == "limpar" and vRP.terPemissao(user_id,"polpar.permissao") then
			vRPclient.giveWeapons(source,{},true)
			vRPclient.setArmour(source,0)
		elseif vRP.terPemissao(user_id,"polpar.permissao") then
			TriggerClientEvent("Notify",source,"negado","Armamento não encontrado.")
		end
	end
end)]]