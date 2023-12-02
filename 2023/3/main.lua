-- Set maximums and initial counter
local sum = 0
local max = {
	["red"] = 12,
	["green"] = 13,
	["blue"] = 14,
}

-- Iterate over lines of input
for line in io.lines("2023/3/input.txt") do
	-- Record game ID
	local num = tonumber(line:match("%d+"))
	line = line:sub(line:find(":")+1, -1)
	-- Loop over sub-games
	for game in string.gmatch(line, '([^;]+)') do
		-- Test each cube count per-game, skip rest if exceeds max
		for cubes in string.gmatch(game, '([^,]+)') do
			if tonumber(cubes:match("%d+")) > max[cubes:match("%a+")] then
				goto next
			end
		end
	end
	-- If not skipped, add ID to sum
	sum = sum + num
	::next::
end
-- Write the total to output
io.open("2023/3/output.txt", "w"):write(sum)