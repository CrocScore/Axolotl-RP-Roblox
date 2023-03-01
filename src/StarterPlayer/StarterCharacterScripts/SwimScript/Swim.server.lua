local remote = script.Parent:WaitForChild("SwimRemote")



remote.OnServerEvent:Connect(function(Player, Value, oceanpos)
	local char = Player.Character
	if Value == "StartSwimming" then
		char:WaitForChild("Humanoid").WalkSpeed = 24
		
		local bp = Instance.new("BodyPosition", char:WaitForChild("HumanoidRootPart"))
		bp.Name = "SwimPosition"
		bp.MaxForce = Vector3.new(0, math.huge, 0)
		bp.Position = Vector3.new(0, oceanpos, 0)
		
	else if Value == "StopSwimming" then
			char:WaitForChild("Humanoid").WalkSpeed = 16
			local findBP = char:WaitForChild("HumanoidRootPart"):FindFirstChild("SwimPosition")
			if findBP then
				findBP:Destory()
			end
		elseif Value == "DiveUp" and char:WaitForChild("HumanoidRootPart").Position.Y <= workspace.Water:WaitForChild("WaterPart").Position.Y then
			local findBP = char:WaitForChild("HumanoidRootPart"):FindFirstChild("SwimPosition")
			if findBP then
				findBP.Position = findBP.Position + Vector3.new(0, 0.05, 0)
			end
		elseif Value == "DiveDown" and char:WaitForChild("HumanoidRootPart").Position.Y >= (workspace.Water:WaitForChild("WaterPart").Position.Y - 100) then
			local findBP = char:WaitForChild("HumanoidRootPart"):FindFirstChild("SwimPosition")
			if findBP then
				findBP.Position = findBP.Position + Vector3.new(0, 0.05, 0)
			end
		end
	end
end)
