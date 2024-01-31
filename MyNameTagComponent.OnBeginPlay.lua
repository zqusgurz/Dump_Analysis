return function (self) 
local text = self.Entity:GetChildByName("Text")
text.MyTextComponent:OnCreate()
text.MyTextComponent:SetText("세라")
local d = Environment:IsPublishedPlay()
local dd = Environment:IsMakerPlay()
end