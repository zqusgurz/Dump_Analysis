return function (self) 
self.LoginError = _EntityService:GetEntityByPath("/ui/ModalUIGroup/LoginError")
self.LoginButton = _EntityService:GetEntityByPath("/ui/LoginUIGroup/LoginLogo/LoginButton")

local loginError = self.LoginError.LoginErrorWindowComponent
loginError:EnsureFunctionTarget(loginError.BtOk, self.Entity)
loginError:EnsureFunctionTarget(loginError.BtYes1, self.Entity)
loginError:EnsureFunctionTarget(loginError.BtNo1, self.Entity)

local loginButton = self.LoginButton.FunctionButtonComponent
loginButton.FunctionEntity = self.Entity
end