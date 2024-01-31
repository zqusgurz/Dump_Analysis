return function (self,illegals) 
local claim = _AppService:Get().OptionMan.Claim
claim.ClaimComponent:Show(illegals)
claim.Enable = true
end