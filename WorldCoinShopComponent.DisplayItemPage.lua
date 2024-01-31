return function (self,page) 
self.CurrentPage = page
self.PageText.Text = tostring(page)
local countPerPage = 8
for i=1,countPerPage do
	local item = self:GetItemByIndex((page-1)*countPerPage+i)
	---@type Entity
	local entry = self.ItemEntries[i]
	if (item ~= nil) then
		entry.Enable = true
		entry.WorldCoinProductEntryComponent:SetItem(item)
	else
		entry.Enable = false
	end
end
self.PrevButton.FunctionButtonComponent:SetInteractible(page ~= 1)
self.NextButton.FunctionButtonComponent:SetInteractible(self:GetItemByIndex(page*countPerPage+1) ~= nil)
end