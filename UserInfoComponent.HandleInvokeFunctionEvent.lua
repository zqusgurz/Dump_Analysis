return function (self,event) 
self.__ControlWindowComponent__.HandleInvokeFunctionEvent(self, event)
local Function = event.Function

if (Function == "Item") then
	self:ShowItemListWindow(not self.ItemList.Enable)
elseif (Function == "HideItem") then
	self:ShowItemListWindow(false)
elseif (Function == "Wish") then
	
elseif (Function == "Party") then
	if (not self.IsSelf) then
		_PartyProcessorLogic:OnInvitePartyReq(_UserService.LocalPlayer, self.CharacterName.Text)
	end
elseif (Function == "Trade") then
	if (not self.IsSelf) then
		_TradingRoomLogic:InviteTradeByCharacterId(self.TargetUserId)
	end
elseif (Function == "PopUp" or Function == "PopDown") then
	local localPlayer = _UserService.LocalPlayer
	local targetPlayer = _UserDictionary:FindUserInMap(self.TargetUserId)
	if (localPlayer == targetPlayer) then
		return
	end
	if (targetPlayer == nil) then
		_UtilDlgLogic:Show("같은 맵에 있는 대상이 아닙니다.")
		return
	end
	if (localPlayer.WsUser.ExclusiveAction) then
		_ChatMessageLogic:Add(_ChatMessageType.Red, "잠시 후 다시 시도해 보세요")
		return
	end
	if (localPlayer.WsCharacterData.Level < 15) then
		_ChatMessageLogic:Add(_ChatMessageType.Red, "레벨 15미만은 인기도를 올리거나 내리지 못합니다.")
		return
	end
	localPlayer.WsUser.ExclusiveAction = true
	if (Function == "PopUp") then
		if (Environment:IsMobilePlatform()) then
			_UtilDlgLogic:YesNo("대상의 인기도를 올리시겠습니까?", function()
				_PlayerInfoLogic:GivePop(localPlayer, targetPlayer, 1)
			end, nil)
		else
			_PlayerInfoLogic:GivePop(localPlayer, targetPlayer, 1)
		end
	else
		if (Environment:IsMobilePlatform()) then
			_UtilDlgLogic:YesNo("대상의 인기도를 내리시겠습니까?", function()
				_PlayerInfoLogic:GivePop(localPlayer, targetPlayer, -1)
			end, nil)
		else
			_PlayerInfoLogic:GivePop(localPlayer, targetPlayer, -1)
		end
	end
elseif (Function == "ShowPet") then
	self.OnlyLarge.Enable = true
	self.OnlySmall.Enable = false
elseif (Function == "HidePet") then
	self.OnlyLarge.Enable = false
	self.OnlySmall.Enable = true
elseif (Function == "BtAvatarOnOff") then
	if (not self.IsSelf) then
		local targetUser = _UserDictionary:FindUserInMap(self.TargetUserId)
		if (targetUser) then
			local currentState = targetUser.WsUserAvatarLook:IsBlockedMSWAvatarToMe()
			targetUser.WsUserAvatarLook:SetBlockedMSWAvatarToMe(not currentState)
		else
			_UtilDlgLogic:Show("같은 맵에 있는 대상에게만 사용할 수 있습니다.")
		end
	end
end
end