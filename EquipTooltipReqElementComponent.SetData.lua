return function (self,type,available,value) 
self.Label.ImageRUID = _TooltipRUID.Table[type][available] 
self.Number.Text = tostring(math.floor(value))
if (available) then
	self.Number.FontColor = Color.white
else
	self.Number.FontColor = Color.red
end
end