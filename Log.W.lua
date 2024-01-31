return function (self,v) 
for i=1,v.n do
	v[i] = tostring(v[i])
end
self:Warning(table.concat(v, " "))
end