return function (self) 
local equipWin = self.Equip.EquipWindowComponent
equipWin:SetVisible(not equipWin:IsVisible(), true)
end