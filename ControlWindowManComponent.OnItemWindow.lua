return function (self) 
local itemWin = self.Item.ItemWindowComponent
itemWin:SetVisible(not itemWin:IsVisible(), true)
end