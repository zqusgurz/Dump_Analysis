return function (self,userId,nickname) 
if self.YutRankAvatar.Enable == false then
	self.YutRankAvatar.Enable = true
end

self.YutRankAvatar.CostumeManagerComponent.DefaultEquipUserId = userId
self.YutRankAvatar.NameTagComponent.Name = nickname
end