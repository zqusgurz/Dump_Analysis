return function (self) 
local t = _ResourceMan:ParseGenericWzCollection("String.ToolTipHelp.img", "Game").UIWnd.StatDetail
for _,obj in _WzUtils:GetLabeled(t) do
	local lt = _WzUtils:GetVector(obj.lt)
	local rb = _WzUtils:GetVector(obj.rb)
	local title = _WzUtils:GetString(obj.Title, "")
	local desc = _WzUtils:GetString(obj.Desc, "")
	local entity = self:RegisterTooltip(lt, rb, title, desc)
	table.insert(self.SubTooltips, entity)
end
end