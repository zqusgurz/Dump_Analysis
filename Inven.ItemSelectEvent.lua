return function (self,category,info,icon,name) 
local list = _EntityService:GetEntityByPath("/ui/UIGroup/WhiteUI/InventoryUI/Item_Info/Selected_Info")
if info then
	list:GetChildByName("Item_Icon"):GetChildByName("Icon").SpriteGUIRendererComponent.ImageRUID = icon
	list:GetChildByName("Item_Desc"):GetChildByName("Text_Desc").TextComponent.Text = info
	list:GetChildByName("Item_Name").TextComponent.Text = name
	list:GetChildByName("Type").TextComponent.Text = category
else
	list:GetChildByName("Item_Icon"):GetChildByName("Icon").SpriteGUIRendererComponent.ImageRUID = ""
	list:GetChildByName("Item_Desc"):GetChildByName("Text_Desc").TextComponent.Text = ""
	list:GetChildByName("Item_Name").TextComponent.Text = ""
	list:GetChildByName("Type").TextComponent.Text = ""
end
end