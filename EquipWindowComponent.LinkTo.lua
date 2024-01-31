return function (self,comp,pos) 
comp.LinkedItemTI = 1
comp.LinkedItemPos = pos
self.PosToElement[-pos] = comp
end