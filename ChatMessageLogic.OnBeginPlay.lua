return function (self) 
self.ColorTable = {
	[_ChatMessageType.Blue]	 = {Color.FromHexCode("#66CCFF"), Color(0,0,0,0)},
	[_ChatMessageType.Red]	 = {Color.FromHexCode("#FFAAAA"), Color(0,0,0,0)},
	[_ChatMessageType.Yellow]	 = {Color.FromHexCode("#FFFF00"), Color(0,0,0,0)},
	[_ChatMessageType.System]	 = {Color.FromHexCode("#BBBBBB"), Color(0,0,0,0)},
	[_ChatMessageType.NormalChat]	 = {Color.white, Color(0,0,0,0)},
	[_ChatMessageType.Creator]	 = {Color.black, Color(1,1,1,0.69)},
	[_ChatMessageType.Channel]	 = {Color.FromHexCode("#003F7F"), Color(0.79, 0.90, 1, 0.8)},
	[_ChatMessageType.SpeakerWorldInstance]	 = {Color.FromHexCode("#770042"), Color(1, 0.74, 0.86, 0.8)},
	[_ChatMessageType.Whisper]	 = {Color.FromHexCode("#00FF00"), Color(0,0,0,0)},
	[_ChatMessageType.Party]	 = {Color.FromHexCode("#FF99CC"), Color(0,0,0,0)},
	[_ChatMessageType.Warning]	 = {Color.FromHexCode("#8B0000"), Color(1,0.8,0.8,0.75)},
}
--[_ChatMessageType.Creator]	 = {Color.black, Color.FromHexCode("#C3C3C3")},
--[_ChatMessageType.Channel]	 = {Color.FromHexCode("#003F7F"), Color.FromHexCode("#C3C3C3")},
end