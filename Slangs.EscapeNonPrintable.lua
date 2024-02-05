return function (self,text) 
local r = Regex("[\x00-\x1f]+")
return r:Replace(text, "") or ""
end