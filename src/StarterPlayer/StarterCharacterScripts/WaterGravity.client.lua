local Water = workspace.Water:WaitForChild("WaterPart")
workspace.Gravity = 196.2


Water.Touched:Connect(function(hit)
	if (hit.Parent:FindFirstChildWhichIsA("Humanoid"))  and (hit.Parent:FindFirstChild("Humanoid") == game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"))  then
		if workspace.Gravity ~= 30 then 
			workspace.Gravity = 30-- your gravity here
		end
	end
end)

Water.TouchEnded:Connect(function(hit)
	if (hit.Parent:FindFirstChildWhichIsA("Humanoid"))  and (hit.Parent:FindFirstChild("Humanoid") == game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"))  then
		if workspace.Gravity ~= 196.2 then 
			workspace.Gravity = 196.2-- your gravity here
		end
	end
end)