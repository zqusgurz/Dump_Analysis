return function (self,pos) 
if (self.NotCanceled) then
	return
end
log(string.format("Buff cancel try: %d", self.Id))
_UserSkillLogic:TryCancelTemporaryStat(_UserService.LocalPlayer, self.Id)
end