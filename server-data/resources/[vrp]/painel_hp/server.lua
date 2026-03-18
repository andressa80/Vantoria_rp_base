local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

-- Criar tabela se não existir
Citizen.CreateThread(function()
    local query = [[
        CREATE TABLE IF NOT EXISTS hospital_dinastia (
            id INT PRIMARY KEY AUTO_INCREMENT,
            hospital_bank INT DEFAULT 0
        )
    ]]
    vRP.query(query)
    
    local rows = vRP.query("SELECT * FROM hospital_dinastia WHERE id = 1")
    if #rows == 0 then
        vRP.query("INSERT INTO hospital_dinastia (id, hospital_bank) VALUES (1, 0)")
    end
    
    vRP.query("ALTER TABLE vrp_user_identities ADD COLUMN IF NOT EXISTS vacinas INT DEFAULT 0")
end)

-- Funções de permissão
local function isDirector(user_id) return vRP.hasPermission(user_id, "diretoria.permissao") end
local function isDoctor(user_id) return vRP.hasPermission(user_id, "hp.permissão") end
local function isResident(user_id) return vRP.hasPermission(user_id, "paramedico.permissao") end

-- Contagem de médicos em serviço
function GetDoctorsOnDuty()
    local count = 0
    local users = vRP.getUsersByPermission("hp.permissão")
    for _, user_id in pairs(users) do
        if vRP.hasGroup(user_id, "MedicoHP") or vRP.hasGroup(user_id, "ResidenteHP") or 
           vRP.hasGroup(user_id, "EnfermeiroHP") or vRP.hasGroup(user_id, "DiretorHP") or 
           vRP.hasGroup(user_id, "ViceDiretorHP") or vRP.hasGroup(user_id, "AuxDiretoriaHP") then
            count = count + 1
        end
    end
    return count
end

-- Entrar em Serviço
RegisterServerEvent("dinastia:toggleDuty")
AddEventHandler("dinastia:toggleDuty", function(status)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end
    
    if status then
        vRP.giveInventoryItem(user_id, "radio", 1)
        vRP.giveInventoryItem(user_id, "corda", 1)
        vRP.giveInventoryItem(user_id, "bandagem", 3)
        TriggerClientEvent("dinastia:setRadio", source, 192)
        TriggerClientEvent("Notify", source, "sucesso", "Você entrou em serviço. Rádio sintonizado em 192.")
    else
        TriggerClientEvent("Notify", source, "aviso", "Você saiu de serviço.")
    end
end)

-- Venda de Itens
RegisterServerEvent("dinastia:trySale")
AddEventHandler("dinastia:trySale", function(t_id, item, qtd, preco)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end
    
    local target_source = vRP.getUserSource(parseInt(t_id))

    if target_source then
        local ok = vRP.request(target_source, "Deseja comprar "..qtd.."x "..item.." por R$"..preco.."?", 30)
        if ok then
            if vRP.tryFullPayment(parseInt(t_id), parseInt(preco)) then
                vRP.giveInventoryItem(parseInt(t_id), item, parseInt(qtd))
                vRP.giveMoney(user_id, preco * 0.60)
                
                local rows = vRP.query("SELECT hospital_bank FROM hospital_dinastia WHERE id = 1")
                local current = 0
                if #rows > 0 then
                    current = rows[1].hospital_bank or 0
                end
                vRP.query("UPDATE hospital_dinastia SET hospital_bank = ? WHERE id = 1", { current + (preco * 0.30) })
                
                TriggerClientEvent("Notify", source, "sucesso", "Venda realizada! Você ganhou R$"..(preco * 0.60))
            else
                TriggerClientEvent("Notify", source, "negado", "O paciente não tem dinheiro suficiente.")
            end
        end
    else
        TriggerClientEvent("Notify", source, "negado", "Jogador não encontrado.")
    end
end)

-- Tratamento na Maca
RegisterServerEvent("dinastia:requestTreatment")
AddEventHandler("dinastia:requestTreatment", function(type)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end
    
    local hasDoctor = GetDoctorsOnDuty()

    if hasDoctor > 0 then
        TriggerClientEvent("Notify", source, "negado", "Há médicos em serviço, aguarde atendimento.")
        return
    end

    local price = 20000
    
    local rows = vRP.query("SELECT vacinas FROM vrp_user_identities WHERE user_id = ?", {user_id})
    if #rows > 0 and rows[1].vacinas == 1 then
        price = price * 0.90
    end

    if type == "pago" then
        if vRP.tryFullPayment(user_id, price) then
            local rows = vRP.query("SELECT hospital_bank FROM hospital_dinastia WHERE id = 1")
            local current = 0
            if #rows > 0 then
                current = rows[1].hospital_bank or 0
            end
            vRP.query("UPDATE hospital_dinastia SET hospital_bank = ? WHERE id = 1", { current + (price * 0.30) })
            
            TriggerClientEvent("dinastia:startHeal", source, 60000)
            TriggerClientEvent("Notify", source, "sucesso", "Tratamento iniciado. Você pagou R$"..price)
        else
            TriggerClientEvent("Notify", source, "negado", "Dinheiro insuficiente. Necessário R$"..price)
        end
    else
        TriggerClientEvent("dinastia:startHeal", source, 300000)
        TriggerClientEvent("Notify", source, "importante", "Tratamento gratuito iniciado. Aguarde 5 minutos.")
    end
end)

-- Vacina
RegisterServerEvent("dinastia:applyVaccine")
AddEventHandler("dinastia:applyVaccine", function(t_id)
    local source = source
    local user_id = vRP.getUserId(source)
    local target_id = parseInt(t_id)
    
    if not user_id or not target_id then return end
    
    if isResident(user_id) or isDoctor(user_id) or isDirector(user_id) then
        local rows = vRP.query("SELECT user_id FROM vrp_user_identities WHERE user_id = ?", {target_id})
        if #rows > 0 then
            vRP.query("UPDATE vrp_user_identities SET vacinas = 1 WHERE user_id = ?", {target_id})
            TriggerClientEvent("Notify", source, "sucesso", "Vacina aplicada no ID "..target_id)
            
            local target_source = vRP.getUserSource(target_id)
            if target_source then
                TriggerClientEvent("Notify", target_source, "sucesso", "Você recebeu uma vacina! Agora tem 10% de desconto em tratamentos.")
            end
        else
            TriggerClientEvent("Notify", source, "negado", "ID não encontrado no banco de dados.")
        end
    else
        TriggerClientEvent("Notify", source, "negado", "Você não tem permissão para aplicar vacinas.")
    end
end)

-- Comando para ver saldo
RegisterCommand("hpsaldo", function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, "admin.permissao") then
        local rows = vRP.query("SELECT hospital_bank FROM hospital_dinastia WHERE id = 1")
        local saldo = 0
        if #rows > 0 then
            saldo = rows[1].hospital_bank or 0
        end
        TriggerClientEvent("Notify", source, "importante", "Saldo do Hospital: R$"..saldo)
    end
end)