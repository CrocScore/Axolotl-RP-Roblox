local TweenService = game:GetService("TweenService") --Define the tween service.
local Transitions = {}


Transitions.FadeOut = function(object) --New function added to the table
	local info = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 1) --Tween settings
	local goal = {Brightness = -1} --Our property goal 
	local tween = TweenService:Create(object, info, goal) --Create the tween
	tween:Play() --Play the tween
	return tween --Return it, so we can wait to see if it's completed.
end

Transitions.FadeIn = function(object) --New function added to the table
	local info = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 1)  --Tween settings
	local goal = {Brightness = 0} --Our property goal 
	local tween = TweenService:Create(object, info, goal) --Create the tween
	tween:Play() --Play the tween
	return tween --Return it, so we can wait to see if it's completed.
end

return Transitions