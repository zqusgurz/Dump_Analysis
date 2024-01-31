return function (self,characterId) 
_AppService:Get().ControlWindowMan.MaxMap.MiniMapComponent:UpdateOtherPlayer(characterId)
_AppService:Get().ControlWindowMan.MinMap.MiniMapComponent:UpdateOtherPlayer(characterId)
end