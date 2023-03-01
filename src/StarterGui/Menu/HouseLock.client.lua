local RS = game:GetService("ReplicatedStorage")

local locked = false

script.Parent.Delete.MouseButton1Click:Connect(function()
	locked = true
	RS.Events.DeleteHouse:FireServer()
end)

script.Parent.LockUnlock.MouseButton1Click:Connect(function()
	print("Hey, I work!")
	if locked == false then
		print("Locked here.")
		RS.Events.Lock:FireServer()
		locked = true
		script.Parent.LockUnlock.Text = "Locked"
	else
		RS.Events.Unlocked:FireServer()
		locked = false
		script.Parent.LockUnlock.Text = "Unlocked"
	end
end)