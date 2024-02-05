return function (self,option,type) 
local left = (option & 1) ~= 0
local isOnGround = (option & 2) ~= 0
if (isOnGround) then
	if (type == _ReactorEvent.Hit) then return 1
	elseif (type == _ReactorEvent.HitLeft) then return left and -1 or 0
	elseif (type == _ReactorEvent.HitRight) then return left and 0 or -1
	end
else
	if (type == _ReactorEvent.Hit) then return 2
	elseif (type == _ReactorEvent.HitLeft) then return left and -1 or 1
	elseif (type == _ReactorEvent.HitRight) then return left and 1 or -1
	elseif (type == _ReactorEvent.HitJumpLeft) then return left and -1 or 0
	elseif (type == _ReactorEvent.HitJumpRight) then return left and 0 or -1
	end
end
end