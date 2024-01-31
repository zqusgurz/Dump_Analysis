return function (self) 
local anims = self.Animations

local ds2 = _DataService:GetTable("PetAnimations")
for i=1,ds2:GetRowCount() do
	anims[ds2:GetCell(i, 1)] = ds2:GetCell(i, 2)
end
local ds3 = _DataService:GetTable("MobAttackAnimations")
for i=1,ds3:GetRowCount() do
	anims[ds3:GetCell(i, 1)] = ds3:GetCell(i, 2)
end
local skillAnis = _DataService:GetTable("SkillAnimation")
for i=1,skillAnis:GetRowCount() do
	anims[skillAnis:GetCell(i, 1)] = skillAnis:GetCell(i, 2)
end

-- TODO: 도와줘!!! 살려줘!!!
anims["Map/Effect.img/quest/party/clear"] = "35911c23429b404ba152cb38f2d87f60"
anims["Map/Effect.img/quest/party/wrong_kor"] = "b2334542583945089da8da65f7c7be9f"
end