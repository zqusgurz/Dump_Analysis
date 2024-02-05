return function (self) 
if (self.ToRenderEquip ~= self.RenderedEquip) then
	self:SetItemTooptip(_UserService.LocalPlayer.WsCharacterData, self.ToRenderEquip)
end
end