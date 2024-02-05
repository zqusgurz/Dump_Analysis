return function (self,cd,s,skillInfo) 
return not skillInfo.Invisible or cd:GetSkillLevel(s) > 0 or cd:GetMasterLevel(s) > 0
end