return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: TextInputComponent
-- Space: Client
---------------------------------------------------------

-- Parameters
local text = event.text
---------------------------------------------------------
if text == "" then
	for k, v in ipairs(self.parties) do
		v.Enable = true
	end
else
	for k, v in ipairs(self.parties) do
		if string.find(v:GetChildByName("PartyName").TextComponent.Text, text) then
			v.Enable = true
		else
			v.Enable = false
		end
	end
end
end