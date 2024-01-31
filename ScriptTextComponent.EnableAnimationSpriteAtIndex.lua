return function (self,tb,i) 
---@type Entity
local obj = tb[i]
obj.RichGlyphComponent:SetEnableMouseOver(2, nil, 0, 0, 0, nil)
_UpdateComponentLogic:InsertUpdateVisible(obj)
end