return function (self,uiEntity,x,y,width,height) 
self:SetUIEntitySafelyOnly(uiEntity, x, y, width, height)
local flag = 0
if (x ~= nil or y ~= nil) then
	flag |= 1
end
if (width ~= nil or height ~= nil) then
	flag |= 2
end
self:CheckUIMemory(uiEntity, false, flag)
end