return function (self,value,max,type,valueDecreased) 
if (max == 0) then
	self.Gauge.FillAmount = 0
	return
end
if (self._T.Initialized == true and type ~= _StatusBarElementTypes.Exp) then
	self.OriginFill = self.Gauge.FillAmount
	self.TargetFill = 1 - math.min(1, value / max)
	self.Duration = 0
	if (valueDecreased and self.OriginFill < self.TargetFill) then
		if (type == _StatusBarElementTypes.Hp) then
			if (self.TargetFill >= (1 - _InputManager.HpFlashThreshold)) then
				local u = _UserService.LocalPlayer.WsUser
				if ((u.ConsumeFlag & 1) ~= 0 and u.ConsumeHP > 0) then
					if (_ItemConsumeLogic:TryConsumeFromFuncKey(u.ConsumeHP) == -1) then
						self.Flash.Entity.Enable = true
						self.Flash.ImageRUID = _Constants.HpFlashRUID
						_ChatMessageLogic:Add(_ChatMessageType.Red, "펫이 소비할 HP물약이 모자랍니다.")
					end
				else
					self.Flash.Entity.Enable = true
					self.Flash.ImageRUID = _Constants.HpFlashRUID
				end
			end
		elseif (type == _StatusBarElementTypes.Mp) then
			if (self.TargetFill >= (1 - _InputManager.MpFlashThreshold)) then
				local u = _UserService.LocalPlayer.WsUser
				if ((u.ConsumeFlag & 2) ~= 0 and u.ConsumeMP > 0) then
					if (_ItemConsumeLogic:TryConsumeFromFuncKey(u.ConsumeMP) == -1) then
						self.Flash.Entity.Enable = true
						self.Flash.ImageRUID = _Constants.HpFlashRUID
						_ChatMessageLogic:Add(_ChatMessageType.Red, "펫이 소비할 MP물약이 모자랍니다.")
					end
				else
					self.Flash.Entity.Enable = true
					self.Flash.ImageRUID = _Constants.HpFlashRUID
				end
			end
		end
	end
else
	self.Gauge.FillAmount = 1 - math.min(1, value / max)
	self._T.Initialized = true
end
end