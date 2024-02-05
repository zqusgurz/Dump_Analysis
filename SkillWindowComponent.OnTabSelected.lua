return function (self,tab) 
local maxTab = 1
local cd = _UserService.LocalPlayer.WsCharacterData
if (cd.Job ~= 0) then
	maxTab = _Jobs:GetJobLevel(cd.Job) + 1
end
if (tab == -1 or tab > maxTab) then
	tab = 1
end

self.CurrentTab = tab

_AppService:Get().ToolTipMan:TryReleaseToolTip(_TooltipType.Skill, self.Entity)

local skillJob = 0
if (tab == 1) then
	skillJob = 0
elseif (tab == 2) then
	skillJob = cd.Job // 100 * 100
elseif (tab == 3) then
	skillJob = cd.Job // 10 * 10 + 0
elseif (tab == 4) then
	skillJob = cd.Job // 10 * 10 + 1
elseif (tab == 4) then
	skillJob = cd.Job // 10 * 10 + 2
end

local skills = {}
local skillsIndex = 0
for s,i in pairs(_SkillMan._skills) do
	if (s // 10000 == skillJob) then
		if (not _Skills:IsVisible(cd, s, i)) then
			continue
		end
		skills[skillsIndex + 1] = s
		skillsIndex += 1
	end
end
table.sort(skills)

self.BookIcon.ImageRUID = _SkillMan.Book[skillJob]
self.BookName.Text = _StringMan:GetBookName(skillJob)
self:UpdateSkillPoint()

local entries = self.SkillEntries
local entriesNum = #entries
if (skillsIndex > entriesNum) then
	for i=entriesNum+1,skillsIndex do
		entries[i] = self:CreateSkillEntry()
	end
	entriesNum = skillsIndex
end

for i=1,skillsIndex do
	---@type Entity
	local entry = entries[i]
	local sid = skills[i]
	entry.SkillEntryComponent:SetSkill(sid)
	entry.Enable = true
	_UpdateComponentLogic:InsertUpdateVisible(entry)
end

for i=skillsIndex+1,#entries do
	---@type Entity
	local entry = entries[i]
	entry.Enable = false
	entry.Visible = false
end

local scrollLayout = self.Skills.ScrollLayoutGroupComponent
scrollLayout:ResetScrollPosition(UITransformAxis.Vertical)
_ScrollEventHolder:SendScrollbarEvent(self.Skills, nil, nil)
end