aoclib = require("modules.aoclib")

print("Hello World")

function main()
    local input = aoclib.readFile("inputs/day1.txt")
    -- print(input)

    local result = 0
    local result2 = 0

    local dial = 50

    for index, line in ipairs(input) do
        --print("Line " .. index .. ": " .. line)
        
        local direction = string.sub(line, 1, 1)
        local amount = string.sub(line, 2)
        --print(dial, direction, amount)
        -- dial = changeDial(dial, direction, amount)

        local turnDial = dial

        if direction == "R" then
            for i=1,amount do
                turnDial = turnDial + 1
                -- print(i, amount)
                if turnDial > 99 then
                    turnDial = 0
                    
                    if i ~= amount then
                        result2 = result2 + 1
                    end
                end
            end
        else
            for i=1,amount do
                turnDial = turnDial - 1

                if turnDial < 0 then
                    turnDial = 99

                    if i ~= amount then
                        result2 = result2 + 1
                    end
                end
            end
        end

        dial = turnDial
        --print(dial)

        if dial == 0 then
            result = result + 1
        end
    end

    print("Part1: " .. result)
    print("Part2: " .. result2)
end

function changeDial(dial, direction, amount)
    
    if direction == "R" then
        for i=1,amount do
            dial = dial + 1

            if dial > 99 then
                dial = 0
            end
        end
    else
        for i=1,amount do
            dial = dial - 1

            if dial < 0 then
                dial = 99
            end
        end
    end

    return dial
end

main()