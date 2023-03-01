local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")

local prayButton = game.StarterGui.Menu.MobileFrame.Pray

local UserInputService = game:GetService("UserInputService")

local prayAction = Enum.KeyCode.T

local walkAnim = script:WaitForChild("Walk")
local walkAnimTrack = humanoid.Animator:LoadAnimation(walkAnim)

local prayAnim = script:WaitForChild("Pray")
local prayAnimTrack = humanoid.Animator:LoadAnimation(prayAnim)

local idleAnim = script:WaitForChild("Idle")
local idleAnimTrack = humanoid.Animator:LoadAnimation(idleAnim)

local function tPress()
	return UserInputService:IsKeyDown(prayAction)
end

local tIsPressed = false

local function inputT(input)
	if tPress() and tIsPressed == false then
		tIsPressed = true
		idleAnimTrack:Stop()
		prayAnimTrack:Play()
	else if tPress() and tIsPressed == true then
			tIsPressed = false
			prayAnimTrack:Stop()
			idleAnimTrack:Play()
		end
	end
end

humanoid.Running:Connect(function(speed)
	if speed > 0 then
		if not walkAnimTrack.IsPlaying then
			tIsPressed = false
			idleAnimTrack:Stop()
			walkAnimTrack:Play()
			prayAnimTrack:Stop()
		end
	else
		if walkAnimTrack.IsPlaying then
			walkAnimTrack:Stop()
			idleAnimTrack:Play()
		end
	end
end)

UserInputService.InputBegan:Connect(inputT)