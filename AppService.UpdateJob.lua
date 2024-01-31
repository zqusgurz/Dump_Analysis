return function (self) 
local app = self:Get()
local u = _UserService.LocalPlayer
local user = u.WsUser
local userData = u.WsCharacterData
local job = userData.Job

if (job < 0) then
	return
end

--log("Begin Update Job  Job:" .. job)

local jobClass = _Jobs:GetJobClass(job)
local jobClassName = _Jobs:GetJobClassName(jobClass)

local cwndMan = app.ControlWindowMan
local statWindow = cwndMan.Stat.StatWindowComponent

local jobName = _Jobs:GetJobName(job, true)
app:GetStatusBar().Job:SetText(jobName)
statWindow.Job.Text.TextComponent.Text = jobName

app:GetStatusBar().Name.Text = user.CharacterName

statWindow.Name.Text.TextComponent.Text = user.CharacterName

--log("End Update Job")

local sw = cwndMan.Skill.SkillWindowComponent
sw.Tabs:UpdateActivatedTabs()

self:CheckBasicStatGuide(userData, statWindow)

cwndMan.Equip.EquipWindowComponent:UpdateDisabledEquip()
_LocalQuestMon:CheckQuestDemandState(-1, true)
end