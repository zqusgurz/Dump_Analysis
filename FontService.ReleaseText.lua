return function (self,font,txt) 
_ObjectPool:Release(self.MSWFontTextComponentPool[font], txt.Entity)
end