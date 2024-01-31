return function (self) 
-- Update User Costume
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.NpcShop))
local player = _UserService.LocalPlayer
local cd = player.WsCharacterData
local userAvatarLook = player.WsUserAvatarLook
_PlayerCostumeLogic:UpdateCustomCostume(player.OwnerId, false, self.UserAvatar, cd.Gender, cd.Face, cd.Hair, cd.Skin, cd.AvatarLook, userAvatarLook.MSWAvatarForPart)

self:UpdateMoney()
self.BuyTab.TabsComponent:OnSelectedTab(1)
local sellTab = self.CurrentSellTab
if (sellTab == 0) then
	sellTab = 1
end
self.SellTab.TabsComponent:OnSelectedTab(sellTab)
end