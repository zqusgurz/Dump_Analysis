return function (self,str,configs) 
local arg_valid = self:IsValidArguments(str, false, nil, true, configs)
if not arg_valid then
  error("Error")
end
return self:CompressDeflateInternal(str, nil, configs)
end