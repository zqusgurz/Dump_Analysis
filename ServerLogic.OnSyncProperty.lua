return function (self,name,value) 
if (name == "CurrentSliderNotice") then
	_AppService:Get().SliderNotice:SetText(value)
end
end