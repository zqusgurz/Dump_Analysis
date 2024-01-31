return function (self,event) 
-- 마우스 좌클릭 or 메인 터치만
if not (_InputUtils:IsPrimaryButton(event.TouchId)) then 
	return
end

self:_OnMoveScroll(event.TouchDelta)
end