aoclib = require("modules.aoclib")

function main()
    local input = aoclib.readFile("inputs/day2.txt")[1]

    -- print(input)

    local invalidIdSum = 0

    local idRangeList = string.gmatch(input, "([^,]+)")

    for idRange in idRangeList do
        --print(idRange)

        -- local idList = string.gmatch(idRange, "([^,]+)")
        local idList = {}
        for id in string.gmatch(idRange, "([^-]+)") do
            table.insert(idList, id)
        end

        local firstId = idList[1]
        local lastId = idList[2]
        -- print(firstId, lastId)

        -- Loop through ID range
        for i=firstId, lastId do
            local id = tostring(math.tointeger(i))
            --print(id)

            if #id % 2 == 0 then
               local splitId1 = string.sub(id, 1, #id/2)
                local splitId2 = string.sub(id, #id/2 + 1)
                --print(splitId1, splitId2)

                if splitId1 == splitId2 then
                    invalidIdSum = invalidIdSum + id
                end 
            end
        end

        -- break
        -- firstId = 
    end

    print("Day2 part 1 result: " .. invalidIdSum)
end

main()