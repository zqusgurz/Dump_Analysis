return function (self,image) 
local errMsg = self.Entity.SpriteGUIRendererComponent
errMsg.ImageRUID = _UidMan:GetRawRUID(image)
self.TextMessage.TextComponent.Text = ""
self.CodeText.TextComponent.Text = ""
self.TimeoutText.TextComponent.Text = ""
end