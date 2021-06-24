local s = require "packer"

local b = s.pack{[10] = {1,2}}
s.dump(b)
local bb = s.unpack(b)
for k,v in pairs(bb[10]) do
	print(k,v)
end

--[[]]

local a = s.pack { hello={3,4}, false, 1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9 }

s.dump(a)

a = s.append(a, 42,4.2,-1,1000,80000,"hello",true,false,nil,"1234567890123456789012345678901234567890")

s.dump(a)
print(a)

local function pr(t,...)
	for k,v in pairs(t) do
		print(k,v)
	end
	print(...)
end

print ("------")

local seri, length = s.inflate_bin(a)
print(seri, length)

pr(s.unpack(a))

print("-------")

pr(s.deflate_bin(seri))


a = s.inflate( 1,2,3,4,5 )
print(#a, s.deflate(a))
