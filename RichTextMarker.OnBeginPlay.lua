return function (self) 
self.CodepointTable[utf8.codepoint(self.Tooltip_Reset)] = Color.white
self.CodepointTable[utf8.codepoint(self.Tooltip_Orange)] = Color.FromHexCode("#FF9900")
self.CodepointTable[utf8.codepoint(self.Script_Black)] = Color.black
self.CodepointTable[utf8.codepoint(self.Script_Blue)] = Color.blue
self.CodepointTable[utf8.codepoint(self.Script_Red)] = Color.red
self.CodepointTable[utf8.codepoint(self.Script_Violet)] = Color.FromHexCode("#FF3BF8") -- TODO
end