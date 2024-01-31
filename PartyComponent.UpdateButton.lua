return function (self) 
local selected = self.SelectedPartyMember
local localUser = _UserService.LocalPlayer.WsUser
local hasParty = _LocalPartyLogic.LocalParty ~= nil
local leader = _LocalPartyLogic:IsLeader(localUser.CharacterId)
if (hasParty) then
	self.BtCreate.FunctionButtonComponent:SetInteractible(false)
	self.BtInvite.FunctionButtonComponent:SetInteractible(leader)
	self.BtKick.FunctionButtonComponent:SetInteractible(isvalid(selected) and leader and localUser.CharacterId ~= selected.CharacterId)
	self.BtWithdraw.FunctionButtonComponent:SetInteractible(true)
	self.BtChangeBoss.FunctionButtonComponent:SetInteractible(isvalid(selected) and leader and localUser.CharacterId ~= selected.CharacterId)
	self.BtChat.FunctionButtonComponent:SetInteractible(true)
	self.BtWhisper.FunctionButtonComponent:SetInteractible(true)
	self.BtHP.FunctionButtonComponent:SetInteractible(true)
else
	self.BtCreate.FunctionButtonComponent:SetInteractible(true)
	self.BtInvite.FunctionButtonComponent:SetInteractible(false)
	self.BtKick.FunctionButtonComponent:SetInteractible(false)
	self.BtWithdraw.FunctionButtonComponent:SetInteractible(false)
	self.BtChangeBoss.FunctionButtonComponent:SetInteractible(false)
	self.BtChat.FunctionButtonComponent:SetInteractible(false)
	self.BtWhisper.FunctionButtonComponent:SetInteractible(false)
	self.BtHP.FunctionButtonComponent:SetInteractible(false)
end
end