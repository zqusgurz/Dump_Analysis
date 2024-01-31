return function (self,user,body,key,actionName,attackSpeed) 
user.CharacterActionComponent:RegisterActions(actionName, attackSpeed, body, key)
user.CharacterActionComponent:PlayNextActionPiece(key)
end