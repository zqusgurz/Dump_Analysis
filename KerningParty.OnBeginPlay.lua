return function (self) 
---------------------------------------------------------------
local common = _EntityService:GetEntityByPath("/common").PartySystem
local enterUI = _EntityService:GetEntityByPath("/ui/DefaultGroup/PartyDefault/Button4/PartyQuest/ScrollList/1")
enterUI:ConnectEvent(ButtonClickEvent, function()
		self:EnterGame(common.partyID)
		enterUI.Parent.Parent.Enable = false
	end)
end