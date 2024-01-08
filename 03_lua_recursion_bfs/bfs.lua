function bfs_recursive(data, visited, encountered_keys)
    visited = visited or {}
    encountered_keys = encountered_keys or {}
    
    for key, value in pairs(data) do
        if encountered_keys[key] then
            error("Duplicate key found: " .. key)
        end

        encountered_keys[key] = true

        if type(value) == "table" and not visited[value] then
            visited[value] = true
            bfs_recursive(value, visited, {})  -- Pass an empty encountered_keys table for each recursive call
        elseif type(value) == "string" and type(key) == "number" then
            local age, name = parse_name(value)
            if age and name then
                print(key .. ": {age=" .. age .. ", name=" .. name .. "}")
            end
        end
    end
end

function parse_name(name)
    local age, parsed_name = name:match("(%d+)%s*(%D+)")
    if age and parsed_name then
        return tonumber(age), parsed_name
    end
    return nil, nil
end

function bfs(data)
    local visited = {}
    local encountered_keys = {}
    bfs_recursive({data}, visited, encountered_keys)
end

data = {
    [2] = "35 Чайковский Николай",
    [2] = "21 Попов Павел",
    [2] = "22 Максимов Егор",
    [4] = "19 Сон Артём",
    [5] = "25 Лапотников Павел",
    absolute_geniuses = {
        [8] = "666 Анищенко Михаил",
        [7] = "23 Попов Иван"
    },
    [12] = "12 Тронягина Александра"
}

bfs(data)