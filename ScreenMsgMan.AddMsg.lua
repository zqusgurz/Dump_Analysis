return function (self,msg,messageType) 
self:_RemoveOldMessages()
self:_MoveUpMessages()
self:_AddMsgElement(msg, messageType)
end