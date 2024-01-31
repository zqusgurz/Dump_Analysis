return function (self) 
local num = self.Entity:GetChildByName("CountPanel"):GetChildByName("Count")
local icon =self.Entity:GetChildByName("Icon")
if self.category == "변신포션" then
	local quantity = tostring(_UserService.LocalPlayer.PlayerDB.Potion[self.idx])
	num.TextComponent.Text = quantity
elseif self.category == "의자" then
	local quantity = _UserService.LocalPlayer.PlayerDB.Chair[self.idx]
	if quantity ~= 1 then
		num.TextComponent.Text = "0"
	else
		num.TextComponent.Text = "보유중"
	end
elseif self.category == "소비" then
	local quantity = tostring(_UserService.LocalPlayer.PlayerDB.Use[self.idx])
	num.TextComponent.Text = quantity
end
end