return function (self) 
self.Info.Text = string.format("'%s'님의", self.OtherName)
self.Entity.Enable = true
self.__AlarmComponent__.Show(self)
end