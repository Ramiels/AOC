-- Set initial counter
local sum = 0
-- Iterate over lines of input
for line in io.lines("2023/4/input.txt") do
	local min = {
		["red"] = 0,
		["green"] = 0,
		["blue"] = 0,
	}
	line = line:sub(line:find(":")+1, -1):gsub(";", ",")
	-- Find lowest cubes
	for cubes in string.gmatch(line, '([^,]+)') do
		min[cubes:match("%a+")] = math.max(min[cubes:match("%a+")], tonumber(cubes:match("%d+")))
	end
	sum = sum + (min["red"]*min["green"]*min["blue"])
end
-- Write the total to output
io.open("2023/4/output.txt", "w"):write(sum)