return function (self) 
local tabCount = self:GetTabCount()
for i=1, tabCount do
	local index = i
	local tabEntity = _SpawnService:SpawnByModelId("model://uiempty", "Tab", Vector3.zero, self.Entity)
	local eachSizeX = self.Entity.UITransformComponent.RectSize.x / self:GetTabCount()
	tabEntity.UITransformComponent.AlignmentOption = AlignmentType.BottomLeft
	tabEntity.UITransformComponent.Pivot = Vector2.zero
	tabEntity.UITransformComponent.RectSize = Vector2(eachSizeX, self.Entity.UITransformComponent.RectSize.y * 2)
	tabEntity.UITransformComponent.anchoredPosition = Vector2(eachSizeX * (i - 1), 0)
	self.Tabs[i] = TabMenu():Create(tabEntity, self, i)
	tabEntity:AddComponent(UITouchReceiveComponent)
	tabEntity:ConnectEvent(UITouchDownEvent, function()
		self:OnSelectedTab(index)
		if not (_UtilLogic:IsNilorEmptyString(self.TabClickSoundUOL)) then
			_SoundService:PlaySound(_UidMan:Get(self.TabClickSoundUOL), 1)
		end
	end)
end
if (tabCount > 0 and self.SelectedTabIndex == 0) then 
	self.SelectedTabIndex = 1
end
if (self.SelectedTabIndex > 0 and self.SelectedTabIndex <= tabCount) then
	self:OnSelectedTab(self.SelectedTabIndex)
end
self:UpdateActivatedTabs()
end