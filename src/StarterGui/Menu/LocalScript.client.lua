local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local PCFrame = script.Parent:WaitForChild("PCFrame")
local MobileFrame = script.Parent:WaitForChild("MobileFrame")

if UserInputService.TouchEnabled and not (UserInputService.KeyboardEnabled and UserInputService.GamepadEnabled and GuiService:IsTenFootInterface())  then
	--player is using a mobile device 
	MobileFrame.Visible = true
else if UserInputService.KeyboardEnabled then
		-----player is on Pc (or a Pc emulator)
		PCFrame.Visible = true
	end
end
