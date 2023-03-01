local Default = script.Parent.Parent:WaitForChild("Default")
local Premium = script.Parent.Parent:WaitForChild("Premium")
local button1 = script.Parent

button1.MouseButton1Click:Connect(function()
	Premium.Visible = true
	Default.Visible = false
end)