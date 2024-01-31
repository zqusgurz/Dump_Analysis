return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: ChatBalloonComponent
-- Space: Client
---------------------------------------------------------

-- Parameters
local Message = event.Message
local SenderName = event.SenderName
local UserId = event.UserId
---------------------------------------------------------
if self.Entity ~= _UserService.LocalPlayer then return end
if string.find(Message, "<size") or string.find(Message, "<SIZE") then
	self._T.count += 1
	if self._T.count > 2 then
		_EntityService:GetEntityByPath("/ui/DefaultGroup/UIChat").Enable = false
		_UIToast:ShowMessage("채팅 악용을 막았습니다. 이후로도 계속 적발시 채팅이 완전히 금지됩니다.")
	else
		_UIToast:ShowMessage("채팅 악용이 감지되었습니다."..self._T.count.."회")
	end
elseif string.sub(Message, 1, 16) == "/파티만들기" then
	if _EntityService:GetEntityByPath("/common").PartySystem.partyID ~= 0 then
		_UIToast:ShowMessage("파티를 먼저 탈퇴하세요.", self.Entity.PlayerComponent.UserId)
	else
		_EntityService:GetEntityByPath("/common").PartySystem:CreateParty(nil, _UserService.LocalPlayer, "일반", "이름없음(비공개)", self.lv, self.job)
	end
end

local current = _UtilLogic.ElapsedSeconds
local delta = tonumber(current - self._T.time)
local length = string.len(Message)

if length < 15 then return end
if (length / delta) > 30 then
	self._T.count += 1
	if self._T.count > 2 then
		_EntityService:GetEntityByPath("/ui/DefaultGroup/UIChat").Enable = false
		_UIToast:ShowMessage("도배로 채팅을 막았습니다. 이후로도 계속 적발시 패널티가 있습니다.")
	else	
		_UIToast:ShowMessage("도배가 감지되었습니다."..self._T.count.."회")
	end
end
self._T.time = current
end