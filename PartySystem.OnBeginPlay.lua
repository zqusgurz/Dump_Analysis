return function (self) 
local panel = _EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/CreatePartyPanel")
local create = panel:GetChildByName("BottomPanel"):GetChildByName("Create")
local cancel = panel:GetChildByName("BottomPanel"):GetChildByName("Cancel")
local inputPanel = panel:GetChildByName("ContentPanel"):GetChildByName("Input")
local partyInvitePopup = _EntityService:GetEntityByPath("/ui/UIGroup/WhiteUI/PartyInvitePopup")
local partyInvitePopup_Ok = partyInvitePopup:GetChildByName("Btn_Ok")
local partyInvitePopup_No = partyInvitePopup:GetChildByName("Btn_No")
local partyInfo = _EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/PartyInfo/PartyUITitle")
local createPanel = _EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/CreatePartyPanel")
local defaultParty = _EntityService:GetEntityByPath("/ui/DefaultGroup/PartyDefault")
local applyPopup = _EntityService:GetEntityByPath("/ui/UIGroup/WhiteUI/PartyApplyPopup")

partyInvitePopup_Ok:ConnectEvent(ButtonClickEvent, function()
		--파티 초대 메세지 확인 버튼
	self:AcceptPartyInvitation(_UserService.LocalPlayer)
	self.invitePopup.Enable = false
	
	end)

partyInvitePopup_No:ConnectEvent(ButtonClickEvent, function()
		--파티 초대하기 취소버튼
		self:DeclinePartyInvitation(_UserService.LocalPlayer)
		self.invitePopup.Enable = false
		end)

create:ConnectEvent(ButtonClickEvent, function()
		--파티만들기
		if self.partyID ~= 0 then
			_UIToast:ShowMessage("파티를 먼저 탈퇴하세요.")
			return
		end 
		if self._T.create == nil then
			self._T.create = 0
		end
		_TimerService:ClearTimer(self._T.create)
		self._T.create = _TimerService:SetTimerOnce(function()
			local categoryInput = inputPanel:GetChildByName("Category").TextComponent.Text
			local inputName = inputPanel:GetChildByName("Party").TextInputComponent
			local lvJob = _UserService.LocalPlayer.PlayerData
			self:CreateParty(nil, _UserService.LocalPlayer, categoryInput, inputName.Text, lvJob.lv, lvJob.job)
		end, 0.3)

		panel.Enable = false
		self.partyInfoPanel.Enable = false
        --self:Refresh()
		end)

cancel:ConnectEvent(ButtonClickEvent, function()
		--파티만들기 취소
		panel.Enable = false
		self.partyInfoPanel.Enable = true	
		end)

local categoryCreate = inputPanel:GetChildByName("Category")
local scrCategory = categoryCreate:GetChildByName("Scroll_Layout")
categoryCreate:ConnectEvent(ButtonClickEvent, function()
	scrCategory.Enable = not scrCategory.Enable
	end)
for i = 0, 2 do
	local cateB = scrCategory:GetChildByName(tostring(i)) 
	cateB:ConnectEvent(ButtonClickEvent, function()
	categoryCreate.TextComponent.Text = cateB.TextComponent.Text
	scrCategory.Enable = false
	end)
end

for i = 1, 3 do
	inputPanel:GetChildByName("type"..tostring(i)):ConnectEvent(ButtonClickEvent, function()
		local dta = _EntityService:GetEntityByPath("/ui/DataInput/PlayerDataInput").UIIngame
		local caTa = {"일반", "사냥", "거래"}
		if dta.favorite[i] and dta.favorite[i] ~= "" then
			inputPanel:GetChildByName("Party").TextInputComponent.Text = dta.favorite[i]
			categoryCreate.TextComponent.Text = caTa[i]
		else
			_UIToast:ShowMessage("설정에서 먼저 입력하고 이용해주세요")
			_EntityService:GetEntityByPath("/ui/DefaultGroup/WoodButtonUI/Menu_Panel/ScrollList/6"):SendEvent(ButtonClickEvent())
			return
		end
		end)
end

partyInfo:GetChildByName("Create"):ConnectEvent(ButtonClickEvent, function()
		--파티 만들기 버튼
		if self.partyID ~= 0 then
			_UIToast:ShowMessage("파티를 먼저 탈퇴하세요.")
			return
		end
		createPanel.Enable = true
		self.partyInfoPanel.Enable = false
	end)
local joinParty = _EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/PartyInfo/PartyInfoPanel/UIEmpty/JoinParty")
joinParty:ConnectEvent(ButtonClickEvent, function()
        --파티 참가하기 버튼
		if self.partyID ~= 0 then
			_UIToast:ShowMessage("파티를 먼저 탈퇴하세요.")
		return
		end
        if self._T.clickID == nil then return end
	local bee = _EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/PartyInfo/PartyInfoPanel/UIEmpty/PartyName").TextComponent.Text
        self:ApplyParty(self._T.clickID, _UserService.LocalPlayer, bee, _UserService.LocalPlayer.PlayerComponent.UserId)
        _EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/PartyInfo").Enable = false
    end)

partyInfo:GetChildByName("ExitButton"):ConnectEvent(ButtonClickEvent, function()
		--파티창 닫기
		partyInfo.Parent.Enable = false
	end)

local refresh = _EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/PartyInfo/PartyUITitle/Refresh")
refresh:ConnectEvent(ButtonClickEvent, function()
		--새로고침
		self:Refresh()
		refresh.Enable = false
		_TimerService:SetTimerOnce(function()
				refresh.Enable = true
			end, 3)
	end)

local inviteMessage = _EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/InviteMessage")
defaultParty:GetChildByName("Button2"):ConnectEvent(ButtonClickEvent, function()
	inviteMessage.Enable = true
	local textInput = inviteMessage:GetChildByName("PopupMessage").TextInputComponent
    --textInput.Text = ""
	textInput:ActivateInputField()
	
	
	end)


inviteMessage:GetChildByName("BtnOK1"):ConnectEvent(ButtonClickEvent, function()
		--닉네임 찾아서 초대하기
	_EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/InviteMessage/PopupMessage"):SendEvent(KeyDownEvent(KeyboardKey.Return))

	end)

inviteMessage:GetChildByName("BtnCancel1"):ConnectEvent(ButtonClickEvent, function()
		inviteMessage.Enable = false
	end)

defaultParty:GetChildByName("Button1"):ConnectEvent(ButtonClickEvent, function()
		--파탈하기
		self:RemoveMemberFromParty(self.partyID, _UserService.LocalPlayer)
		self:Refresh()
		self.partyID = 0
	end)
local gameName = {"메이플랜드", "아르테일", "로나서버"}
defaultParty:GetChildByName("Button3"):GetChildByName("UIText").TextComponent.Text = "(더블클릭)\n"..gameName[_CalcLogic.Ser].."로\n이동하기"
defaultParty:GetChildByName("Button3"):ConnectEvent(ButtonClickEvent, function()
	if self._T.Tele == nil then
		self._T.Tele = false
	end
	
	if self._T.Tele == false then
		self._T.Tele = true
		_TimerService:SetTimerOnce(function()
			self._T.Tele = false
			end, 0.5)
	else
        self:TeleportWorld(self.partyID, _CalcLogic.Ser)
		self._T.Tele = false
	end
	end)

applyPopup:GetChildByName("Btn_Ok"):ConnectEvent(ButtonClickEvent, function()
		--파티 apply 허락
		self:AcceptPartyApply(self.partyID)
		applyPopup.Enable = false
	end)

applyPopup:GetChildByName("Btn_No"):ConnectEvent(ButtonClickEvent, function()
		--파티 apply 거절
		applyPopup.Enable = false
	end)
end