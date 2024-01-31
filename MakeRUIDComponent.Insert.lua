return function (self,table,ruid,desc) 
if (ruid == nil or ruid == "") then return end
if (self.Cache[ruid]) then
	return
end
if (self.Skip[ruid]) then
	return
end
self.Cache[ruid] = true
_EditorService:DataSetInsertRow(table)
_EditorService:DataSetSetCell(table, self.CurrentRow, "id", ruid)
_EditorService:DataSetSetCell(table, self.CurrentRow, "desc", desc)
self.CurrentRow += 1
end