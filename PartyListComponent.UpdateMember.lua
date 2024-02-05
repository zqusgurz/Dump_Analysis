return function (self,elem,member) 
elem.CharacterId = member.Id
elem.Job.Text = _Jobs:GetJobName(member.Job, true)
elem.JobTooltip.Title = _Jobs:GetJobName(member.Job, true)
elem.LeaderIcon.Enable = _LocalPartyLogic:IsLeader(member.Id)
elem.Level.Text = tostring(member.Level)
elem.Name.Text = member.CharacterName
elem:SetCurrentMap(member.Map)
end