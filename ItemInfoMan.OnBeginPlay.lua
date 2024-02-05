return function (self) 
if (self:IsClient()) then
	_AppService:Get().FadeScreen:SetLoadingText(string.format("아이템 데이터"))
end
self.CustomItemDataField = {
	["ItemId"] = true,
	["i_icon"] = true,
	["i_iconRaw"] = true
}
local ds = _DataService:GetTable("DefaultItemRUID")
for gender=0,1 do
	local row = ds:GetRow(gender+1)
	self.DefaultCostume[gender] = {
		row:GetItem("Clothes"),
		row:GetItem("Pants"),
		row:GetItem("Hair"),
		row:GetItem("Face")
	}
end
local ds2 = _DataService:GetTable("MakeCharInfo")
local makeCharInfo = self.MakeCharInfo
makeCharInfo[0] = {}
makeCharInfo[1] = {}
local rows = ds2:GetAllRow()
for i=1,#rows do
	local row = rows[i]
	local gender = tonumber(row:GetItem("Gender"))
	local type = tonumber(row:GetItem("Type"))
	
	local items = makeCharInfo[gender][type]
	if (not items) then
		items = {}
		makeCharInfo[gender][type] = items
	end
	local item = tonumber(row:GetItem("ItemId"))
	items[#items + 1] = item
end
self:LoadNameTags()
if (self:IsServer()) then
	self:LoadItems()
end
end