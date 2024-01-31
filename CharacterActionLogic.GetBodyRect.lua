return function (self,prone) 
if (prone) then
	return Vector2(-0.46 / 2, 0.31 / 2), Vector2(0.46, 0.31)
else
	return Vector2(0, 0.65 / 2), Vector2(0.44, 0.65)
end
end