wait(3)
Player = game.Players.LocalPlayer.Character
prayAnim = Player.Humanoid:LoadAnimation(script.Pray)
CanEmote = true

script.Parent.MouseButton1Click:Connect(function()
	if CanEmote == true then
		CanEmote = false
		Player.Humanoid.WalkSpeed = 0
		prayAnim:Play()	
	else if CanEmote == false then
			CanEmote = true
			prayAnim:Stop()
			Player.Humanoid.WalkSpeed = 16
		end
	end

end)