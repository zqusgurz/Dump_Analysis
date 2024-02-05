return function (self,mode,name) 
self.ChatTargetMode = mode
if (mode == _ChatTargetType.ToWhisper) then
	self.WhisperTarget = name
else
	self.WhisperTarget = nil
end
if (mode == _ChatTargetType.ToAll) then
	self.ChatTargetText.Text = "모두에게"
	self.ChatTargetText.Overflow = OverflowType.Overflow
elseif (mode == _ChatTargetType.ToWhisper) then
	self.ChatTargetText.Text = name
	self.ChatTargetText.Overflow = OverflowType.ellipsis
elseif (mode == _ChatTargetType.ToParty) then
	self.ChatTargetText.Text = "파티에게"
	self.ChatTargetText.Overflow = OverflowType.Overflow
elseif (mode == _ChatTargetType.ToWorld) then
	self.ChatTargetText.Text = "채널에게"
	self.ChatTargetText.Overflow = OverflowType.Overflow
end
self.ChatTargetList.Enable = false
end