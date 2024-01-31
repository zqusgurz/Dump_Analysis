return function (self,keyMapped) 
self.FuncKeyMapped = self:Deserialize(keyMapped)
_AppService:Get().ControlWindowMan.KeyConfig.KeyConfigComponent:InvalidatePosition()
end