return function (self) 
local function updateIcon(worldEntity, iconType)
	local icon = self.Entity
	local miniMapData = self:GetMiniMapIconData(iconType)
	icon.SpriteGUIRendererComponent.ImageRUID = miniMapData.RUID
	self.CompletedSizing = false
	self:UpdateIconPosition(true, iconType)
end

-- npc: entity.Id
-- other, local user: entity.Id
-- portal: entity.Id
local worldEntity = self.WorldEntity
if (self.IconType == _MinimapIconType.Other) then
	local iconType = _MinimapIconType.Other
	---@type Party
	local party = _LocalPartyLogic.LocalParty
	if (party ~= nil) then
		if (isvalid(worldEntity)) then
			if (_PartyLogic:IsLeaderMember(party, worldEntity.WsUser.CharacterId)) then
				iconType = _MinimapIconType.PartyMaster
			elseif (_PartyLogic:IsPartyMember(party, worldEntity.WsUser.CharacterId)) then
				iconType = _MinimapIconType.Party
			end
		end
	end
	updateIcon(worldEntity, iconType)
elseif (self.IconType == _MinimapIconType.Npc) then
	local iconType = _MinimapIconType.Npc
	local localUser = _UserService.LocalPlayer
	local npc = self.WorldEntity.NpcComponent
	if (npc.Imitate > 0) then
		if (not _ImitationNpcLogic:HasImitationNpcRecord(npc.NpcTemplateID, localUser.OwnerId, localUser.WsUser.CharacterId)) then
			self.Entity.Enable = false
			return
		end
	end
	if (isvalid(worldEntity)) then
		self.Entity.Enable = true
		local balloonState = worldEntity.NpcComponent.BalloonState
		if (balloonState == 0) then
			iconType = _MinimapIconType.StartNpc
		elseif (balloonState == 2) then
			iconType = _MinimapIconType.EndNpc
		end
		self.Entity.QuickTooltipComponent.Title = _StringMan:GetNpcName(npc.NpcTemplateID)
		updateIcon(worldEntity, iconType)
	else
		self.Entity.Enable = false
	end
elseif (self.IconType == _MinimapIconType.Portal) then
	self.Entity.QuickTooltipComponent.Title = ""
	if (isvalid(worldEntity)) then	
		local pt = worldEntity.MaplePortalComponent
		if (pt.Pt == _PortalType.Visible) then
			self.Entity.QuickTooltipComponent.Title = _StringMan:GetMapName(pt.Tm)
		end
		updateIcon(worldEntity, self.IconType)
	end
else
	updateIcon(worldEntity, self.IconType)
end
end