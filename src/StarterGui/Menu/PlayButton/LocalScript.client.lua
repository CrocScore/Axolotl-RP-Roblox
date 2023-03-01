-- camera

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local target = workspace:WaitForChild("RotateObj")
local camera = workspace.CurrentCamera
camera.CameraType = Enum.CameraType.Scriptable
local rotationAngle =  Instance.new("NumberValue")
local tweenComplete = false
local cameraOffset = Vector3.new(0, 10, 20)
local rotationTime = 25 -- time in seconds
local rotationDegrees = 360
local rotationRepeatCount = -1
local lookAtTarget = true -- wheter the camera tilts to point directly at teh target

-- transitions

local Transitions = require(game:GetService("ReplicatedStorage").Transitions) --Get the function table
local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local colorCorrectionObject = game:GetService("Lighting"):WaitForChild("FadeInOut") --Path to your ColorCorrectionEffect.

-- teleport to game place
-- customization

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local TELEPORT_DESTINATION = Vector3.new(game.Workspace.CharHold.Tele1.Position)
local TELEPORT_FACE_ANGLE = 0
local FREEZE_CHARACTER = true

-- module for teleport

local TeleportWithinPlace = require(ReplicatedStorage:WaitForChild("TeleportWithinPlace"))

local PlayButton = script.Parent

local custom1 = script.Parent.Parent:WaitForChild("Custom1")
local custom2 = script.Parent.Parent:WaitForChild("Custom2")

local Finish = script.Parent.Parent:WaitForChild("Finish")

local PlayerTransparency = require(ReplicatedStorage:WaitForChild("PlayerTransparency"))

PlayButton.Visible = true

-- disables mobile controls

local uis = game:GetService("UserInputService")

uis.ModalEnabled = true

-- set up and start rotation tween
local function updateCamera() -- spin camera
	if lookAtTarget == true then
		camera.Focus = target.CFrame
		local rotatedCFrame = CFrame.Angles(0, math.rad(rotationAngle.Value), 0)
		rotatedCFrame = CFrame.new(target.Position) * rotatedCFrame
		camera.CFrame = rotatedCFrame:ToWorldSpace(CFrame.new(cameraOffset))
		camera.CFrame = CFrame.new(camera.CFrame.Position, target.Position)
	end	
end

local function resetCameraSubject() -- resets camera
	if workspace.CurrentCamera and plr.Character then
		local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			workspace.CurrentCamera.CameraSubject = humanoid
			camera.CameraType = Enum.CameraType.Custom
		end
	end
end

-- tween camera

local tweenInfo = TweenInfo.new(rotationTime, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, rotationRepeatCount)
local tween = TweenService:Create(rotationAngle, tweenInfo, {Value=rotationDegrees})
tween.Completed:Connect(function()
	tweenComplete = true
end)
tween:Play()

-- Update camera Position While Tween runs
RunService.RenderStepped:Connect(function()
	if tweenComplete == false then
		updateCamera()
	end
end)

game.ReplicatedFirst:WaitForChild("Loading")
-- script.Parent.Visible = true

-- clicking big buttons

local adultButton = script.Parent.Parent.AdultButton
local childButton = script.Parent.Parent.ChildButton

local debounce = false

local function transNext()
	if debounce == false then
		debounce = true
		PlayButton.Visible = false
		Transitions.FadeOut(colorCorrectionObject)
		wait(3)
		
		local character = plr.Character or plr.CharacterAdded:wait()
		local humanoid = character:FindFirstChild("Humanoid")

		humanoid:SetAttribute("DefaultWalkSpeed", humanoid.WalkSpeed)
		humanoid:SetAttribute("DefaultJumpPower", humanoid.JumpPower)
		humanoid.WalkSpeed = 0
		humanoid.JumpPower = 0

		plr.Character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.CharHold.Tele1.Position)

		PlayerTransparency.Show(plr)
		lookAtTarget = false
		resetCameraSubject()
		wait(1)
		custom1.Visible = true
		--custom2.Visible = true
		Finish.Visible = true
		Transitions.FadeIn(colorCorrectionObject)	
	end
end

local function Button1() -- Click the "PlayButton" button
	transNext()
end

--adultButton.MouseButton1Click:Connect(function()
--	ReplicatedStorage.Events.AdultMode:FireServer()
--	transNext()
--end)

--childButton.MouseButton1Click:Connect(function(plr, modelName)
--	local model = ReplicatedStorage.BabyModel:FindFirstChildWhichIsA("Model")
--	assert(model, "model does not exist for this location!")

--	ReplicatedStorage.Events.BabyMode:FireServer(model.Name)
--	transNext()
--end)


local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local PCFrame = game.StarterGui.Menu:WaitForChild("PCFrame")
local MobileFrame = game.StarterGui.Menu:WaitForChild("MobileFrame")
-- local Button2 = script.Parent.Parent.Frame.CustomText

	--Button2.MouseButton1Click:Connect(function()
	--	script.Parent.Parent.Frame.Visible = false
	--	script.Parent.Parent.Visible = false
	--	if UserInputService.TouchEnabled and not (UserInputService.KeyboardEnabled and UserInputService.GamepadEnabled and GuiService:IsTenFootInterface())  then
	--		--player is using a mobile device 
	--		MobileFrame.Visible = true
	--	else if UserInputService.KeyboardEnabled then
	--			-----player is on Pc (or a Pc emulator)
	--			PCFrame.Visible = true
	--		end
	--	end
	--	lookAtTarget = false
	--	resetCameraSubject()
	--end)

PlayButton.MouseButton1Click:Connect(Button1)