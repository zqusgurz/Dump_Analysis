return function (self) 
for job=0,4 do
	local class = _ResourceMan:ParseGenericWzCollection("StandardPDD.img", tostring(job))
	local tb = {}
	local pdd = 0
	for i=1,_PlayerStatLogic.MaxLevel do
		local d = _WzUtils:GetInt32(class[tostring(i)], -1)
		if (d ~= -1) then
			pdd = d
		end
		tb[i] = pdd
	end
	self.StandardPDD[job] = tb
end
end