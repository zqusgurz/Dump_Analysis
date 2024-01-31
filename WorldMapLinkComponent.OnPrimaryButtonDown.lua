return function (self,pos) 
if (_UtilLogic:IsNilorEmptyString(self.LinkTarget)) then
	return
end
self.WorldMap:ChangeWorldMap(self.LinkTarget, true)
end