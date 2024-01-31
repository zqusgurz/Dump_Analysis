return function (self) 
return coroutine.wrap(function()
	local i = 0
	local o = self:HandleUOL()
	while true do
		local r = o.Children[tostring(i)]
		if (r == nil) then
			break
		end
		coroutine.yield(i, r:HandleUOL())
		i = i + 1
	end
end)
end