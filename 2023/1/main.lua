local result = 0
-- Iterate over lines of input
for line in io.lines("2023/1/input.txt") do
	-- Create a table of numbers in the file (I do not know the pattern matching tech do this "properly" without this loop)
	local caps = {}
	for capture in line:gmatch("%d") do caps[#caps+1] = capture end
	-- Concat the first and last values in the table of numbers, and add it to the total number
	result = result + tonumber(caps[1] .. caps[#caps])
end
-- Write the total to output
io.open("2023/1/output.txt", "w"):write(result)