return function (self,uiEntity,x,y,width,height) 
--local mm = uiEntity.MemoryInitValuesComponent
--if (isvalid(mm)) then
--    if (x ~= nil) then
--        mm.OriginAnchoredPosition.x = x
--    end
--    if (y ~= nil) then
--        mm.OriginAnchoredPosition.y = y
--    end
--    if (width ~= nil) then
--        mm.OriginRectSize.x = width
--    end
--    if (height ~= nil) then
--        mm.OriginRectSize.y = height
--    end
--else
	local uit = uiEntity.UITransformComponent
	if (x ~= nil) then
		uit.anchoredPosition.x = x * 2
	end
	if (y ~= nil) then
		uit.anchoredPosition.y = y * 2
	end
	if (width ~= nil) then
		uit.RectSize.x = width * 2
	end
	if (height ~= nil) then
		uit.RectSize.y = height	* 2
	end
--end
end