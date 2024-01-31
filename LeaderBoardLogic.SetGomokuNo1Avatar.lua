return function (self,userId,nickname,rank) 
local avater = self.GomokuRankAvatar:GetChildByName("GomokuAvatar"..tostring(rank))
if avater.Enable == false then
	avater.Enable = true
end

avater.CostumeManagerComponent.DefaultEquipUserId = userId
avater.NameTagComponent.Name = nickname
end