local ReplicatedStorage = game:GetService("ReplicatedStorage")

script.Parent.MouseButton1Click:connect(function()
	ReplicatedStorage.Events.CE4:FireServer()
end)