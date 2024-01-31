return function (self,i,digit) 
---@return SpriteGUIRendererComponent
local function getByIndex(idx)
	if (idx == 1) then return self.P0 end
	if (idx == 2) then return self.P1 end
	if (idx == 3) then return self.P2 end
	if (idx == 4) then return self.P3 end
	return nil
end
local s = getByIndex(i)
if (digit >= 0) then
	s.Entity.Enable = true
	s.ImageRUID = self.RUIDTable[digit]
else
	s.Entity.Enable = false
end
end