return function (self,obj) 
--obj.UITransformComponent.AnchorsMin = Vector2(0, 1)
--obj.UITransformComponent.AnchorsMax = Vector2(0, 1)
--obj.UITransformComponent.OffsetMin = Vector2(0, -sprite.Height)
--obj.UITransformComponent.OffsetMax = Vector2(sprite.Width, 0)
obj.UITransformComponent.AlignmentOption = AlignmentType.TopLeft
obj.UITransformComponent.Pivot = Vector2(0, 1)
end