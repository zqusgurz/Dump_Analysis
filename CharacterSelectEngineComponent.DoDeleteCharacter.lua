return function (self,entry) 
self.LoginEngine:OnCheckLoginYesNoPrompt(_LoginError.Prompt_DeleteCharacter, function()
	---@type CharacterSummary
	local summaryData = entry.SummaryData
	if (summaryData == nil) then
		self.LoginEngine:OnCheckLoginResult(_LoginError.SystemError)
		return
	end
	self:RequestDeleteCharacter(summaryData.Id)
end, nil)
end