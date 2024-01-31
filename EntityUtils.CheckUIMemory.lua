return function (self,entity,remember,invalidateFlag) 
if (entity ~= nil) then
	return
end

-----@type MemoryInitValuesComponent
--local k = entity.MemoryInitValuesComponent
--if (not isvalid(k)) then
--    --local sz = entity.UITransformComponent.RectSize
--    --log(string.format("MemoryInit Saving Entity:%s (%s) size:(%.2f,%.2f)", entity.Name, entity.Id, sz.x, sz.y))
--    k = entity:AddComponent(MemoryInitValuesComponent)
--    k:OnCreate()
--elseif (remember) then
--    k:OnCreate()
--end
--if (remember ~= nil) then
--    -- log("Invalidte UI Size")
--    k:Invalidate(invalidateFlag)
--    local masp = entity.MapleSpriteRendererComponent
--    if (isvalid(masp)) then
--        masp:OnUpdateLocalScale()
--    end
--end
end