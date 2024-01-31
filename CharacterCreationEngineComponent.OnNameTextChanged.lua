return function (self,event) 
local text = event.text
if (#text == 0) then
	return
end
local len, lastLetterSize = _Slangs:GetStringByteLength(text)
-- log(text, " / ", len, " / ", lastLetterSize)
if (len > 12) then
	self.NameText.Text = string.sub(text, 1, #text - lastLetterSize)
end
end