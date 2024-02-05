return function (self) 
local timer = -1

-- 부활 UI창 표시
local function checkReviveWindow()
	if ((_ScreenResolutionLogic.CreateUIReadyFlag & _Constants.CreateFlag_ControlWindow) == 0) then
		return
	end
	self:OnLeaveFieldClient()
	local reviveWindow = _AppService:Get().ControlWindowMan.Revive.ReviveNoticeComponent
	if not (reviveWindow:IsVisible()) then
		if (self._T.ReviveUITween == nil) then
			self._T.ReviveUITween = _TimerService:SetTimerOnce(function() 
				if (self:IsDied()) then
					reviveWindow:SetVisible(true, false)					
				end
				self._T.ReviveUITween = nil
			end, 1)
		end
	end
	if (timer ~= -1) then
		_TimerService:ClearTimer(timer)
		timer = -1
	end
end

if ((_ScreenResolutionLogic.CreateUIReadyFlag & _Constants.CreateFlag_ControlWindow) ~= 0) then
	checkReviveWindow()
else
	if (timer == -1) then
		timer = _TimerService:SetTimerRepeat(checkReviveWindow, 1, 1)
	end
end

-- 사망 모션으로 전환
self.Entity.CharacterActionComponent:DisableAlertMode()
self.Entity.StateComponent:ChangeState("DEAD")
self.DiedState = true
end