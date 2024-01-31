return function (self) 
log("begin")
local t = _DataService:GetTable("PreloadEffect")
local rows = t:GetRowCount()
for i=rows,1,-1 do
	log("delete row ", i)
	_EditorService:DataSetRemoveRow("PreloadEffect", i)
	log("deleted row!! ", i)
end
self.CurrentRow = 1
self.Cache = {}

_EffectLogic:OnBeginPlay()

for dir,table in pairs(_EffectLogic.SoundWeapon) do
	for name,ruid in pairs(table) do
		if (_UtilLogic:IsNilorEmptyString(ruid)) then continue end
		self:Insert("PreloadEffect", ruid, string.format("Sound/Weapon.img/%s/%s", dir, name))
	end
end
for name,ruid in pairs(_EffectLogic.SoundUI) do
	if (_UtilLogic:IsNilorEmptyString(ruid)) then continue end
	self:Insert("PreloadEffect", ruid, string.format("Sound/UI.img/%s", name))
end
for name,ruid in pairs(_EffectLogic.SoundGame) do
	if (_UtilLogic:IsNilorEmptyString(ruid)) then continue end
	self:Insert("PreloadEffect", ruid, string.format("Sound/Game.img/%s", name))
end
for name,ruid in pairs(_EffectLogic.SoundItem) do
	if (_UtilLogic:IsNilorEmptyString(ruid)) then continue end
	self:Insert("PreloadEffect", ruid, string.format("Sound/Item.img/%08d/Use", name))
end
for dir,table in pairs(_EffectLogic.Bullet) do
	local projectile = table.Projectile
	self:Insert("PreloadEffect", projectile, string.format("BulletItem %d", dir))
end

local function addSubEffect(prefix, sub)
	for dir,value in pairs(sub) do
		local path = prefix .. "/" .. dir
		--log(path, type(value))
		if (type(value) ~= "table") then
			continue
		end
		local ruid = value["_ruid"]
		if (ruid == nil) then
			log_error("no ruid ", path)
			continue
		end
		self:Insert("PreloadEffect", ruid, path)
	end
end

addSubEffect("Effect/BasicEff.img/NoViolet0", _EffectLogic.EffectCache["NoViolet0"])
addSubEffect("Effect/BasicEff.img/NoRed0", _EffectLogic.EffectCache["NoRed0"])
addSubEffect("Effect/BasicEff.img/NoBlue0", _EffectLogic.EffectCache["NoBlue0"])
addSubEffect("Effect/BasicEff.img/NoCri1", _EffectLogic.EffectCache["NoCri1"])
addSubEffect("Effect/BasicEff.img/LevelUp", _EffectLogic.EffectCache["LevelUp"])
addSubEffect("Effect/BasicEff.img/JobChanged", _EffectLogic.EffectCache["JobChanged"])
addSubEffect("Effect/BasicEff.img/TombFall", _EffectLogic.EffectCache["TombFall"])
addSubEffect("Effect/BasicEff.img/QuestClear", _EffectLogic.EffectCache["QuestClear"])

for hitType,table in pairs(_EffectLogic.HitEffect) do
	for index,value in pairs(table) do
		if (type(value) ~= "table") then
			continue
		end
		local ruid = value["_ruid"]
		local path = string.format("Character/Afterimage/hit.img/%s/%s", hitType, index)
		if (ruid == nil) then
			log_error("no ruid ", path)
			continue
		end
		self:Insert("PreloadEffect", ruid, path)
	end
end

self:Insert("PreloadEffect", _UidMan:Get("Sound/Game.img/EnchantSuccess"), "Sound/Game.img/EnchantSuccess")
self:Insert("PreloadEffect", _UidMan:Get("Sound/Game.img/EnchantFailure"), "Sound/Game.img/EnchantFailure")
self:Insert("PreloadEffect", "cf3ab1425a2541ac9e186c6bb46a057d", "Effect/BasicEff.img/Enchant/Success")
self:Insert("PreloadEffect", "50ef2618c45a40b68304f7ad0a873d3e", "Effect/BasicEff.img/Enchant/Failure")
self:Insert("PreloadEffect", "5c225fff42104a3ba3a45f2435ee08df", "Effect/BasicEff.img/Teleport")

log("finish")
end