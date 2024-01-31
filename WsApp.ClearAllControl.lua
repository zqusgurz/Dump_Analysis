return function (self) 
local ctrlMan = self.ControlWindowMan

ctrlMan.Stat.StatWindowComponent:SetVisible(false, false)
ctrlMan.Equip.EquipWindowComponent:SetVisible(false, false)
ctrlMan.Item.ItemWindowComponent:SetVisible(false, false)
ctrlMan.KeyConfig.KeyConfigComponent:SetVisible(false, false)
ctrlMan.UserInfo.UserInfoComponent:SetVisible(false, false)
ctrlMan.Quest.QuestWindowComponent:SetVisible(false, false)
ctrlMan.WorldMap.WorldMapComponent:SetVisible(false, false)

local skillWin = ctrlMan.Skill.SkillWindowComponent
skillWin:SetVisible(false, false)
skillWin.Tabs:OnSelectedTab(1)
skillWin.CurrentTab = -1

self.ModalMan:Clear()
self.TemporaryStat:Clear()
end