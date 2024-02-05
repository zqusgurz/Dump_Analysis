return function (self,masterState) 
if (self.MouseOver ~= masterState) then
	self.MouseOver = masterState
	if (masterState) then
		self.Entity.SpriteGUIRendererComponent.ImageRUID = _UidMan:Get("UI/UIWindow.img/UtilDlgEx/dot1")
	else
		self.Entity.SpriteGUIRendererComponent.ImageRUID = _UidMan:Get("UI/UIWindow.img/UtilDlgEx/dot0")
	end
	for _,e in ipairs(self.DotMasterListEntities) do
		---@type Entity
		local entity = e
		entity.RichGlyphComponent.Underline.Enable = masterState
	end
end
end