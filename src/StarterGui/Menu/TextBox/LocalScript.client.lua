local TextBox = script.Parent

local RPRE = game.ReplicatedStorage.Events.RPRE

local Players = game:GetService("Players")
local plr = Players.LocalPlayer


TextBox.FocusLost:Connect(function()
	
	local name = TextBox.Text
	
	if string.len(name) <1 or string.len(name) > 50 then return end
	
	RPRE:FireServer(name)
	
end)