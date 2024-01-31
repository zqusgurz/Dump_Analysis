return function (self,t,default) 
if (not t.Next) then
	t.Next = default
	return default
end
local next = t.Next
next *= 2
t.Next = next
return next
end