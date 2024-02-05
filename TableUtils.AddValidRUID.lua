return function (self,table,value) 
if (value ~= nil and value ~= "") then
	table[value] = true
end
end