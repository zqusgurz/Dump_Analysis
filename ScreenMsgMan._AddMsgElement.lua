return function (self,msg,messageType) 
local obj = self.Messages.ChildObjectPoolComponent:Get(Vector3.zero)
obj.ScreenMsgElement:Start(msg, messageType)
table.insert(self.MessageTable, 1, obj)
end