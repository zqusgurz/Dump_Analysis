return function (self) 
local t = self._T
if (t._mapleSprite == nil) then
    t._mapleSprite = self.Entity:GetChildByName("Model_MapleSprite")
end
return t._mapleSprite
end