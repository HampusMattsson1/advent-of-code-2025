aoclib = require("modules.aoclib")

function main()
    local input = aoclib.readFile("inputs/day5.txt")

    local part1Result = 0

    local freshIngredients = {}

    -- fresh ingredient list
    local ingredientStartIndex = nil

    for i, line in ipairs(input) do
        -- local lineString = tostring(line)
        -- print(lineString)

        if line == "" then
            ingredientStartIndex = i + 1
            break
        end
    end

    -- ingredient loop
    for i = ingredientStartIndex, #input do
        local ingredientId = math.tointeger(input[i])
        -- print(ingredientId)
        -- print(freshIngredients[ingredientId])

        -- Loop through ranges to check if the number is within any of them
        -- print (ingredientId)
        for j = 1, ingredientStartIndex - 2 do
            -- print(input[j])
            local rangeStart, rangeEnd = input[j]:match("([^-]+)-([^-]+)")
            -- print(ingredientId, rangeStart, rangeEnd)
            -- print(input[j])
            if ingredientId >= math.tointeger(rangeStart) and ingredientId <= math.tointeger(rangeEnd) then
                -- print("FRESH")
                part1Result = part1Result + 1
                break
            end
        end

        -- break

        -- if freshIngredients[ingredientId] == true then
        --     part1Result = part1Result + 1
        -- end
    end

    print("Part 1 result: " .. part1Result)
end

function main2()
    local input = aoclib.readFile("inputs/day5.txt")

    local part2Result = 0

    -- Merge overlapping

    local s, e = input[1]:match("([^-]+)-([^-]+)")
    local rangeStart = math.tointeger(s)
    local rangeEnd = math.tointeger(e)

    -- for i, line in ipairs(input) do
    for i = 2, #input do
        local line = input[i]
        if line == "" then break end

        local lineRangeStart, lineRangeEnd = line:match("([^-]+)-([^-]+)")

        -- Merging overlap outcomes
        

    end


    print("Part 2 result: " .. part2Result)
end

main()
main2()