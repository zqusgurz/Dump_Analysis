return function (self,pet) 
return DateTime(pet.DeadTime) > DateTime.UtcNow
end