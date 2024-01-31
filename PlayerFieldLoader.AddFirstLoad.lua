return function (self) 
local afterImages = {}
local afterData = _DataService:GetTable("PreloadAfterimage")
local count = 0
for i=1,afterData:GetRowCount() do
	afterImages[i] = afterData:GetCell(i,1)
	count = i
end
local firstNotice = "\n(리소스 다운로드에 다소 시간이 소요될 수 있습니다.)"
table.insert(self.RegisterPreloads, {afterImages, string.format("리소스 - 공격 궤적 (%d개)"..firstNotice, count)})

local effects = {}
local effectData = _DataService:GetTable("PreloadEffect")
for i=1,effectData:GetRowCount() do
	effects[i] = effectData:GetCell(i,1)
	count = i
end
table.insert(self.RegisterPreloads, {effects, string.format("리소스 - 이펙트 (%d개)", count)})

--table.insert(self.RegisterPreloads, {_FontService.FontsPreload["굴림12"], "리소스 - 폰트 (굴림체) (1/2)"..firstNotice})
--table.insert(self.RegisterPreloads, {_FontService.FontsPreload["굴림12Bold"], "리소스 - 폰트 (굴림체) (2/2)"..firstNotice})
--table.insert(self.RegisterPreloads, {_FontService.FontsPreload["굴림12Outline"], "리소스 - 폰트 (굴림체) (3/4)"..firstNotice})
--table.insert(self.RegisterPreloads, {_FontService.FontsPreload["굴림15Bold"], "리소스 - 폰트 (굴림체) (4/4)"..firstNotice})
--table.insert(self.RegisterPreloads, {_FontService.FontsPreload["Tahoma14"], "리소스 - 폰트 (Tahoma) (1/1)"..firstNotice})

local ui = {}
local staticUI = _DataService:GetTable("PreloadUI")
for i=1,staticUI:GetRowCount() do
	ui[i] = staticUI:GetCell(i,1)
	local desc = staticUI:GetCell(i,2)
	count = i
end

local function cacheUISprites()
	_AppService:Get().FadeScreen:SetLoadingText("캐싱 - UI 요소 좌표 정보")
	local function cacheTab(i)
		_ResourcePreloadService:GetSprite(_UidMan:Get(string.format("UI/Basic.img/Tab%d/left0", i)))
		_ResourcePreloadService:GetSprite(_UidMan:Get(string.format("UI/Basic.img/Tab%d/right0", i)))
		_ResourcePreloadService:GetSprite(_UidMan:Get(string.format("UI/Basic.img/Tab%d/fill0", i)))
	end
	cacheTab(3)
	cacheTab(5)
	for i=0,4 do
		_ResourcePreloadService:GetSprite(_UidMan:Get(string.format("UI/UIWindow.img/Item/Tab/enabled/%d", i)))
		_ResourcePreloadService:GetSprite(_UidMan:Get(string.format("UI/UIWindow.img/Skill/Tab/enabled/%d", i)))
	end
	for i=0,6 do
		_ResourcePreloadService:GetSprite(_UidMan:Get(string.format("UI/UIWindow.img/Shop/TabSell/enabled/%d", i)))
		_ResourcePreloadService:GetSprite(_UidMan:Get(string.format("UI/UIWindow.img/Shop/TabBuy/enabled/%d", i)))
	end
	for i=0,3 do
		_ResourcePreloadService:GetSprite(_UidMan:Get(string.format("UI/UIWindow.img/UtilDlgEx/list%d", i)))
	end
	for i=4,5 do
		_ResourcePreloadService:GetSprite(_UidMan:Get(string.format("UI/Basic.img/VScr%d/enabled/prev0", i)))			
		_ResourcePreloadService:GetSprite(_UidMan:Get(string.format("UI/Basic.img/VScr%d/enabled/next0", i)))			
		_ResourcePreloadService:GetSprite(_UidMan:Get(string.format("UI/Basic.img/VScr%d/enabled/thumb0", i)))
		_ResourcePreloadService:GetSprite(_UidMan:Get(string.format("UI/Basic.img/VScr%d/enabled/base", i)))
	end
	for _,t in pairs(_SpriteCharacterRUIDLogic.Table) do
		for _,chr in pairs(t) do
			---@type SpriteCharacter
			local char = chr
			_ResourcePreloadService:GetSprite(char.RUID)
		end
	end
end

table.insert(self.RegisterPreloads, {ui, string.format("리소스 - UI 요소 (%d개)"..firstNotice, count), 
	-- cacheUISprites
})

local skillData = _DataService:GetTable("PreloadSkill")
local totalSkill = skillData:GetRowCount()
local allSkills = {}
local allSkillsIndex = 1
for i=1,totalSkill do
	local skillId = tonumber(skillData:GetCell(i,1))
	if (_Jobs:GetJobLevel(skillId // 10000) >= 3) then
		continue
	end
	if (skillId // 1000000 == 5) then
		continue
	end
	local skills = _HttpService:JSONDecode(skillData:GetCell(i,2))
	local skillsNum = #skills
	if (skillsNum > 0) then
		table.move(skills, 1, skillsNum, allSkillsIndex, allSkills)
		allSkillsIndex += skillsNum
	end
end
table.insert(self.RegisterPreloads, {allSkills, string.format("리소스 - 캐릭터 스킬"..firstNotice)})

--local mobSkillData = _DataService:GetTable("PreloadMobSkill")
--local totalMobSkill = mobSkillData:GetRowCount()
--local allMobSkills = {}
--local allMobSkillsIndex = 1
--for i=1,totalMobSkill do
--    local mobSkills = _HttpService:JSONDecode(mobSkillData:GetCell(i,2))
--    local mobSkillsNum = #mobSkills
--    if (mobSkillsNum > 0) then
--        table.move(mobSkills, 1, mobSkillsNum, allMobSkillsIndex, allMobSkills)
--        allMobSkillsIndex += mobSkillsNum
--    end
--end
--table.insert(self.RegisterPreloads, {allMobSkills, string.format("리소스 - 몬스터 스킬"..firstNotice)})
end