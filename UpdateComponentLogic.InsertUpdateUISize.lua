return function (self,entity,includeChild,invalidateFlag) 
self.UpdateUISizeList[self.UpdateUISizeListNum + 1] = {entity, includeChild, invalidateFlag}
self.UpdateUISizeListNum += 1
end