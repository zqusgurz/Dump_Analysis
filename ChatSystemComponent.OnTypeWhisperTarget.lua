return function (self,name) 
if (not _Slangs:IsValidCharacterName(name)) then
	return
end
self:ChangeChatTarget(_ChatTargetType.ToWhisper, name)
end