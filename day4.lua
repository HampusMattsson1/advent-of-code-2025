aoclib = require("modules.aoclib")

function main()
    local input = aoclib.readFile("inputs/day4.txt")

    local part1Result = 0

    for i, line in ipairs(input) do
        local lineString = tostring(line)
        -- print(lineString)
        
        for j=1, #line do
            -- local char = string.sub(line,j,j)
            local char = line:sub(j,j)
            
            if charIsPaperRoll(char) then

               local paperRollCount = 0

                local previousLine = (i-1) > 0 and input[i-1] or nil
                local nextLine = (i+1) <= #line and input[i+1] or nil

                -- check all adjacent positions
                if previousLine ~= nil then
                    -- Top left
                    paperRollCount = paperRollCount + (charIsPaperRoll(previousLine:sub(j-1, j-1)) and 1 or 0)
                    -- Top
                    paperRollCount = paperRollCount + (charIsPaperRoll(previousLine:sub(j, j)) and 1 or 0)
                    -- Top right
                    paperRollCount = paperRollCount + (charIsPaperRoll(previousLine:sub(j+1, j+1)) and 1 or 0)
                end

                if nextLine ~= nil then
                    -- Bottom left
                    paperRollCount = paperRollCount + (charIsPaperRoll(nextLine:sub(j-1, j-1)) and 1 or 0)
                    -- Bottom
                    paperRollCount = paperRollCount + (charIsPaperRoll(nextLine:sub(j, j)) and 1 or 0)
                    -- Bottom right
                    paperRollCount = paperRollCount + (charIsPaperRoll(nextLine:sub(j+1, j+1)) and 1 or 0)
                end

                -- Left
                paperRollCount = paperRollCount + (j-1 > 0 and charIsPaperRoll(line:sub(j-1, j-1)) and 1 or 0)
                -- Right
                paperRollCount = paperRollCount + (j+1 <= #line and charIsPaperRoll(line:sub(j+1, j+1)) and 1 or 0)

                if paperRollCount < 4 then
                    part1Result = part1Result + 1
                end

                -- print("paperRollCount: " .. paperRollCount .. " char: " .. char)
            end
        end

        -- print()

        -- break
    end

    print("Day4 part 1 result: " .. part1Result)
end

function charIsPaperRoll(char)
    if char == "@" then
        return true
    else
       return false 
    end
end

-- function countAdjacentCharacterMatches(x, y)
-- end

main()