enabled = true
TriggerEvent('chat:addSuggestion', '/pažba', '[Zapnuto] Zapíná a vypíná schopnost udeřit osobu pažbou.')

-- Toogle pažby
RegisterCommand("pažba", function()
	enabled = not enabled
	TriggerEvent('chat:removeSuggestion', '/pažba')

	if enabled then
		TriggerEvent('chat:addSuggestion', '/pažba', '[Zapnuto] Zapíná a vypíná schopnost udeřit osobu pažbou.')
		TriggerEvent('chat:addMessage', {
			color = { 0, 255, 0},
			multiline = true,
			args = {"[PAŽBA]", "Úder pažbou je nyní povolen!"}
		})
	else
		TriggerEvent('chat:addSuggestion', '/pažba', '[Vypnuto] Zapíná a vypíná schopnost udeřit osobu pažbou.')
		TriggerEvent('chat:addMessage', {
			color = { 255, 0, 0},
			multiline = true,
			args = {"[PAŽBA]", "Úder pažbou je nyní zakázán!"}
		})
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if not enabled then
			if (not IsPedArmed(PlayerPedId(), 1)) and (GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey('weapon_unarmed')) then
				DisableControlAction(0, 140, true) 
				DisableControlAction(0, 141, true) 
				DisableControlAction(0, 142, true) 
			end
		else
			Citizen.Wait(1000)
		end
	end
end)
