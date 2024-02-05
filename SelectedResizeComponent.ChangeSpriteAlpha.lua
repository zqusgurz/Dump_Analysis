return function (self) 
local count = 0

---@param parent Entity
local function doSetAlpha(parent)
	---@type table<SpriteGUIRendererComponent>
	local childs = parent:GetChildComponentsByTypeName("SpriteGUIRendererComponent", true)
	for i=1,#childs do
		local sp = childs[i]
		if (sp.Entity.Name == "Icon" or sp.Entity.Name == "IconCash") then
			sp.Color.a = 0
			sp.ImageRUID = ""
		end
	end
	count += #childs
end

doSetAlpha(_EntityService:GetEntityByPath("/ui/ControlWindowGroup/Equip"))

_EditorGUIService:MessageBox(string.format("%d개 SpriteGUIRendererComponent 처리", count))
end