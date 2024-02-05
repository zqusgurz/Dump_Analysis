return function (self,totalMember) 
_EntityUtils:DestoryChilds(self.MemberElements)
self.Elements = {}
self.MemberNumText.Text = "0/0"
end