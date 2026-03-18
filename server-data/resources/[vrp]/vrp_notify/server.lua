RegisterCommand("notify", function(source, args)
	local msg = table.concat(args, " ")
	TriggerClientEvent("Notify", source, "aviso", msg, 5000)
end)