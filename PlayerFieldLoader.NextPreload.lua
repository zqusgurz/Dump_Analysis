return function (self) 
local totalRegistered = #self.RegisterPreloads
if (totalRegistered < self.CurrentPreloadIndex) then
	log("Finished PreloadAsync")
	self.Entity.WsUser:FinishLoading()
	local hiddenUI = _FieldAttributeLogic:IsHiddenUI(nil)
	if (not hiddenUI) then
		self.Entity.WsUser:SetMovementEnable(true)
	end
else
	local entry = self.RegisterPreloads[self.CurrentPreloadIndex]
	_AppService:Get().FadeScreen:SetLoadingText(entry[2])
	wait(0.1)

	self._T.Loading = entry[2]
	_ResourceService:PreloadAsync(entry[1], self.OnPreloadAsync)
end
end