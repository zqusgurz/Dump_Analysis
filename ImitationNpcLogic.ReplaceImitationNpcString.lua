return function (self,templateID,text) 
return string.gsub(text, "/name", self:GetImitationNpcName(templateID))
end