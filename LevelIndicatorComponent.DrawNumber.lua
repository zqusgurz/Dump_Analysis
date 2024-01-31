return function (self,number) 
local digits = _NumberUtils:DecomposeDigits(number)
local digitCount = #digits
if (digitCount == 1 or digitCount == 3) then
	if (digitCount == 3) then
		self.Pos1.Enable = true
		self.Pos2.Enable = true
		self.Pos3.Enable = true
		self.Pos1.SpriteGUIRendererComponent.ImageRUID = _UidMan:Get(string.format("UI/Basic.img/LevelNo/%d", digits[1]))
		self.Pos2.SpriteGUIRendererComponent.ImageRUID = _UidMan:Get(string.format("UI/Basic.img/LevelNo/%d", digits[2]))
		self.Pos3.SpriteGUIRendererComponent.ImageRUID = _UidMan:Get(string.format("UI/Basic.img/LevelNo/%d", digits[3]))
	else
		self.Pos1.Enable = false
		self.Pos2.Enable = true
		self.Pos3.Enable = false
		self.Pos2.SpriteGUIRendererComponent.ImageRUID = _UidMan:Get(string.format("UI/Basic.img/LevelNo/%d", digits[1]))
	end
else
	self.Pos1.Enable = false
	self.Pos2.Enable = false
	self.Pos3.Enable = false
end
if (digitCount == 2) then
	self.Pos4.Enable = true
	self.Pos5.Enable = true
	self.Pos4.SpriteGUIRendererComponent.ImageRUID = _UidMan:Get(string.format("UI/Basic.img/LevelNo/%d", digits[1]))
	self.Pos5.SpriteGUIRendererComponent.ImageRUID = _UidMan:Get(string.format("UI/Basic.img/LevelNo/%d", digits[2]))
else
	self.Pos4.Enable = false
	self.Pos5.Enable = false
end
end