return function (self,uiEntity,x,y) 
self:SetUIEntitySafelyOnly(uiEntity, x, y, nil, nil)
self:CheckUIMemory(uiEntity, false, 1)
end