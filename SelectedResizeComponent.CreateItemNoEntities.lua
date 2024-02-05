return function (self) 
local count = 0

_EditorService:SetSelectedModel("model://uisprite")

---@param parent Entity
local function doSetAlpha(parent, name)
	---@type table<ItemNoComponent>
	local childs = parent:GetChildComponentsByTypeName("ItemNoComponent", true)
	for i=1,#childs do
		local itemNo = childs[i]
		if (itemNo.Entity.KeyConfigItemNoComponent) then
			local k = itemNo.Entity.KeyConfigItemNoComponent
			if (k.P0) then
				k.P0.Entity:Destroy()
			end
			if (k.P1) then
				k.P1.Entity:Destroy()
			end
			if (k.P2) then
				k.P2.Entity:Destroy()
			end
			if (k.P3) then
				k.P3.Entity:Destroy()
			end
			itemNo.Entity:RemoveComponent(KeyConfigItemNoComponent)
		end
		if (itemNo.Entity.ChildObjectPoolComponent) then
			itemNo.Entity:RemoveComponent(ChildObjectPoolComponent)
		end
		-- _EntityUtils:DestoryChilds(itemNo.Entity)
		if (itemNo.Entity.Name == name) then
			local function createModel(i)
				_EditorService:CreateSelectedModel(Vector2.zero, function(e)
					---@type Entity
					local entity = e
					entity:AttachTo(itemNo.Entity)
					_EntityUtils:PrepareForGUI(entity)
					entity.UITransformComponent.anchoredPosition = Vector2.zero
					entity.SpriteGUIRendererComponent.Color.a = 0
					entity.SpriteGUIRendererComponent.RaycastTarget = false
					entity.UITransformComponent.RectSize = Vector2(8, 11) * 2
					entity.Enable = false
					if (i == 1) then
						itemNo.Pos1 = entity
					end
					if (i == 2) then
						itemNo.Pos2 = entity
					end
					if (i == 3) then
						itemNo.Pos3 = entity
					end
					if (i == 4) then
						itemNo.Pos4 = entity
					end
					_EditorService:RenameEntity(entity, "Pos"..tostring(i))
				end)
			end
			for i=1,4 do
				createModel(i)
			end
		end
	end
	count += #childs
end

doSetAlpha(_EntityService:GetEntityByPath("/ui/ControlWindowGroup/InvenItemCell_New"), "ItemNoDigit")
--doSetAlpha(_EntityService:GetEntityByPath("/ui/ControlWindowGroup/Equip"), "ItemNoDigit")
--doSetAlpha(_EntityService:GetEntityByPath("/ui/ControlWindowGroup/KeyConfig/Keys"), "ItemNo")
--doSetAlpha(_EntityService:GetEntityByPath("/ui/StatusBar/Quickslot"), "ItemNo")

_EditorGUIService:MessageBox(string.format("%d개 SpriteGUIRendererComponent 처리", count))
end