return function (self,eqp,type) 
local HPMP = 10

eqp.STR = self:Make(type, eqp.STR)
eqp.DEX = self:Make(type, eqp.DEX)
eqp.INT = self:Make(type, eqp.INT)
eqp.LUK = self:Make(type, eqp.LUK)
eqp.PAD = self:Make(type, eqp.PAD)
eqp.PDD = self:Make(type, eqp.PDD)
eqp.MAD = self:Make(type, eqp.MAD)
eqp.MDD = self:Make(type, eqp.MDD)
eqp.MHP = HPMP * (self:Make(type, eqp.MHP // HPMP)) + eqp.MHP % HPMP
eqp.MMP = HPMP * (self:Make(type, eqp.MMP // HPMP)) + eqp.MMP % HPMP
eqp.ACC = self:Make(type, eqp.ACC)
eqp.EVA = self:Make(type, eqp.EVA)
eqp.Speed = self:Make(type, eqp.Speed)
eqp.Jump = self:Make(type, eqp.Jump)
end