return function (self,npcTemplateId,costume) 
local localPlayer = _UserService.LocalPlayer
if (not _ImitationNpcLogic:HasImitationNpcRecord(npcTemplateId, localPlayer.OwnerId, localPlayer.WsUser.CharacterId)) then
	local av = costume.Entity.AvatarRendererComponent
	local avui = costume.Entity.AvatarGUIRendererComponent
	if (isvalid(av)) then
		av.Enable = false
	end
	if (isvalid(avui)) then
		avui.Enable = false
	end
	return
end
local record = _ImitationNpcLogic:GetImitationNpcRecord(npcTemplateId)
local userId = record.UserId
local blocked = localPlayer.PlayerOptionComponent:IsBlockedMSWAvatarToMe(userId)
local avatarLook = record.AvatarLook
_PlayerCostumeLogic:UpdateCustomCostume(userId, blocked, costume,
	record.Gender,
	record.Face,
	record.Hair,
	record.Skin,
	avatarLook,
	{}
)
end