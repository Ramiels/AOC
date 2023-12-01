-- eightwothree my BEHATED.
local result = 0
local strings = { "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" }
-- Iterate over lines of input
for line in io.lines("2023/2/input.txt") do
	-- Turn strings into numbers
	for i=1, #strings do line=line:gsub(strings[i], table.concat{strings[i],i,strings[i]}) end
	-- Create a table of numbers in the file (I do not know the pattern matching tech do this "properly" without this loop)
	local caps = {}
	for capture in line:gmatch("%d") do caps[#caps+1] = capture end
	-- Concat the first and last values in the table of numbers, and add it to the total number
	result = result + tonumber(caps[1] .. caps[#caps])
end
-- Write the total to output
io.open("2023/2/output.txt", "w"):write(result)