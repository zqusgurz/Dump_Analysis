return function (self) 
local currentMode = self.ChatTargetMode
if (currentMode == _ChatTargetType.ToAll) then
	self:ChangeChatTarget(_ChatTargetType.ToParty, nil)
elseif (currentMode == _ChatTargetType.ToParty) then
	self:ChangeChatTarget(_ChatTargetType.ToWorld, nil)
elseif (currentMode == _ChatTargetType.ToWorld) then
	self:ChangeChatTarget(_ChatTargetType.ToAll, nil)
end
end