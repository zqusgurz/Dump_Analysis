return function (self,val) 
if (val == nil) then
	return Vector2(0, 0)
end
return Vector2(tonumber(val["_width"]), tonumber(val["_height"]))
end