return function (self,open) 

local transform = self.popup.UITransformComponent
local canvasGroup = self.popupGroup.CanvasGroupComponent 
if open == true then
	canvasGroup.GroupAlpha = 0
	transform.UIScale = Vector3(self.from,self.from,1)
else
	transform.UIScale = Vector3(self.to,self.to,1)
end
self.isTweenPlaying = true
local time = 0


local preTime = _UtilLogic.ElapsedSeconds

local tween = function()
	local delta = _UtilLogic.ElapsedSeconds - preTime
	time = time + delta
	local timeValue = time	
	preTime = _UtilLogic.ElapsedSeconds

	if time >= self.duration then
		timeValue = self.duration
		if open == false then
			self.popupGroup.Enable = false
			self.isOpen = false
		end
		self.isTweenPlaying = false
		_TimerService:ClearTimer(self.tweenEventId)

	end
	if open == false then
		timeValue = self.duration - timeValue
	end
	local tweenValue = _TweenLogic:Ease(self.from, self.to, 
		self.duration, EaseType.SineEaseIn, timeValue)
	transform.UIScale = Vector3(tweenValue,tweenValue,1)
	canvasGroup.GroupAlpha = timeValue / self.duration
end
self.tweenEventId = _TimerService:SetTimerRepeat(tween,1/60)

end