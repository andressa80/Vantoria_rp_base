RegisterNetEvent("Notify")
AddEventHandler("Notify", function(css, mensagem, time)
	SendNUIMessage({
		css = css,
		mensagem = tostring(mensagem),
		time = time or 5000
	})
end)

-- comando teste
RegisterCommand("testnotify", function()
	TriggerEvent("Notify", "sucesso", "Notificação nível ELITE 🔥", 5000)
end)