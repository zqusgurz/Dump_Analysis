return function (self,event) 
_EditorService:GetCurrentMap(function(id) 
	self:OnLayerConvert(id)		
end)
end