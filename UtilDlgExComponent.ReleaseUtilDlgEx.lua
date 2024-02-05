return function (self) 
local m = _AppService:Get().ModalMan
m:Release(m.UtilDlgExPool, self.Entity)
end