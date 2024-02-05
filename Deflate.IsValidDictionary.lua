return function (self,dictionary) 
if dictionary.strlen <= 0 or dictionary.strlen > 32768 or dictionary.strlen ~= #dictionary.string_table then
  return false
end
return true
end