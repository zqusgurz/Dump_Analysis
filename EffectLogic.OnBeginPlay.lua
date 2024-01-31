return function (self) 
self.SoundWeapon = _ResourceMan:ParseGenericWzCollection("Sound", "Weapon")
self.SoundUI = _ResourceMan:ParseGenericWzCollection("Sound", "UI")
self.SoundGame = _ResourceMan:ParseGenericWzCollection("Sound", "Game")

for k,o in pairs(_ResourceMan:ParseGenericWzCollection("Sound", "Skill")) do
	self.SoundSkill[tonumber(k)] = o
end
for k,o in pairs(_ResourceMan:ParseGenericWzCollection("Sound", "Mob")) do
	self.SoundMob[tonumber(k)] = o
end
for k,o in pairs(_ResourceMan:ParseGenericWzCollection("Sound", "Item")) do
	self.SoundItem[tonumber(k)] = o["Use"]
end

local bulletDs = _DataService:GetTable("BulletItem")
for i=1,bulletDs:GetRowCount() do
	local id = tonumber(bulletDs:GetCell(i, 1))
	local projectile = bulletDs:GetCell(i, 2)
	local hit = bulletDs:GetCell(i, 3)
	self.Bullet[id] = {
		Projectile = projectile,
		Hit = (hit ~= nil and hit ~= "") and hit or nil
	}
end
local arrowDs = _DataService:GetTable("Item.Consume.0206.img")
for i=1,arrowDs:GetRowCount() do
	self.BulletUOL[tonumber(arrowDs:GetCell(i,1))] = _HttpService:JSONDecode(arrowDs:GetCell(i,2))["bullet"]
end
local javelinDs = _DataService:GetTable("Item.Consume.0207.img")
for i=1,javelinDs:GetRowCount() do
	self.BulletUOL[tonumber(javelinDs:GetCell(i,1))] = _HttpService:JSONDecode(javelinDs:GetCell(i,2))["bullet"]
end

self.EffectCache["NoViolet0"] = _ResourceMan:ParseGenericWzCollection("Effect.BasicEff.img", "NoViolet0")
self.EffectCache["NoViolet0Miss"] = self.EffectCache["NoViolet0"]["Miss"]
self.EffectCache["NoRed0"] = _ResourceMan:ParseGenericWzCollection("Effect.BasicEff.img", "NoRed0")
self.EffectCache["NoRed0Miss"] = self.EffectCache["NoRed0"]["Miss"]
self.EffectCache["NoBlue0"] = _ResourceMan:ParseGenericWzCollection("Effect.BasicEff.img", "NoBlue0")
self.EffectCache["NoCri1"] = _ResourceMan:ParseGenericWzCollection("Effect.BasicEff.img", "NoCri1")
self.EffectCache["LevelUp"] = _ResourceMan:ParseGenericWzCollection("Effect.BasicEff.img", "LevelUp")
self.EffectCache["JobChanged"] = _ResourceMan:ParseGenericWzCollection("Effect.BasicEff.img", "JobChanged")
self.EffectCache["QuestClear"] = _ResourceMan:ParseGenericWzCollection("Effect.BasicEff.img", "QuestClear")
self.EffectCache["TombFall"] = _ResourceMan:ParseGenericWzCollection("Effect.Tomb.img", "fall")

self.HitEffect = _ResourceMan:ParseGenericWzCollection("Afterimage", "hit")

local se = _DataService:GetTable("SummonEffect")
local summonEffect = self.SummonEffectDelay
for i=1,se:GetRowCount() do
	local idx = tonumber(se:GetCell(i, 1))
	local ruid = se:GetCell(i, 2)
	local uol = string.format("Effect/Summon.img/%d", idx)
	_UidMan.Animations[uol] = ruid
	summonEffect[uol] = { Total = tonumber(se:GetCell(i, 3)), Delay = tonumber(se:GetCell(i, 4)) }
end
end