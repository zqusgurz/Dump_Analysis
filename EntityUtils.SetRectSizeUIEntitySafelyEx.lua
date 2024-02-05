return function (self,uiEntity,x,y) 
self:SetUIEntitySafelyOnly(uiEntity, nil, nil, x, y)
self:CheckUIMemory(uiEntity, false, 2)
end