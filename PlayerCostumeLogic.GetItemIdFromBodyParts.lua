return function (self,avatarLook,bodyParts) 
local eqp2 = avatarLook[100 + bodyParts]
if (eqp2 ~= nil) then
	return eqp2
end
local eqp = avatarLook[bodyParts]
if (eqp ~= nil) then
	return eqp
end
return 0
end