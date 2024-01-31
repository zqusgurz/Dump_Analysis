return function (self) 
if (Environment:IsMobilePlatform()) then
	return true
end
if (Environment:IsMakerPlay()) then
    -- return true
end
return false
end