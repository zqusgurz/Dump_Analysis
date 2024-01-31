return function (self,hp,mp) 
local now = _UtilLogic.ElapsedSeconds
for i=0,1 do
	if (hp) then
		self.LastRestHpChanged[i] = now
	end
	if (mp) then
		self.LastRestMpChanged[i] = now
	end
end
--log("update last rest changed")
end