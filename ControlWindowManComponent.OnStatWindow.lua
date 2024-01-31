return function (self) 
local statWin = self.Stat.StatWindowComponent
statWin:SetVisible(not statWin:IsVisible(), true)
end