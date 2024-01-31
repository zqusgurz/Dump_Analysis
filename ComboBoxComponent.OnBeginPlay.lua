return function (self) 
self.Button:ConnectEvent(ButtonClickEvent, self.OpenDropdown)
local selections = _UtilLogic:Split(self.Selection, ",")
for i=1,#selections do
	self.Selections[i] = selections[i]
	local sel = _SpawnService:SpawnByModelId("model://378d6431-da46-4364-91bc-2a07d8b5c4e0", "Dropdown", Vector3.zero, self.Dropdown)
	local index = i
	sel:ConnectEvent(ButtonClickEvent, function()
		self:Select(index)
	end)
	local entryText = sel:GetChildByName("EntryText")
	entryText.TextComponent.Text = selections[i]
end
self.Dropdown.UITransformComponent.RectSize.y = 4 + 34 * #selections
end