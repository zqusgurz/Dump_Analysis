return function (self) 
self.IdentifyPopup = _EntityService:GetEntityByPath("/ui/ModalUIGroup/IdentifyPopup")

local loginError = self.IdentifyPopup.IdentifyPopupWindowComponent
loginError:EnsureFunctionTarget(loginError.BtOk, self.Entity)
loginError:EnsureFunctionTarget(loginError.BtCancel, self.Entity)
loginError:EnsureFunctionTarget(loginError.BtYes1, self.Entity)
loginError:EnsureFunctionTarget(loginError.BtNo1, self.Entity)
end