return function (self,event) 
_EditorService:GetCurrentMap(function(id) 
	self:OnCustomBound(id)		
end)
end