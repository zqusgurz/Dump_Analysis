return function (self,origin,center,size,pos,sizePad) 
if (pos.x < origin.x + center.x - ((size.x / 2) + sizePad)) then
	return false
end
if (origin.x + center.x + ((size.x / 2) + sizePad) < pos.x) then
	return false
end
if (pos.y < origin.y + center.y - ((size.y / 2) + sizePad)) then
	return false
end
if (origin.y + center.y + ((size.y / 2) + sizePad) < pos.y) then
	return false
end
return true
end