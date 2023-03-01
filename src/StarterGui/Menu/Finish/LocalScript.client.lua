local button = script.Parent

local custom1 = script.Parent.Parent:WaitForChild("Custom1")
local custom2 = script.Parent.Parent:WaitForChild("Custom2")

local ownerDelete = script.Parent.Parent.Delete
local ownerLock = script.Parent.Parent.LockUnlock

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GuiService = game:GetService("GuiService")
local PCFrame = game.StarterGui.Menu:WaitForChild("PCFrame")
local MobileFrame = game.StarterGui.Menu:WaitForChild("MobileFrame")
local uis = game:GetService("UserInputService")

local NameEvent = game.ReplicatedStorage.Events.NameEvent

-- transitions

local Transitions = require(game:GetService("ReplicatedStorage").Transitions) --Get the function table
local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local colorCorrectionObject = game:GetService("Lighting"):WaitForChild("FadeInOut") --Path to your ColorCorrectionEffect.

button.MouseButton1Click:Connect(function()
	Transitions.FadeOut(colorCorrectionObject)
	local character = plr.Character or plr.CharacterAdded:wait()
	local humanoid = character:FindFirstChild("Humanoid")
	button.Visible = false
	custom1.Visible = false
	custom2.Visible = false
	wait(3)
	plr.Character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.SpawnLocation.Position)
	ReplicatedStorage.Events.FINE:FireServer()
	humanoid.WalkSpeed = humanoid:GetAttribute("DefaultWalkSpeed")
	humanoid.JumpPower = humanoid:GetAttribute("DefaultJumpPower")
	uis.ModalEnabled = false
		if uis.TouchEnabled and not (uis.KeyboardEnabled and uis.GamepadEnabled and GuiService:IsTenFootInterface())  then
			--player is using a mobile device 
			MobileFrame.Visible = true
		else if uis.KeyboardEnabled then
				-----player is on Pc (or a Pc emulator)
				PCFrame.Visible = true
			end
		end
	wait(3)
	script.Parent.Parent.TextBox.Visible = true
	ownerDelete.Visible = true
	ownerLock.Visible = true
	Transitions.FadeIn(colorCorrectionObject)
	NameEvent:FireServer()
end)