return function (self,origin,anchor,size,facingLeft) 
anchor.x += 0.5
anchor.y += 0.5
if (facingLeft) then
	anchor.x -= 1.0
end
return BoxShape(origin + size * anchor, size, 0)
end