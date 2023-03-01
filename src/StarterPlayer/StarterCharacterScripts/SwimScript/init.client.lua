local char = script.Parent
local humrootpart = char:WaitForChild("HumanoidRootPart")
local ocean = workspace.Water:WaitForChild("WaterPart")
local currentlySwimming = false
local remote = script:WaitForChild("SwimRemote")
local uis = game:GetService("UserInputService")
local holding = false
uis.InputBegan:Connect(function(Input, GFE)
	if not GFE then
		if Input.KeyCode == Enum.KeyCode.E and currentlySwimming and holding == false then
			print("Dive UP")
			holding = true
			while holding do
				wait(0.01)
				remote:FireServer("DiveUp")
			end

		elseif Input.KeyCode == Enum.KeyCode.Q and currentlySwimming and holding == false then
			print("Dive DOWN")
			holding = true
			while holding do
				wait(0.01)
				remote:FireServer("DiveDown")
			end
	end
end
end)

uis.InputEnded:Connect(function(Input, GFE)
	if not GFE then
		if Input.KeyCode == Enum.KeyCode.E and currentlySwimming and holding == true then
			print("Dive UP RELEASE")
			holding = false
		elseif Input.KeyCode == Enum.KeyCode.Q and currentlySwimming and holding == true then
			print("Dive DOWN RELEASE")
			holding = false
		end
	end
end)

game:GetService("RunService").Stepped:Connect(function()
	if humrootpart.Position.Y <= ocean.Position.Y and currentlySwimming == false then
		print("UNDERWATER")
		currentlySwimming = true
		remote:FireServer("StartSwimming", ocean.Position.Y)
	elseif 
		humrootpart.Position.Y > ocean.Position.Y and currentlySwimming == true then
		print("On Land.")
		currentlySwimming = false
		remote:FireServer("StopSwimming")
	end
end)