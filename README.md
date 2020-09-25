
# About

for LuaJIT.

# Usage

```lua
packer = require "packer"

-- pack lua objects into a lightuserdata (malloc fragment internal) 
-- It support type : nil, number, boolean, lightuserdata, string, table (without recursion)
c_fragment_bin = packer.pack (...) 

-- You can append some objects end of the binary block packed before
packer.append(c_fragment_bin, ...)

-- unpack extract ... from c_fragment_bin, and free the memory. 
-- You can only unpack binary block once.
packer.unpack(c_fragment_bin)

-- use packer.inflate(c_fragment_bin) to inflate them to one string block
local string_block = packer.inflate(c_fragment_bin)
    
-- packer.deflate(string_block) to get c_bin
packer.deflate(string_block)
```