return function (self) 
local localPlayer = _UserService.LocalPlayer
local otherPlayer = self.OtherPlayer
self.MyName.Text = localPlayer.WsUser.CharacterName
self.MyMeso.Text = "0"
self.MyMesoReadable.Text = "0"
local otherPlayerIsPresent = isvalid(otherPlayer)
if (otherPlayerIsPresent) then
	self.OtherAvatar.Entity.Enable = true
	self.OtherName.Text = otherPlayer.WsUser.CharacterName
	self.OtherMeso.Text = "0"
	self.OtherMesoReadable.Text = "0"
else
	self.OtherAvatar.Entity.Enable = false
	self.OtherName.Text = ""
	self.OtherMeso.Text = ""
	self.OtherMesoReadable.Text = ""
end
self.ChatHistory = {}
self.ChatText.Text = ""
self.ChatInput.TextInputComponent.Text = ""
self.ChatInput.TextComponent.Text = ""
for i=1,9 do
	---@type Entity
	local myItem = self.MyItems[i]
	---@type Entity
	local otherItem = self.OtherItems[i]
	local myElement = myItem.TradingRoomItemElementComponent
	myElement:SetItem(0)
	myElement:SetItemNo(-1)
	myElement.Item = nil
	local otherElement = otherItem.TradingRoomItemElementComponent
	otherElement:SetItem(0)
	otherElement:SetItemNo(-1)
	otherElement.Item = nil
	myItem.Enable = otherPlayerIsPresent
	otherItem.Enable = otherPlayerIsPresent
end
self.MyLock.Enable = false
self.OtherLock.Enable = false
self.MyMesoButton.FunctionButtonComponent:SetInteractible(otherPlayerIsPresent)
self.OtherMesoButton.FunctionButtonComponent:SetInteractible(otherPlayerIsPresent)
self.BtTrade.FunctionButtonComponent:SetInteractible(otherPlayerIsPresent)

---@param u Entity
---@param costume CostumeManagerComponent
local function updateAvatarLook(u, costume)
	local cd = u.WsCharacterData
	local mswAvatar = u.WsUserAvatarLook.MSWAvatarForPart
	local blockedMSWAvatar = u.WsUserAvatarLook:IsBlockedMSWAvatarToMe()
	_PlayerCostumeLogic:UpdateCustomCostume(u.OwnerId, blockedMSWAvatar, costume, cd.Gender, cd.Face, cd.Hair, cd.Skin, cd.AvatarLook, mswAvatar)
end

updateAvatarLook(localPlayer, self.MyAvatar)
if (otherPlayerIsPresent) then
	updateAvatarLook(otherPlayer, self.OtherAvatar)
end
end