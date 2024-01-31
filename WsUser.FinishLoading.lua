return function (self) 
log("Finish loading triggered")
self:FinishLoadingOnServer()
self:UpdateLastRestChangedAsNow(true, true)
_MapleSpriteSyncLogic:Flush()
end