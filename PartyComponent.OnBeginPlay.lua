return function (self) 
self.BtCreate:ConnectEvent(ButtonClickEvent, function()
	_PartyProcessorLogic:CreatePartyReq()
end)
self.BtInvite:ConnectEvent(ButtonClickEvent, function()
	_UtilDlgLogic:Input("파티에 초대할 캐릭터 이름을\r\n입력하세요", false, "", function(name)
		if (_Slangs:IsValidCharacterName(name)) then
			_PartyProcessorLogic:OnInvitePartyReq(_UserService.LocalPlayer, name)
		end
	end, nil)
end)
self.BtKick:ConnectEvent(ButtonClickEvent, function()
	local selected = self.SelectedPartyMember
	if (isvalid(selected)) then
		_PartyProcessorLogic:KickPartyMember(_UserService.LocalPlayer, selected.Name.Text)
	end
end)
self.BtWithdraw:ConnectEvent(ButtonClickEvent, function()
	_PartyProcessorLogic:LeaveParty(_UserService.LocalPlayer, false)
end)
self.BtChangeBoss:ConnectEvent(ButtonClickEvent, function()
	local selected = self.SelectedPartyMember
	if (isvalid(selected) and selected.CharacterId ~= _UserService.LocalPlayer.WsUser.CharacterId) then
		if (selected.CurrentMap == _UserService.LocalPlayer.CurrentMapName) then
			_PartyProcessorLogic:ChangeBoss(_UserService.LocalPlayer, selected.Name.Text)
		else
			_ChatMessageLogic:Add(_ChatMessageType.Red, "같은 장소에 있는 파티원에게만 양도할 수 있습니다.")
		end
	end
end)
self.BtChat:ConnectEvent(ButtonClickEvent, function()
	_AppService:Get().ChatSystem:ChangeChatTarget(_ChatTargetType.ToParty, nil)
end)
self.BtWhisper:ConnectEvent(ButtonClickEvent, function()
	local selected = self.SelectedPartyMember
	if (isvalid(selected) and selected.CharacterId ~= _UserService.LocalPlayer.WsUser.CharacterId) then
		_AppService:Get().ChatSystem:ChangeChatTarget(_ChatTargetType.ToWhisper, selected.Name.Text)
	end
end)
self.BtHP:ConnectEvent(ButtonClickEvent, function()
	if (not self.HpBarEntity.Enable) then
		self.HpBarEntity.PartyHPComponent:Show()
	else
		self.HpBarEntity.Enable = false
	end
end)
self:UpdateButton()
end