-- Constants
local positions = {
	{1, -1},  {1, 0},  {1, 1},
	{0, -1},           {0, 1},
	{-1, -1}, {-1, 0}, {-1, 1},
}
local valid = { "-", "&", "*", "/", "@", "#", "+", "%", "$", "=" }
-- Vars
local grid = {}
local sum = 0

-- Generate x and y table to crawl through
for line in io.lines("2023/5/input.txt") do
	grid[#grid+1] = (function ()
		local subtable = {[0]="."}
		for character in string.gmatch(line, '(.)') do
			subtable[#subtable+1] = character
		end
		subtable[#subtable+1] = "."
		return subtable
	end)()
end
-- Add padding for no out of bounds errors
grid[0] = (function ()
	local t = {[0]="."}
	for j=1, 141 do
		t[j]="."
	end
	return t
end)()
grid[141] = grid[0]
-- Crawl table to find numbers
for i=1, #grid do
	for j=1, #grid[i] do
		if grid[i][j]:match("%d+") then
			-- Upon finding numbers, crawl to the end of the number, checking for symbols along the way.
			-- If it finds a symbol, it stops checking, but keeps going to the end of the number. Erases digits to prevent re-checking.
			local indx = 0
			local t={}
			local allowed = true
			repeat
				for l=1, #positions do
					if allowed then
						for k=1, #valid do
							if grid[i+positions[l][1]][j+indx+positions[l][2]] == valid[k] then
								allowed = false
								goto skip
							end
						end
					end
					::skip::
				end
				t[#t+1] = grid[i][j+indx]
				grid[i][j+indx] = "."
				indx=indx+1
			until j+indx>140 or (not grid[i][j+indx]:match("%d"))
			-- If it found a symbol, add to the max
			if not allowed then
				sum = sum + tonumber(table.concat(t))
			end
		end
	end
end
-- Write the total to output
io.open("2023/5/output.txt", "w"):write(sum)