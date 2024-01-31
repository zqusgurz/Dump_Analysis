return function (self,str,dictionary,configs) 
local arg_valid = self:IsValidArguments(str, true, dictionary, true, configs)
if not arg_valid then
  error("Error")
end
return self:CompressZlibInternal(str, dictionary, configs)
end