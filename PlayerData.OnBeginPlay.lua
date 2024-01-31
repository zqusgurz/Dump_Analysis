return function (self) 
if _UserService.LocalPlayer ~= self.Entity then return end
wait(1.5)
for k, v in ipairs(_UserService.UserEntities.Values) do
       self:Avatar(v)
end

self._T.time = _UtilLogic.ElapsedSeconds
self._T.count = 0

local panel = _EntityService:GetEntityByPath("/ui/UIGroup/blueUI/BasicPopup/Panel")
panel:GetChildByName("PopupBtnOK"):ConnectEvent(ButtonClickEvent, function()
		local panelNum = tonumber(panel:GetChildByName("Title").TextComponent.Text)
		if panelNum ~= 1 and panelNum ~= 2 then
			_UIToast:ShowMessage("1 이나 2 둘중 하나를 입력하세요.")
			return
		end
		_UserService.LocalPlayer.PlayerDB:UseADCoupon(_UserService.LocalPlayer.PlayerComponent.UserId, panel:GetChildByName("PopupMessage").TextComponent.Text, panelNum)
		panel.Parent.Enable = false
	end)
	
panel:GetChildByName("PopupBtnCancel"):ConnectEvent(ButtonClickEvent, function()
		panel.Parent.Enable = false
	end)
end