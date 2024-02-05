return function (self) 
self.Info.Text = string.format("'%s'님의", self.OtherName)
self.JobLevel.Text = string.format("Lv.%d %s", self.Level, _Jobs:GetJobName(self.Job, true))
self.Entity.Enable = true
self.__AlarmComponent__.Show(self)
end