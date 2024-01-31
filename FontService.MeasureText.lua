return function (self,line,spacingX,fontName) 
local sizeX = 0

local list,num = self:GetCharXList(line, spacingX, fontName)
for i=1,num do
	sizeX += list[i]
end
--for _,x in self:_IterateCharX(line, spacingX, fontName) do
--    sizeX = sizeX + x
--end

return sizeX
end