local aoclib = {}

function aoclib.readFile(file)
   -- 1. Always use 'local' for variables to avoid leaking into global scope
   local f = io.open(file, "r")
   
   -- 2. Check if the file actually exists to prevent crashing
   if not f then return nil, "File not found" end

   local output = {}

   -- 3. Use f:lines() instead of io.lines(). 
   -- io.lines() without arguments tries to read from the 'default' input.
   for line in f:lines() do
      -- print(line) -- Optional: keep for debugging
      table.insert(output, line)
   end

   -- 4. Close the specific file handle
   f:close()
   
   return output
end

return aoclib