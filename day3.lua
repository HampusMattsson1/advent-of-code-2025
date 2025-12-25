aoclib = require("modules.aoclib")

function main()
    local input = aoclib.readFile("inputs/day3.txt")

    local part1Result = 0

    for index, line in ipairs(input) do
        local lineString = tostring(line)
        -- print(lineString)
        local firstGreatestDigit =  string.sub(line,1,1)
        local secondGreatestDigit = string.sub(line,2,2)

        for i=3, #line do
            -- print(i)
            local digit = string.sub(line,i,i)
            -- print(digit)

            if math.tointeger(digit) > math.tointeger(firstGreatestDigit) and i < #line then
                firstGreatestDigit = digit
                secondGreatestDigit = line:sub(i+1, i+1)
                -- continue
            else
                if math.tointeger(digit) > math.tointeger(secondGreatestDigit) then
                    secondGreatestDigit = digit
                end
            end

            -- Check if there exists a greater number for the tens digit (first number)
            -- local greaterExists1 = existsGreaterDigit(line:sub(i + 1, #line - 1), firstGreatestDigit)

            -- -- Check if there exists a greater number for the last digit
            -- local greaterExists2 = existsGreaterDigit(line:sub(i + 1, #line), secondGreatestDigit)

            -- if greaterExists1 == false and greaterExists2 == false then
            --     break
            -- end
        end

        -- print(firstGreatestDigit, secondGreatestDigit)

        part1Result = part1Result + math.tointeger(firstGreatestDigit .. secondGreatestDigit)

        -- break
    end

    print("Day3 part 1 result: " .. part1Result)
end

function existsGreaterDigit(digitString, digitParam)
    for i=1, #digitString do
        -- print(i)
        local digit = digitString:sub(i,i)

        if math.tointeger(digit) > math.tointeger(digitParam) then
            -- print("Greater exists " .. digit)
            return true
        end
    end

    return false
end

main()