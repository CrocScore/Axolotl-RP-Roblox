local RPRE = game.ReplicatedStorage.Events.RPRE

RPRE.OnServerEvent:Connect(function(plr, name)

	local char = plr.Character or plr.CharacterAdded:Wait()
	
	local filteredName = game:GetService("TextService"):FilterStringAsync(name, plr.UserId)

	local filteredNameAsString = filteredName:GetNonChatStringForBroadcastAsync()

	local clonegui = char.Head:FindFirstChild("BillboardGui")

	local RPname = clonegui:FindFirstChild("RPname")

	RPname.Text = filteredNameAsString
	
	plr.PlayerGui.Menu.TextBox.Text = filteredNameAsString
end)