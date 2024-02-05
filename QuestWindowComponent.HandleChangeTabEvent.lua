return function (self,event) 
self:OnChangeTab(event.TabIndex-1)
self.ScrollView:ResetScrollPosition(UITransformAxis.Vertical)
end