return function (self,user,argc,args) 
_AppService:Get().ChatSystem:ChangeChatTarget(_ChatTargetType.ToParty, nil)
_AppService:Get().ChatSystem:FocusChatInput("")
end