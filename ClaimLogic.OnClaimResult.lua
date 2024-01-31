return function (self,mes) 
local claim = _AppService:Get().OptionMan.Claim
claim.Enable = false
_UtilDlgLogic:Show(mes)
claim.ClaimComponent.BtOk.FunctionButtonComponent:SetInteractible(true)
end