return function (self,key,value) 
if (key == "Whisper") then
	self.GameOpt.GameOptComponent.Whisper:SetState(value == 1)
	_AppService:Get().ChatSystem.ShowWhisper = value == 1
elseif (key == "Party") then
	self.GameOpt.GameOptComponent.Party:SetState(value == 1)
elseif (key == "Trade") then
	self.GameOpt.GameOptComponent.Trade:SetState(value == 1)
elseif (key == "HpWarning") then
	self.SysOpt.SysOptComponent.HpWarning.Value = value
	_InputManager.HpFlashThreshold = value / 10
elseif (key == "MpWarning") then
	self.SysOpt.SysOptComponent.MpWarning.Value = value
	_InputManager.MpFlashThreshold = value / 10
elseif (key == "ScreenShake") then
	self.SysOpt.SysOptComponent.ScreenShake:SetState(value == 1)
end
end