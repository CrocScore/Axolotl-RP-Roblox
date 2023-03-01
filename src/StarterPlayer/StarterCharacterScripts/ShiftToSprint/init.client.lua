-- ScriptGuider
-- Services & Interface
local Players = game:GetService("Players")
local Input = require(script:WaitForChild("UserInputService"))
local Sprint = {}

-- Config properties
Sprint.Speed = 30 -- Sprint speed boost.
Sprint.Interval = 1000000000 -- How long the sprinting lasts.
Sprint.Cooldown = 10 -- Time it takes for sprinting to cooldown if user sprints longer than the Sprint.Interval.

-- Static properties
Sprint.UseTimeout = true -- If true, make it so the user can only sprint as long as Sprint.Interval is set.
Sprint.UseCooldown = true -- If true, make it so the user has to wait Speed.Cooldown seconds before sprinting again, if user sprints longer than Speed.Interval.
Sprint.Stop = Input:CreateEvent() -- Stop sprinting event, don't mess with.

-- Input module classes
local Keys = Input.Keys
local Mouse = Input.Mouse

-- Local player
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:wait()
local Human = Character:WaitForChild("Humanoid")
local DefSpeed = Human.WalkSpeed

function Sprint:Cancel()
	Human.WalkSpeed = DefSpeed
	self.Stop:Fire()
end

-- Begin sprinting (Left shift down)
Keys.LeftShift.KeyDown:connect(function(Scope)
	if not Scope.Cooldown then
		Human.WalkSpeed = Sprint.Speed
		local Sprinting = true
		
		Sprint.Stop:connect(function()
			Sprinting = false
			Sprint.Stop:disconnect()
		end)
		
		if Sprint.UseTimeout then
			wait(Sprint.Interval)
			
			if Sprinting then
				Sprint:Cancel()
				
				if Sprint.UseCooldown then
					Scope.Cooldown = true
					wait(Sprint.Cooldown)
					Scope.Cooldown = false
				end
			end
		end
	end
end)

-- Stop sprinting (Left shift up)
Keys.LeftShift.KeyUp:connect(function()
	Sprint:Cancel()
end)