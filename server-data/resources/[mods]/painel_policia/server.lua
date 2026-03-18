local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

-- =========================================================================
-- CONFIGURAÇÃO DE PERMISSÕES (Verifique se batem com seu servidor)
-- =========================================================================
local permissao_policia = "policia.permissao"
local permissao_gerente = "admin.permissao" -- Para gerir membros no MDT

-- =========================================================================
-- COMANDO DE PRISÃO: /prender [ID] [TEMPO] [MOTIVO]
-- =========================================================================
RegisterCommand("prender", function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, permissao_policia) then
        local target_id = parseInt(args[1])
        local tempo = parseInt(args[2])
        local motivo = table.concat(args, " ", 3)

        if target_id and tempo > 0 and motivo ~= "" then
            local nsource = vRP.getUserSource(target_id)
            if nsource then
                -- Salva a pena no Banco de Dados (vrp_user_identities ou vrp_users)
                exports.oxmysql:execute("UPDATE vrp_user_identities SET prisao = ? WHERE user_id = ?", {tempo, target_id})
                
                -- Inicia a cena da viatura NPC no preso
                TriggerClientEvent("dinastia:iniciarTransporte", nsource, tempo)
                
                -- Notificações
                TriggerClientEvent("Notify", source, "sucesso", "ID "..target_id.." enviado para a Penitenciária Dinastia por "..tempo.." meses.")
                
                -- Log no Discord (Dinastia Elite)
                enviarLogDinastia("NOVA PRISÃO EFETUADA", "Oficial: **"..user_id.."**\nPreso: **"..target_id.."**\nTempo: **"..tempo.." meses**\nMotivo: **"..motivo.."**")
            else
                TriggerClientEvent("Notify", source, "negado", "O cidadão não se encontra na cidade.")
            end
        else
            TriggerClientEvent("Notify", source, "importante", "Use: /prender [ID] [Tempo] [Motivo]")
        end
    end
end)

-- =========================================================================
-- LÓGICA DE REDUÇÃO DE PENA (TRABALHO FORÇADO)
-- =========================================================================
RegisterServerEvent("dinastia:reduzirPena")
AddEventHandler("dinastia:reduzirPena", function()
    local source = source
    local user_id = vRP.getUserId(source)
    
    -- Consulta a pena atual
    local rows = exports.oxmysql:executeSync("SELECT prisao FROM vrp_user_identities WHERE user_id = ?", {user_id})
    if rows[1] and rows[1].prisao > 0 then
        local novaPena = rows[1].prisao - 1
        exports.oxmysql:execute("UPDATE vrp_user_identities SET prisao = ? WHERE user_id = ?", {novaPena, user_id})
        
        if novaPena <= 0 then
            TriggerClientEvent("dinastia:liberarPreso", source)
            TriggerClientEvent("Notify", source, "sucesso", "Sua pena acabou! O sistema Dinastia te deu liberdade.")
        else
            TriggerClientEvent("Notify", source, "importante", "Você trabalhou duro! Restam "..novaPena.." meses de pena.")
        end
    end
end)

-- =========================================================================
-- FUNÇÃO DE LOGS DISCORD (DINASTIA STYLE)
-- =========================================================================
function enviarLogDinastia(titulo, mensagem)
    local Webhook = "SUA_URL_DO_DISCORD_AQUI"
    local embed = {
        {
            ["color"] = 12951641, -- Cor Dourada Dinastia
            ["title"] = "🛡️ **"..titulo.."**",
            ["description"] = mensagem,
            ["footer"] = { ["text"] = "MDT Dinastia - "..os.date("%d/%m/%Y %H:%M:%S") },
        }
    }
    PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = "DINASTIA POLICE", embeds = embed}), { ['Content-Type'] = 'application/json' })
end