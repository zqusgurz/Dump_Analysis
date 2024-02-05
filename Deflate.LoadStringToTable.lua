return function (self,str,t,start,stop,offset) 
local i = start - offset
while i <= stop - 15 - offset do
  t[i], t[i + 1], t[i + 2], t[i + 3], t[i + 4], t[i + 5], t[i + 6], t[i + 7], t[i +
    8], t[i + 9], t[i + 10], t[i + 11], t[i + 12], t[i + 13], t[i + 14], t[i +
    15] = string.byte(str, i + offset, i + 15 + offset)
  i = i + 16
end
while (i <= stop - offset) do
  t[i] = string.byte(str, i + offset, i + offset)
  i = i + 1
end
return t
end