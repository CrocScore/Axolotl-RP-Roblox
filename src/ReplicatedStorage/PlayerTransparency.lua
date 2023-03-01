local PlayerTransparency = {}

-- player transparency to show and hide

function PlayerTransparency.Show(plr)
	local char = plr.Character
	local baseTable = char.BaseColor:GetChildren()
	local secondTable = char.SecondaryColor:GetChildren()
	--, char.LeftEye, char.RightEye, char.Mouth
	for v, i in ipairs({char.Head, char.LeftEye, char.RightEye, char.Mouth}) do
		i.Transparency = 0
	end
	
	for v, i in ipairs(baseTable) do
		i.Transparency = 0
	end
	
	for v, i in ipairs(secondTable) do
		i.Transparency = 0
	end
end

function PlayerTransparency.Hide(plr)
	local char = plr.Character
	local baseTable = char.BaseColor:GetChildren()
	local secondTable = char.SecondaryColor:GetChildren()
	--, char.LeftEye, char.RightEye, char.Mouth
	for v, i in ipairs({char.Head, char.LeftEye, char.RightEye, char.Mouth}) do
		i.Transparency = 1
	end

	for v, i in ipairs(baseTable) do
		i.Transparency = 1
	end

	for v, i in ipairs(secondTable) do
		i.Transparency = 1
	end
end

-- set if player can collide or not

function PlayerTransparency.Collide(plr)
	local char = plr.Character
	local baseTable = char.BaseColor:GetChildren()
	local secondTable = char.SecondaryColor:GetChildren()

	for v, i in ipairs({char.Head, char.LeftEye, char.RightEye, char.Mouth}) do
		i.CanCollide = true
	end

	for v, i in ipairs(baseTable) do
		i.CanCollide = true
	end

	for v, i in ipairs(secondTable) do
		i.CanCollide = true
	end
end

function PlayerTransparency.Clip(plr)
	local char = plr.Character
	local baseTable = char.BaseColor:GetChildren()
	local secondTable = char.SecondaryColor:GetChildren()

	for v, i in ipairs({char.Head, char.LeftEye, char.RightEye, char.Mouth}) do
		i.CanCollide = false
	end

	for v, i in ipairs(baseTable) do
		i.CanCollide = false
	end

	for v, i in ipairs(secondTable) do
		i.CanCollide = false
	end
end

return PlayerTransparency
