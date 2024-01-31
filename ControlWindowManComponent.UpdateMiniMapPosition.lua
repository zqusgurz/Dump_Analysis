return function (self,pos) 
self.MaxMap.UITransformComponent.anchoredPosition = pos:Clone()
self.MinMap.UITransformComponent.anchoredPosition = pos:Clone()
self.Min.UITransformComponent.anchoredPosition = pos:Clone()
end