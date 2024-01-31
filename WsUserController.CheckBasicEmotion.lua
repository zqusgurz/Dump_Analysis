return function (self) 
local now = _UtilLogic.ElapsedSeconds

local function checkAndEmotion(key, emotion)
	if (self.EmotionCooltime > now) then
		return
	end
	if (_InputManager:IsPressed(key)) then
		_InputManager:MarkNoKeyInputFuncKey(_FuncKeyTypes.System, key)
		if (not self.Entity.PlayerHitComponent.HitTime > _UtilLogic.ServerElapsedSeconds) then
			self.Entity.AvatarRendererComponent:PlayEmotion(emotion, 5)
			self.EmotionCooltime = now + 3
		end
	end
end

checkAndEmotion(_FuncKeySystemType.EmotionHit, EmotionalType.Hit)
checkAndEmotion(_FuncKeySystemType.EmotionSmile, EmotionalType.Smile)
checkAndEmotion(_FuncKeySystemType.EmotionTroubled, EmotionalType.Troubled)
checkAndEmotion(_FuncKeySystemType.EmotionCry, EmotionalType.Cry)
checkAndEmotion(_FuncKeySystemType.EmotionAngry, EmotionalType.Angry)
checkAndEmotion(_FuncKeySystemType.EmotionBewildered, EmotionalType.Bewildered)
checkAndEmotion(_FuncKeySystemType.EmotionStunned, EmotionalType.Stunned)
end