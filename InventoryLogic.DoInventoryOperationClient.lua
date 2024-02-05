return function (self,cd,changeLog,enableExclusive) 
--for _,l in pairs(changeLog) do
--    ---@type InventoryOperation
--    local op = l
--    log(string.format("[CHANGELOG] Type:%d TI:%d Pos:%d Num:%d", op.Type, op.TI, op.Position, op.Number))
--    log("Argument:", op.Argument)
--end
self:_RawInventoryOperation(cd, changeLog)
if (enableExclusive) then
	cd.Entity.WsUser:EnableExclusiveAction()
end
end