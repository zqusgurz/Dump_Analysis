return function (self,obj) 
local template = {
	States = {}
}
for _, prop in _WzUtils:GetLabeled(obj) do
	template.States[prop.Name] = self:MakeReactorTemplateState(prop)
end
template.Action = _WzUtils:GetString(obj.action, "")
return template
end