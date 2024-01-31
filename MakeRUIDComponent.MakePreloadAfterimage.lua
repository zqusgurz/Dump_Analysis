return function (self) 
log("begin a")
local t = _DataService:GetTable("PreloadAfterimage")
local rows = t:GetRowCount()
for i=rows,1,-1 do
	--log("delete row ", i)
	_EditorService:DataSetRemoveRow("PreloadAfterimage", i)
	--log("deleted row!! ", i)
end
self.CurrentRow = 1
self.Cache = {}

_AfterImageLogic:OnBeginPlay()

for afterimageType, table in pairs(_AfterImageLogic.Afterimages) do
	for masteryLevel, table2 in pairs(table) do
		for action, actionRoot in pairs(table2) do
			for i=0,16 do
				local motion = actionRoot[tostring(i)]
				if (motion ~= nil) then
					local path = string.format("Character/Afterimage/%s.img/%d/%s/%d", afterimageType, masteryLevel, action, i)
					
					local frame = 0
					while true do
						local frameTable = motion[tostring(frame)]
						if (frameTable == nil) then
							break
						end
						local ruid = frameTable["_ruid"]
						if (ruid == nil) then
							log_error("no ruid ", path)
							continue
						end
						self:Insert("PreloadAfterimage", ruid, path)
						frame += 1
					end

				end
			end
		end
	end
end

log("finish a")
end