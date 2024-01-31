return function (self,temporaryValue,text) 
if (temporaryValue == 0) then
	text.FontColor = Color.black
elseif (temporaryValue < 0) then
	text.FontColor = Color.blue
elseif (temporaryValue > 0) then
	text.FontColor = Color.red
end
end