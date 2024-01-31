return function (self,userID,text,idx) 
local boardPath = self.Entity.Path.."/AccumADStatue/AccumADPanel"
local panel = _EntityService:GetEntityByPath(boardPath)
if text ~= "" then
	panel:GetChildByName("PanelTitle").TextComponent.Text = userID
	panel:GetChildByName("NoUser").TextComponent.Text = text
else
	panel:GetChildByName("PanelTitle").TextComponent.Text = ""
	panel:GetChildByName("NoUser").TextComponent.Text = "메시지가 없습니다."
end
panel:GetChildByName("Num").TextComponent.Text =  idx.."  /  5"
end