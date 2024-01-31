return function (self) 
-- 부활 UI창 숨김
local reviveWindow = _AppService:Get().ControlWindowMan.Revive.ReviveNoticeComponent
if (reviveWindow:IsVisible()) then
	if (self._T.ReviveUITween ~= nil) then
		_TimerService:ClearTimer(self._T.ReviveUITween)
		self._T.ReviveUITween = nil
	end
	reviveWindow:SetVisible(false, false)
end

-- 일반 모션으로 전환
self.Entity.CharacterActionComponent:ReturnToIdle()
self.DiedState = false
end