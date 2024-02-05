return function (self,v) 
for i=1,v.n do
	v[i] = tostring(v[i])
end
self:Info(table.concat(v, " "))
end