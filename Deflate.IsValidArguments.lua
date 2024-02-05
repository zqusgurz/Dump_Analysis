return function (self,str,check_dictionary,dictionary,check_configs,configs) 
if check_dictionary then
  local dict_valid = self:IsValidDictionary(dictionary)
  if not dict_valid then return false end
end
if check_configs then
  for k, v in pairs(configs) do
    if k ~= "level" and k ~= "strategy" then
      return false
    elseif k == "level" and not self._compression_level_configs[v] then
      return false
    elseif k == "strategy" and v ~= "fixed" and v ~= "huffman_only" and v ~= "dynamic" then
      return false
    end
  end
end
return true
end