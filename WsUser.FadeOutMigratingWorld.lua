return function (self) 
self:SetMovementEnable(false)
_AppService:Get().FadeScreen:SetLoadingText("월드 이동 준비중 입니다.")
_AppService:Get().FadeScreen:FadeOut(nil)
end