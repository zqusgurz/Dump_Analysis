return function (self,obj,subPath) 
if (subPath ~= nil and subPath ~= "") then
	local start = 1
	while true do
		local ps,_ = subPath:find("/",start,true)
		local sub = ps == nil and subPath:sub(start) or subPath:sub(start,ps-1)
		obj = obj.Children[sub]
		if (ps == nil) then break end
		start=ps+1
	end
end
return obj
end