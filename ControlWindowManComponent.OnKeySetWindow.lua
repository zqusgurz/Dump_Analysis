return function (self) 
local keySetWin = self.KeyConfig.KeyConfigComponent
if (keySetWin:IsVisible()) then
	keySetWin:CheckCloseKeySetting()
else
	keySetWin:SetVisible(true, true)
end
end