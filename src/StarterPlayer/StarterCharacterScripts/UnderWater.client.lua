local TouchPart = Instance.new("Part", workspace)
TouchPart.Anchored = true
TouchPart.CanCollide = false
TouchPart.Size = Vector3.new(1, 1, 1)

local ColorCorrection = Instance.new("ColorCorrectionEffect", game.Lighting)
ColorCorrection.Enabled = false
ColorCorrection.TintColor = Color3.fromRGB(197, 255, 254)
ColorCorrection.Brightness = 0.1


local TouchConnection = TouchPart.Touched:Connect(function() end)
--TouchConnection:Disconnect()


game:GetService("RunService").RenderStepped:Connect(function()
	TouchPart.CFrame = workspace.CurrentCamera.CFrame
	local TouchingParts = TouchPart:GetTouchingParts()
	local WaterFound = false
	for _, Part in pairs(TouchingParts) do
		if Part.Name:find("Water") or Part.Parent.Name:find("Water") then
			WaterFound = true
			break
		end
	end
	if WaterFound then
		ColorCorrection.Enabled = true
	else

		ColorCorrection.Enabled = false
	end
end)