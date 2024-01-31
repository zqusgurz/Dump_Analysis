return function (self,attacks) 
table.sort(attacks, function(a,b) return a.Distance > b.Distance end)
end