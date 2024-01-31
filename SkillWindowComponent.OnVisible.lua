return function (self) 
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.Skill))
local maxTab = 1
local cd = _UserService.LocalPlayer.WsCharacterData
if (cd.Job ~= 0) then
	maxTab = _Jobs:GetJobLevel(cd.Job) + 1
else
	maxTab = 1
end
self.Tabs.MaxActivatedTab = maxTab
self.Tabs:UpdateActivatedTabs()
self:OnTabSelected(self.CurrentTab)
end