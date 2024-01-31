return function (self,event) 
-- 마우스 좌클릭 or 메인 터치만
if not (_InputUtils:IsPrimaryButton(event.TouchId)) then 
	return
end

if (isvalid(self.DragTarget)) then
	self.DragTarget:DragMove(event.TouchDelta)
end
if (isvalid(self.DragTargetAlt)) then
	self.DragTargetAlt.anchoredPosition = self.DragTargetAlt.anchoredPosition
	 + event.TouchDelta * _ControlWindowLogic.UIRatio
end
end