return function (self,velocity,force,mass,maxVelocity,timeSec) 
local deltaVelocity = (force / mass) * timeSec
if (maxVelocity >= 0) then
    if (force <= 0) then
        if (-maxVelocity < velocity) then
            return math.max(velocity + deltaVelocity, -maxVelocity)
        end
    else
        if (maxVelocity > velocity) then
            return math.min(velocity + deltaVelocity, maxVelocity)
        end
    end
end
return velocity
end