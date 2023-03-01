game.ReplicatedFirst:WaitForChild("Loading")
local TweenService = game:GetService("TweenService")

local MareSound = script:WaitForChild("SeaOfMare")
local Dire = script:WaitForChild("DireDire")

local button = script.Parent
local AudioPlayed = false
local AudioMuted = false

Dire:Resume()

button.MouseButton1Click:Connect(function()
	if AudioMuted == false then
		Dire.Volume = 0
		button.Text = "Unmute Audio"
		AudioMuted = true
	else if AudioMuted == true then
			Dire.Volume = 0.5
			button.Text = "Mute Audio"
			AudioMuted = false
		end
	end
end)