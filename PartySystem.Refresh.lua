return function (self) 
--새로고침
for k, v in ipairs(self.parties) do
	_EntityService:Destroy(v)
end
table.clear(self.parties)
self:ReceiveDataToClient(_UserService.LocalPlayer)
end