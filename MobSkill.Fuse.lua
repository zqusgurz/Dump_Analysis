return function (self,id,lv) 
return (lv & 0xffff) | ((id & 0xffff) << 16)
end