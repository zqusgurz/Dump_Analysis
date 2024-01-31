return function (self) 
self:SetMovementEnable(false)
_AppService:Get().FadeScreen:SetLoadingText("다음 맵을 여는 중입니다.")
_AppService:Get().FadeScreen:FadeOut(function()
	self:DoTransferringField()
end)
end