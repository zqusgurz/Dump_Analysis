return function (self,touched) 
if (self.Disabled or self.LoginEngine.MoveStepTween ~= nil) then
	return
end

for i=1,self.Max do
	---@type Entity
	local entity = self.Entries[i]
	local entry = entity.CharacterSelectEntryComponent
	if (touched == entity) then
		local selected = entry.Selected
		if (selected) then
			if (_UtilLogic.ElapsedSeconds - entry.SelectedTime < 0.5) then
				self:DoSelectCharacter(entry)
				return
			end
		else
			local sel = _UidMan:Get("Sound/UI.img/CharSelect")
			_SoundService:PlaySound(sel, 1)
		end
		entry:SetSelected(true)
	else
		entry:SetSelected(false)
	end
end
self:UpdateSignboardButton()
end