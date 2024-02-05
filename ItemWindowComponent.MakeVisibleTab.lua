return function (self,currentTab) 
self.Items1.Enable = 1 == currentTab
self.Items2.Enable = 2 == currentTab
self.Items3.Enable = 3 == currentTab
self.Items4.Enable = 4 == currentTab
self.Items5.Enable = 5 == currentTab

if (currentTab == 1) then return self.Items1
elseif (currentTab == 2) then return self.Items2
elseif (currentTab == 3) then return self.Items3
elseif (currentTab == 4) then return self.Items4
elseif (currentTab == 5) then return self.Items5 end

return nil
end