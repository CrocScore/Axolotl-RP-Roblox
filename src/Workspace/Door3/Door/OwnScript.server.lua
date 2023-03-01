local SS = game:GetService("ServerStorage")
local debounce = false

script.Parent.Touched:Connect(function(hit)
	local plr = game.Players:GetPlayerFromCharacter(hit.Parent)
	if plr then
		local owned = false
		local Owners = SS.Housing:GetChildren()
		for _, v in ipairs(Owners) do
			if hit.Parent.Name == v.Value then
				return owned == true
			end
		end
		if not owned then
			SS.Housing.Door3.Value = hit.Parent.Name
			script.Parent.Parent.Sign.SurfaceGui.SignText.Text = hit.Parent.Name
			script.Parent.Transparency = 1
		end
	end
end)