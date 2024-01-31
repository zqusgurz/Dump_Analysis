return function (self,player) 
local avatar = player:GetChildByName("avatar")
local body = avatar.AvatarRendererComponent:GetBodyEntity()
local event1 = ActionStateChangedEvent("sit", "sit")
body:SendEvent(event1)
avatar.CostumeManagerComponent.DefaultEquipUserId = player.PlayerComponent.UserId
end