return function (self) 
self.__TooltipBaseComponent__.OnBeginPlay(self)
table.insert(self.ResizeEntities, self.Icon.Entity)
table.insert(self.ResizeEntities, self.Icon.Entity.Parent)
table.insert(self.ResizeEntities, self.SkillName.Entity)
table.insert(self.ResizeEntities, self.SkillName.Entity.Parent)
end