return function (self,type,TI,pos,num,args) 
---@type InventoryOperation
local ret = {}
ret.Type = type or 0
ret.TI = TI or 0
ret.Position = pos or 0
ret.Number = num or 0
ret.Argument = args or {}
return ret
end