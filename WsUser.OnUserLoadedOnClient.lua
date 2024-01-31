return function (self,enteredMap,hp,fieldCounter) 
local mapInfo = enteredMap.MapInfoComponent
local bgm = mapInfo.Bgm
local app = _AppService:Get() 

app.ControlWindowMan:OnLoadedMap(enteredMap)
--xpcall(function()
--    
--end,
--function(error)
--    log_error("error occured on OnLoadedMap: ", error)
--end)

self:EnableExclusiveAction()
local ac = self.Entity.CharacterActionComponent
ac.AlertTime = 0
ac:UpdateAlert()
ac:ReturnToIdle()
local camera = self.Entity.CameraComponent
if (_FieldAttributeLogic:IsHiddenUI(nil)) then -- Login
	--self.Camera.ZoomRatio = 100 --_UILogic.ScreenHeight / 600 * 105
	camera.CameraOffset.y = -0.5
else
	--self.Camera.ZoomRatio = 100
	camera.CameraOffset.y = 0
end
local keyConfig = app.ControlWindowMan.KeyConfig.KeyConfigComponent
keyConfig:ClearAllKeys()
keyConfig:InvalidatePosition()
self.Hp = hp
self.AntiRepeat = {}
self:CheckPlayerDiedEffect()
app.ModalMan:EndChatAll()

local isLoginMap = enteredMap.Name == "Login"

if (fieldCounter == 1 and not isLoginMap) then
	local cd = self.Entity.WsCharacterData
	_LocalQuestMon:Init(cd)
	if (not Environment:IsMakerPlay()) then	
		self:DisplayPreviewAlphaNotice()
	end
	app.ChatSystem.ChatLog:ClearChatLogs()
	_ChatMessageLogic:Add(_ChatMessageType.Yellow, "[환영] 어서오세요. 빅뱅전 메이플 RPG 월드, Mapleland 입니다.")
	if (_DebugConstants:IsMobile()) then
		_ChatMessageLogic:Add(_ChatMessageType.Blue, "모바일 환경에서 접속하셨습니다. 현재 모바일 환경에서 원활한 플레이는 다소 어려움을 유의하시기 바랍니다.")
	end
	_ExpDropRate:CheckPrintCurrentRateEvent()
end

app:SetLoginGroupEnabled(isLoginMap)
app:ChangeBGM(bgm)
self.ChangedFieldCounter = fieldCounter
local cam = self.Entity.CameraComponent
cam.ZoomRatio = 107
_PlayerActiveSkillLogic_Teleport:ResetCamera()
app:CloseAllTooltip()
_MapEffectLogic:CancelEffectScreen()

if (isLoginMap) then
	collectgarbage()
end

_AppService:Get().FadeScreen:FadeIn(function()
	mapInfo:OnAfterFadeIn()
end)

_ChatSystemLogic.ProcessingWhisperOnClient = 0
local party = app.ControlWindowMan.UserList.UserListComponent.Party
party.Online:UpdateMembersMap()
party.HpBarEntity.PartyHPComponent:UpdatePartyMemberHPInCurrentMap()
self.Entity.PlayerAffectedSkillComponent:_UpdateAffectedSkillList(true)
end