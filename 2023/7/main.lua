local points = 0
local function tableify_text (str, count)
	local tab = {}
	for i=1, count*3, 3 do tab[(i+2)/3] = (str:sub(i, i+1):gsub(" ", 0)) end
	return tab
end

-- Go through cards
for line in io.lines("2023/7/input.txt") do
	local matches = 0
	local winning = tableify_text(line:sub(11,40), 10)
	local numbers = tableify_text(line:sub(43,-1), 25)
	for i=1, #winning do
		for j=1, #numbers do
			if winning[i] == numbers[j] then
				matches = matches + 1
			end
		end
	end
	points = points + math.floor(2^(matches-1))
end

-- Write the total to output
io.open("2023/7/output.txt", "w"):write(points)