return function (self,id,currentUserCount,num) 
local panel = _EntityService:GetEntityByPath("/ui/DefaultGroup/UISprite/Scroll_Layout/chanel"..num)
if panel == nil then
	panel = _SpawnService:SpawnByEntity(_EntityService:GetEntityByPath("/ui/DefaultGroup/UISprite/Scroll_Layout/chanel0"), "chanel"..num, Vector3.zero)
end
panel.ChanelButton.id = id
if id == self.current then
	panel:GetChildByName("chanelNum").TextComponent.FontColor = Color(255, 0, 0)
else
	panel:GetChildByName("chanelNum").TextComponent.FontColor = Color(0, 0, 0)
end

panel:GetChildByName("chanelNum").TextComponent.Text = tostring(num).."채널("..string.sub(id, 1, 2)..")"
--panel:GetChildByName("chanelNum").TextComponent.Text = num
panel:GetChildByName("users").TextComponent.Text = tostring(currentUserCount).." 명"
end