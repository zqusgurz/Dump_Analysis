return function (self,eqpping1,eqpping2) 
---@type table<integer>
local equippings = {}

for i=1,_BodyParts.Max do
	---@type ItemSlotEquip
	local eqp = eqpping1[i]
	if (eqp ~= nil) then
		equippings[#equippings + 1] = eqp.ItemId
	end
	---@type ItemSlotEquip
	local eqp2 = eqpping2[i]
	if (eqp2 ~= nil) then
		equippings[#equippings + 1] = eqp2.ItemId
	end
end

local itemListView = self.ItemListView
self:EnsureItemEntities(#equippings)
self:DisableUnnessecaryEntities(#equippings)

---@type table<Entity>
local lines = self.ItemLines
---@type table<Entity>
local entities = self.ItemEntries
for i=1,#equippings do
	local item = equippings[i]
	local line = lines[i]
	local entity = entities[i]
	if (entity) then
		entity.Enable = true
		entity.UserInfoItemEntryComponent:SetItem(item)
		_UpdateComponentLogic:InsertUpdateVisible(entity)
	end
	if (line) then
		line.Enable = true
		_UpdateComponentLogic:InsertUpdateVisible(line)
	end
end

local scrollLayout = itemListView.ScrollLayoutGroupComponent
scrollLayout:ResetScrollPosition(UITransformAxis.Vertical)
scrollLayout.UseScroll = false
scrollLayout.UseScroll = true
_ScrollEventHolder:SendScrollbarEvent(itemListView, nil, nil)
end