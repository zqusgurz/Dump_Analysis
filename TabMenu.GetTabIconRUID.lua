return function (self,index) 
return (index == 1 and _UidMan:Get(self.Tabs.Tab1UOL)) or
	(index == 2 and _UidMan:Get(self.Tabs.Tab2UOL)) or
	(index == 3 and _UidMan:Get(self.Tabs.Tab3UOL)) or
	(index == 4 and _UidMan:Get(self.Tabs.Tab4UOL)) or
	(index == 5 and _UidMan:Get(self.Tabs.Tab5UOL)) or ""
end