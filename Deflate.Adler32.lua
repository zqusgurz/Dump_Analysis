return function (self,str) 
local strlen = #str
  local i = 1
  local a = 1
  local b = 0
  while i <= strlen - 15 do
    local x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16 = string.byte(str, i, i + 15)
    b =
      (b + 16 * a + 16 * x1 + 15 * x2 + 14 * x3 + 13 * x4 + 12 * x5 + 11 * x6 +
        10 * x7 + 9 * x8 + 8 * x9 + 7 * x10 + 6 * x11 + 5 * x12 + 4 * x13 + 3 *
        x14 + 2 * x15 + x16) % 65521
    a =
      (a + x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10 + x11 + x12 + x13 +
        x14 + x15 + x16) % 65521
    i = i + 16
  end
  while (i <= strlen) do
    local x = string.byte(str, i, i)
    a = (a + x) % 65521
    b = (b + a) % 65521
    i = i + 1
  end
  return (b * 65536 + a) % 4294967296
end