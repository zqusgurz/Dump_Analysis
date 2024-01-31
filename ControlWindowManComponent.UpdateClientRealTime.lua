return function (self) 
-- 끅
if (_UserService.LocalPlayer.WsUser:IsDied()) then
	return
end

self:CheckUIFuncKey(_FuncKeySystemType.Inven, function() self:OnItemWindow() end)
self:CheckUIFuncKey(_FuncKeySystemType.Quest, function() self:OnQuestWindow() end)
self:CheckUIFuncKey(_FuncKeySystemType.Equip, function() self:OnEquipWindow() end)
self:CheckUIFuncKey(_FuncKeySystemType.Stat, function() self:OnStatWindow() end)
self:CheckUIFuncKey(_FuncKeySystemType.Skill, function() self:OnSkillWindow() end)
self:CheckUIFuncKey(_FuncKeySystemType.KeySetting, function() self:OnKeySetWindow() end)
self:CheckUIFuncKey(_FuncKeySystemType.WorldMap, function() self:OnWorldMapWindow() end)
self:CheckUIFuncKey(_FuncKeySystemType.Party, function() self:OnPartyWindow() end)
self:CheckUIFuncKey(_FuncKeySystemType.MiniMap, function() 
	if (self.MiniMapZoomLevel == 2) then
		self:ChangeMiniMapLevel(0)
	else
		self:ChangeMiniMapLevel(self.MiniMapZoomLevel + 1)
	end
end)
end