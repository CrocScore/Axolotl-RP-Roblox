local button = script.Parent
local custom = script.Parent.Parent:WaitForChild("Custom1")

button.MouseButton1Click:Connect(function()
	button.Visible = false
	custom.Visible = true
end)
