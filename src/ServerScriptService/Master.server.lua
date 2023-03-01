local players = game.Players

local function og (plr)
	local char = plr.Character
	local q = Color3.fromRGB(255, 152, 220)
	local w = Color3.fromRGB(255, 0, 0)
	local baseTable = char.BaseColor:GetChildren()
	local secondTable = char.SecondaryColor:GetChildren()
	char.Head.Color = q
	for v, i in ipairs(baseTable) do
		i.Color = q
	end
	for v, i in ipairs(secondTable) do
		i.Color = w
	end
end


local function pink (plr)
	local char = plr.Character
	local q = Color3.fromRGB(254,200,234,255)
	local w = Color3.fromRGB(198,61,114,255)
	local baseTable = char.BaseColor:GetChildren()
	local secondTable = char.SecondaryColor:GetChildren()
	char.Head.Color = q
	for v, i in ipairs(baseTable) do
		i.Color = q
	end
	for v, i in ipairs(secondTable) do
		i.Color = w
	end
end

local function yellow(plr)
	local char = plr.Character
	local q = Color3.fromRGB(255, 223, 171)
	local w = Color3.fromRGB(255, 108, 98)
	local baseTable = char.BaseColor:GetChildren()
	local secondTable = char.SecondaryColor:GetChildren()
	char.Head.Color = q
	for v, i in ipairs(baseTable) do
		i.Color = q
	end
	for v, i in ipairs(secondTable) do
		i.Color = w
	end
end

local function brown(plr)
	local char = plr.Character
	local q = Color3.fromRGB(144,107,74,255)
	local w = Color3.fromRGB(38,28,19,255)
	local baseTable = char.BaseColor:GetChildren()
	local secondTable = char.SecondaryColor:GetChildren()
	char.Head.Color = q
	for v, i in ipairs(baseTable) do
		i.Color = q
	end
	for v, i in ipairs(secondTable) do
		i.Color = w		
	end
end

local function white(plr)
	local char = plr.Character
	local q = Color3.fromRGB(240,244,251,255)
	local w = Color3.fromRGB(200,108,147,25)
	local baseTable = char.BaseColor:GetChildren()
	local secondTable = char.SecondaryColor:GetChildren()
	char.Head.Color = q
	for v, i in ipairs(baseTable) do
		i.Color = q
	end
	for v, i in ipairs(secondTable) do
		i.Color = w
	end	
end

local function gold(plr)
	local char = plr.Character
	local q = Color3.fromRGB(233,144,96,255)
	local w = Color3.fromRGB(82,41,22,255)
	local baseTable = char.BaseColor:GetChildren()
	local secondTable = char.SecondaryColor:GetChildren()
	char.Head.Color = q
	for v, i in ipairs(baseTable) do
		i.Color = q
	end
	for v, i in ipairs(secondTable) do
		i.Color = w
	end
end

local function blue(plr)
	local char = plr.Character
	local q = Color3.fromRGB(0,208,240,255)
	local w = Color3.fromRGB(83,132,190,255)
	local baseTable = char.BaseColor:GetChildren()
	local secondTable = char.SecondaryColor:GetChildren()
	char.Head.Color = q
	for v, i in ipairs(baseTable) do
		i.Color = q
	end
	for v, i in ipairs(secondTable) do
		i.Color = w
	end
end

local function green(plr)
	local char = plr.Character
	local q = Color3.fromRGB(177,255,139,255)
	local w = Color3.fromRGB(43,98,39,255)
	local baseTable = char.BaseColor:GetChildren()
	local secondTable = char.SecondaryColor:GetChildren()
	char.Head.Color = q
	for v, i in ipairs(baseTable) do
		i.Color = q
	end
	for v, i in ipairs(secondTable) do
		i.Color = w
	end
end

local function black(plr)
	local char = plr.Character
	local q = Color3.fromRGB(73,87,115,255)
	local w = Color3.fromRGB(46,49,63,255)
	local baseTable = char.BaseColor:GetChildren()
	local secondTable = char.SecondaryColor:GetChildren()
	char.Head.Color = q
	for v, i in ipairs(baseTable) do
		i.Color = q
	end
	for v, i in ipairs(secondTable) do
		i.Color = w
	end
end

local function red(plr)
	local char = plr.Character
	local q = Color3.fromRGB(255, 71, 71)
	local w = Color3.fromRGB(206, 26, 41)
	local baseTable = char.BaseColor:GetChildren()
	local secondTable = char.SecondaryColor:GetChildren()
	char.Head.Color = q
	for v, i in ipairs(baseTable) do
		i.Color = q
	end
	for v, i in ipairs(secondTable) do
		i.Color = w
	end
end

local function purple(plr)
	local char = plr.Character
	local q = Color3.fromRGB(215, 180, 255)
	local w = Color3.fromRGB(126, 79, 180)
	local baseTable = char.BaseColor:GetChildren()
	local secondTable = char.SecondaryColor:GetChildren()
	char.Head.Color = q
	for v, i in ipairs(baseTable) do
		i.Color = q
	end
	for v, i in ipairs(secondTable) do
		i.Color = w
	end
end

local function weighted_random(randomC)
	local poolsize = 0
	for k,v in ipairs(randomC) do
		poolsize = poolsize + v[1]
	end
	local selection = math.random(1,poolsize)
	for k,v in ipairs(randomC) do
		selection = selection - v[1]
		if (selection <= 0) then
			return v[2]
		end
	end
end

local randomC = {
	{17, pink}, {15, yellow}, {15, brown},
	{16.5, white}, {15, gold}, {5, blue},
	{1, green}, {15, black}, {0.5, og}
}

game.Players.PlayerAdded:Connect(function(player)
	print(player.Name.." joined")
	player.CharacterAdded:Connect(function(character)
		--print(player.Name.." spawned")
		--repeat wait() until player.Character

		--weighted_random(randomC)(player)
		--character.Humanoid.Died:Connect(function()
		--	print(player.Name.." died")
		--end)
	end)
end)

-- For the Custom GUI
-- Button per color HERE (default)

game.ReplicatedStorage.Events.CE1.OnServerEvent:Connect(function(plr)
	local Button = game.StarterGui.Menu.Custom1.Default.Button1a
	pink(plr)
end)

game.ReplicatedStorage.Events.CE2.OnServerEvent:Connect(function(plr)
	local Button = game.StarterGui.Menu.Custom1.Default.Button2a
	yellow(plr)
end)

game.ReplicatedStorage.Events.CE3.OnServerEvent:Connect(function(plr)
	local Button = game.StarterGui.Menu.Custom1.Default.Button3a
	white(plr)
end)

game.ReplicatedStorage.Events.CE4.OnServerEvent:Connect(function(plr)
	local Button = game.StarterGui.Menu.Custom1.Default.Button4a
	brown(plr)
end)

game.ReplicatedStorage.Events.CE5.OnServerEvent:Connect(function(plr)
	local Button = game.StarterGui.Menu.Custom1.Default.Button5a
	gold(plr)
end)

game.ReplicatedStorage.Events.CE6.OnServerEvent:Connect(function(plr)
	local Button = game.StarterGui.Menu.Custom1.Default.Button1b
	black(plr)
end)

game.ReplicatedStorage.Events.CE7.OnServerEvent:Connect(function(plr)
	local Button = game.StarterGui.Menu.Custom1.Default.Button2b
	blue(plr)
end)

game.ReplicatedStorage.Events.CE8.OnServerEvent:Connect(function(plr)
	local Button = game.StarterGui.Menu.Custom1.Default.Button3b
	green(plr)
end)

game.ReplicatedStorage.Events.CE9.OnServerEvent:Connect(function(plr)
	local Button = game.StarterGui.Menu.Custom1.Default.Button4b
	red(plr)
end)

game.ReplicatedStorage.Events.CE10.OnServerEvent:Connect(function(plr)
	local Button = game.StarterGui.Menu.Custom1.Default.Button5b
	purple(plr)
end)

-- Change Player CollideFactor And Transparency

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PlayerTransparency = require(ReplicatedStorage:WaitForChild("PlayerTransparency"))

game.ReplicatedStorage.Events.FINE.OnServerEvent:Connect(function(plr)
	local Button = game.StarterGui.Menu.Finish
	PlayerTransparency.Show(plr)
	PlayerTransparency.Collide(plr)
end)

-- Baby and Adult models (DOES NOT WORK)

--local babyModel = ReplicatedStorage.BabyModel
--local adultModel = ReplicatedStorage.AdultModel

--game.ReplicatedStorage.Events.BabyMode.OnServerEvent:Connect(function(player)
--	local Button = game.StarterGui.Menu.ChildButton
--	local oldChar = player.Character
--	local morphModel = babyModel:FindFirstChildOfClass("Model")
--	local newChar = morphModel:Clone()
	
--	newChar:SetPrimaryPartCFrame(oldChar.PrimaryPart.CFrame)
	
--	player.Character = newChar
--	newChar.Parent = game.StarterPlayer
--	player:LoadCharacter()
--end)

--game.ReplicatedStorage.Events.AdultMode.OnServerEvent:Connect(function(plr)
--	local Button = game.StarterGui.Menu.AdultButton
	
--end)