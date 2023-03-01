local GamepassId = 20427761

script.Parent.MouseButton1Click:Connect(function()
	game:GetService("MarketplaceService"):PromptGamePassPurchase(game.Players.LocalPlayer, GamepassId)
end)
