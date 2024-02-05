return function (self) 
local nameTagData = _DataService:GetTable("NameTagBalloonData")
local nameTags = self.NameTags
for i=1,nameTagData:GetRowCount() do
	local id = nameTagData:GetCell(i, 1)
	local nameTag = nameTagData:GetCell(i, 2)
	local chat = nameTagData:GetCell(i, 3)
	local color = nameTagData:GetCell(i, 4)
	if (_UtilLogic:IsNilorEmptyString(nameTag)) then
		nameTag = nil
	end
	if (_UtilLogic:IsNilorEmptyString(chat)) then
		chat = nil
	end
	if (_UtilLogic:IsNilorEmptyString(color)) then
		color = nil
	else
		color = Color.FromHexCode(color)
	end
	nameTags[tonumber(id)] = {NameTag = nameTag, Chat = chat, Color = color}
end
end