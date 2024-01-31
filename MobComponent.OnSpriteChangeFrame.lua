return function (self,event,state) 

--[[
	갓갓월드의 시스템 상, 사망 State 변경과 Sprite변경이 동기화가 되지 않는 것으로 보임.

	1. State 상관 없이 핸들러가 붙은 순간 시퀀스 시작으로 간주하는 방법
	2. 처음 시작(=BeganSpriteChangeFrameSequence가 false일때)은 무조건 재생시키고,
	   아닐땐 0번 프레임 재생시 Visible을 false 및 이벤트 제거하는 방법

]]

--log_warning(string.format("TemplateID: %d  state: %s  Frame: %d/%d", 
--        self.MobTemplateID, state, event.FrameIndex, event.TotalFrameCount))


local mob = self.Entity
local wzAction
if (state == "IDLE" and self.Fly) then
	wzAction = _MobAction.StateToPropertyAnimation["FLY"]
else
	wzAction = _MobAction.StateToPropertyAnimation[state]
end

if (wzAction) then
	local template = self:GetTemplate()
	if (not template) then
		return
	end
	local root = template.Actions[wzAction]
	if (not root) then
		return
	end
	
	if (not self.BeganSpriteChangeFrameSequence) then
		if (event.TotalFrameCount == root.Max) then
			self.BeganSpriteChangeFrameSequence = true
		else
			return
		end
	else
		if (event.FrameIndex == 0) then
		    self:ConnectSpriteFrameChangedEvent(false, nil)
		    self.Entity.Visible = false
		    return
		end
	end
	
	---@type MobActionFrameData
	local frame = root[event.FrameIndex]
	if (frame) then
		if (frame.A0 ~= -1 or frame.A1 ~= -1 or frame.Z0 ~= -1 or frame.Z1 ~= -1) then
			-- log(string.format("MobActionFrame Apply frame:%d  a0:%d  a1:%d  delay:  %.2f", event.FrameIndex, frame.A0, frame.A1, frame.Delay))
			_MetaAnimationMan:RegisterFrame0(mob, frame.A0, frame.A1, frame.Z0, frame.Z1, frame.Delay, nil)
			return
		end
	end
end
end