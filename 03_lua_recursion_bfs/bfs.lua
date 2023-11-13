function bfs_recursive(data, visited)
    visited = visited or {} 
    for key, value in pairs(data) do
        if type(value) == "table" and not visited[value] then
            visited[value] = true
            bfs_recursive(value, visited)
        else
            print(key .. ": " .. tostring(value))
        end
    end
end

function bfs(data)
    local visited = {} 
    bfs_recursive({data}, visited)
end

data = {
    [35] = "Чайковский Николай",
    [21] = "Попов Павел",
    [22] = "Максимов Егор",
    [19] = "Сон Артём",
    [25] = "Лапотников Павел",
    absolute_geniuses = {
        [666] = "Анищенко Михаил",
        [23] = "Попов Иван"
    },
    [12] = "Тронягина Александра"
}

bfs(data)