return function (self) 
local templateId = self.NpcTemplateID
local template = _NpcTemplateMan:GetNpcTemplate(templateId)
log("Npc clicked: " .. tostring(templateId))
if (not _UserService.LocalPlayer.WsUser:IsAvailableInventoryOperation()) then
	return
end
local d0 = ""
local stringRoot = _String_Npc.Strings[templateId]
if (stringRoot) then
	d0 = stringRoot["d0"] or ""
end

local completes = self:AddNearCompleteQuestList()
local starts = self:AddAvailableStartQuestList()
local progresses = self:AddInProgressQuestList()
local completesNum = #completes
local startsNum = #starts
local progressesNum = #progresses

local hasScriptInfo = not _UtilLogic:IsNilorEmptyString(template.Script)
local npcQuests = _QuestMan.NpcToQuest[templateId]
local hasQuestMenu = completesNum > 0 or startsNum > 0 or progressesNum > 0

if (npcQuests == nil or (hasScriptInfo and not hasQuestMenu)) then
	_UserService.LocalPlayer.ScriptMachineComponent:OnConversationWithNpc(self.Entity)
	return
end

local dlg = _UtilDlgLogic:GetUtilDlgEx().UtilDlgExComponent
dlg:SetNpc(self.NpcTemplateID)
dlg.PreCheckHandler = nil
dlg.ButtonHandler = nil
if (hasQuestMenu) then
	local scriptInfo = self:AddScriptInfo()
	local menus = {}
	if (completesNum > 0) then table.insert(menus, completes) end
	if (startsNum > 0) then table.insert(menus, starts) end
	if (progressesNum > 0) then table.insert(menus, progresses) end
	if (#scriptInfo > 0) then table.insert(menus, scriptInfo) end
	dlg:SetButton(_UtilDlgExButtonType.None)
	dlg:SetContent(table.concat({
		d0, "\n\n#d", table.concat(menus, "\n\n")
	}))
	dlg.ListHandler = function(button)
		if (button ~= -1) then
			self:OnResponseQuestList(button)
		end
	end
else
	dlg.ListHandler = nil
	dlg:SetButton(_UtilDlgExButtonType.Ok)
	dlg:SetContent(d0)
end
dlg:DisableInputField()
dlg:UpdateScaleUI()
_UpdateComponentLogic:InsertUpdateVisible(dlg.Entity)
end