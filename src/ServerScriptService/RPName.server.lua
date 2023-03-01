local billboardgui = game:GetService("ServerStorage"):WaitForChild("BillboardGui")

local NameEvent = game.ReplicatedStorage.Events.NameEvent

NameEvent.OnServerEvent:Connect(function(plr)
	local character = plr.Character
	local clonegui = billboardgui:Clone()
	local RPname = clonegui.RPname
	clonegui.Parent = character.Head


	character.Head:FindFirstChild("RPname")
	clonegui.Adornee = character.Head
	RPname.Text = character.Name
end)

--game.Players.PlayerAdded:Connect(function(player)
	
--	player.CharacterAdded:Connect(function(char)
--		local clonegui = billboardgui:Clone()
--		local RPname = clonegui.RPname
--		clonegui.Parent = char.Head
		
		
--		char.Head:FindFirstChild("RPname")
--		clonegui.Adornee = char.Head
--		RPname.Text = player.Name
--	end)
	
--end)


