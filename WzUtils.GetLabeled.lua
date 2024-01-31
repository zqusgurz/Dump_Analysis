return function (self,val) 
return coroutine.wrap(function()
	local i = 0
	local o = val
	while true do
		local r = o[tostring(i)]
		local r2 = o[tostring(i+1)]
		if (r == nil and r2 == nil) then
			break
		end
		if (r) then
			coroutine.yield(i, r)
		end
		i = i + 1
	end
end)
end