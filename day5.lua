aoclib = require("modules.aoclib")

function main()
    local input = aoclib.readFile("inputs/day5.txt")

    local part1Result = 0

    local freshIngredients = {}

    -- fresh ingredient list
    local ingredientStartIndex = nil

    for i, line in ipairs(input) do
        local lineString = tostring(line)
        -- print(lineString)

        if lineString == "" then
            ingredientStartIndex = i + 1
            break
        end

        -- loop through ranges
        -- local rangeStart = string.gmatch(lineString, "([^-]+)")
        local rangeStart, rangeEnd = lineString:match("([^-]+)-([^-]+)")
        -- print(rangeStart) -- The part before the dash
        -- print(rangeEnd)   -- The part after the dash
        for j = rangeStart, rangeEnd do
            local id = tostring(math.tointeger(j))

            freshIngredients[id] = true
        end
    end

    -- ingredient loop
    for i = ingredientStartIndex, #input do
        local ingredientId = tostring(input[i])
        -- print(ingredientId)
        -- print(freshIngredients[ingredientId])

        if freshIngredients[ingredientId] == true then
            part1Result = part1Result + 1
        end
    end

    print("Part 1 result: " .. part1Result)
end

main()