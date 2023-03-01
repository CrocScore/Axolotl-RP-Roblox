local RS = game:GetService("ReplicatedStorage")
local SS = game:GetService("ServerStorage")
local Players = game:GetService("Players")

local Door1 = SS.Housing.Door1
local Door2 = SS.Housing.Door2
local Door3 = SS.Housing.Door3
local Door4 = SS.Housing.Door4
local Door5 = SS.Housing.Door5
local Door6 = SS.Housing.Door6
local Door7 = SS.Housing.Door7
local Door8 = SS.Housing.Door8
local Door9 = SS.Housing.Door9

RS.Events.DeleteHouse.OnServerEvent:Connect(function(plr)
	local Button = game.StarterGui.Menu.Delete
	local Owners = SS.Housing:GetChildren()
	local MyHouse = string
	for _, v in ipairs(Owners) do
		if plr.Name == v.Value then
			v.Value = ""
			MyHouse = v.Name
		end
		if Door1.Name == MyHouse then
			game.Workspace.Door1.Door.Transparency = 0.2
			game.Workspace.Door1.Door.CanCollide = false
			game.Workspace.Door1.Sign.SurfaceGui.SignText.Text = "No Owner"
		end
		if Door2.Name == MyHouse then
			game.Workspace.Door2.Door.Transparency = 0.2
			game.Workspace.Door2.Door.CanCollide = false
			game.Workspace.Door2.Sign.SurfaceGui.SignText.Text = "No Owner"
		end
		if Door3.Name == MyHouse then
			game.Workspace.Door3.Door.Transparency = 0.2
			game.Workspace.Door3.Door.CanCollide = false
			game.Workspace.Door3.Sign.SurfaceGui.SignText.Text = "No Owner"
		end
		if Door4.Name == MyHouse then
			game.Workspace.Door4.Door.Transparency = 0.2
			game.Workspace.Door4.Door.CanCollide = false
			game.Workspace.Door4.Sign.SurfaceGui.SignText.Text = "No Owner"
		end
		if Door5.Name == MyHouse then
			game.Workspace.Door5.Door.Transparency = 0.2
			game.Workspace.Door5.Door.CanCollide = false
			game.Workspace.Door5.Sign.SurfaceGui.SignText.Text = "No Owner"
		end
		if Door6.Name == MyHouse then
			game.Workspace.Door6.Door.Transparency = 0.2
			game.Workspace.Door6.Door.CanCollide = false
			game.Workspace.Door6.Sign.SurfaceGui.SignText.Text = "No Owner"
		end
		if Door7.Name == MyHouse then
			game.Workspace.Door7.Door.Transparency = 0.2
			game.Workspace.Door7.Door.CanCollide = false
			game.Workspace.Door7.Sign.SurfaceGui.SignText.Text = "No Owner"
		end
		if Door8.Name == MyHouse then
			game.Workspace.Door8.Door.Transparency = 0.2
			game.Workspace.Door8.Door.CanCollide = false
			game.Workspace.Door8.Sign.SurfaceGui.SignText.Text = "No Owner"
		end
		if Door9.Name == MyHouse then
			game.Workspace.Door9.Door.Transparency = 0.2
			game.Workspace.Door9.Door.CanCollide = false
			game.Workspace.Door9.Sign.SurfaceGui.SignText.Text = "No Owner"
		end
	end
end)

RS.Events.Lock.OnServerEvent:Connect(function(plr)
	local Button = game.StarterGui.Menu.LockUnlock
	local Owners = SS.Housing:GetChildren()
	local MyHouse = string
	for _, v in ipairs(Owners) do
		if plr.Name == v.Value then
			MyHouse = v.Name
		end
	end
	print(MyHouse)
	if Door1.Name == MyHouse then
		game.Workspace.Door1.Door.Transparency = 0
		game.Workspace.Door1.Door.CanCollide = true
	end
	if Door2.Name == MyHouse then
		game.Workspace.Door2.Door.Transparency = 0
		game.Workspace.Door2.Door.CanCollide = true
	end
	if Door3.Name == MyHouse then
		game.Workspace.Door3.Door.Transparency = 0
		game.Workspace.Door3.Door.CanCollide = true
	end
	if Door4.Name == MyHouse then
		game.Workspace.Door4.Door.Transparency = 0
		game.Workspace.Door4.Door.CanCollide = true
	end
	if Door5.Name == MyHouse then
		game.Workspace.Door5.Door.Transparency = 0
		game.Workspace.Door5.Door.CanCollide = true
	end
	if Door6.Name == MyHouse then
		game.Workspace.Door6.Door.Transparency = 0
		game.Workspace.Door6.Door.CanCollide = true
	end
	if Door7.Name == MyHouse then
		game.Workspace.Door7.Door.Transparency = 0
		game.Workspace.Door7.Door.CanCollide = true
	end
	if Door8.Name == MyHouse then
		game.Workspace.Door8.Door.Transparency = 0
		game.Workspace.Door8.Door.CanCollide = true
	end
	if Door9.Name == MyHouse then
		game.Workspace.Door9.Door.Transparency = 0
		game.Workspace.Door9.Door.CanCollide = true
	end
end)

RS.Events.Unlocked.OnServerEvent:Connect(function(plr)
	local Button = game.StarterGui.Menu.LockUnlock
	local Owners = SS.Housing:GetChildren()
	local MyHouse = string
	for _, v in ipairs(Owners) do
		if plr.Name == v.Value then
			MyHouse = v.Name
		end
	end
	print(MyHouse)
	if Door1.Name == MyHouse then
		game.Workspace.Door1.Door.Transparency = 1
		game.Workspace.Door1.Door.CanCollide = false
	end
	if Door2.Name == MyHouse then
		game.Workspace.Door2.Door.Transparency = 1
		game.Workspace.Door2.Door.CanCollide = false
	end
	if Door3.Name == MyHouse then
		game.Workspace.Door3.Door.Transparency = 1
		game.Workspace.Door3.Door.CanCollide = false
	end
	if Door4.Name == MyHouse then
		game.Workspace.Door4.Door.Transparency = 1
		game.Workspace.Door4.Door.CanCollide = false
	end
	if Door5.Name == MyHouse then
		game.Workspace.Door5.Door.Transparency = 1
		game.Workspace.Door5.Door.CanCollide = false
	end
	if Door6.Name == MyHouse then
		game.Workspace.Door6.Door.Transparency = 1
		game.Workspace.Door6.Door.CanCollide = false
	end
	if Door7.Name == MyHouse then
		game.Workspace.Door7.Door.Transparency = 1
		game.Workspace.Door7.Door.CanCollide = false
	end
	if Door8.Name == MyHouse then
		game.Workspace.Door8.Door.Transparency = 1
		game.Workspace.Door8.Door.CanCollide = false
	end
	if Door9.Name == MyHouse then
		game.Workspace.Door9.Door.Transparency = 1
		game.Workspace.Door9.Door.CanCollide = false
	end
end)

Players.PlayerRemoving:Connect(function(plr)
	local Owners = SS.Housing:GetChildren()
	local MyHouse = string
	for _, v in ipairs(Owners) do
		if plr.Name == v.Value then
			v.Value = ""
			MyHouse = v.Name
		end
	end
	if Door1.Name == MyHouse then
		game.Workspace.Door1.Door.Transparency = 0.2
		game.Workspace.Door1.Door.CanCollide = false
		game.Workspace.Door1.Sign.SurfaceGui.SignText.Text = "No Owner"
	end
	if Door2.Name == MyHouse then
		game.Workspace.Door2.Door.Transparency = 0.2
		game.Workspace.Door2.Door.CanCollide = false
		game.Workspace.Door2.Sign.SurfaceGui.SignText.Text = "No Owner"
	end
	if Door3.Name == MyHouse then
		game.Workspace.Door3.Door.Transparency = 0.2
		game.Workspace.Door3.Door.CanCollide = false
		game.Workspace.Door3.Sign.SurfaceGui.SignText.Text = "No Owner"
	end
	if Door4.Name == MyHouse then
		game.Workspace.Door4.Door.Transparency = 0.2
		game.Workspace.Door4.Door.CanCollide = false
		game.Workspace.Door4.Sign.SurfaceGui.SignText.Text = "No Owner"
	end
	if Door5.Name == MyHouse then
		game.Workspace.Door5.Door.Transparency = 0.2
		game.Workspace.Door5.Door.CanCollide = false
		game.Workspace.Door5.Sign.SurfaceGui.SignText.Text = "No Owner"
	end
	if Door6.Name == MyHouse then
		game.Workspace.Door6.Door.Transparency = 0.2
		game.Workspace.Door6.Door.CanCollide = false
		game.Workspace.Door6.Sign.SurfaceGui.SignText.Text = "No Owner"
	end
	if Door7.Name == MyHouse then
		game.Workspace.Door7.Door.Transparency = 0.2
		game.Workspace.Door7.Door.CanCollide = false
		game.Workspace.Door7.Sign.SurfaceGui.SignText.Text = "No Owner"
	end
	if Door8.Name == MyHouse then
		game.Workspace.Door8.Door.Transparency = 0.2
		game.Workspace.Door8.Door.CanCollide = false
		game.Workspace.Door8.Sign.SurfaceGui.SignText.Text = "No Owner"
	end
	if Door9.Name == MyHouse then
		game.Workspace.Door9.Door.Transparency = 0.2
		game.Workspace.Door9.Door.CanCollide = false
		game.Workspace.Door9.Sign.SurfaceGui.SignText.Text = "No Owner"
	end
end)