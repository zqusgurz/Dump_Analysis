return function (self) 
if (self.Selected.Enable) then
	self.Name.FontColor = self:IsSameMap() and Color.white or self.NonSameMapColor
	self.Job.FontColor = self:IsSameMap() and Color.white or self.NonSameMapColor
	self.Level.FontColor = self:IsSameMap() and Color.white or self.NonSameMapColor
else
	self.Name.FontColor = self:IsSameMap() and Color.black or self.NonSameMapColor
	self.Job.FontColor = self:IsSameMap() and Color.black or self.NonSameMapColor
	self.Level.FontColor = self:IsSameMap() and Color.black or self.NonSameMapColor
end
end