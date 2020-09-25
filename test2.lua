local ffi = require "ffi"
local s = require "packer"

ffi.cdef[[
    int clock(void);
]]

local addressbook = {
    name = "Alice",
    id = 12345,
    phone = {
        {number = "1301234567"},
        {number = "87654321", type = "WORK"}
    }
}

local count = 100000
local o = ffi.C.clock()

for i = 1, count do
    local u = s.inflate(s.pack(addressbook))
    local t = s.unpack(s.deflate(u))
end

local result_o = ffi.C.clock()
print(string.format("pack/unpack infalted %d use C.clock: %d", count, result_o - o))
