local getDatabase = function()
    local db = LoadResourceFile(GetCurrentResourceName(), 'database.json')
    return json.decode(db)
end

local setDatabase = function(data)
    local jsonCevirme = json.encode(data, {
        indent = true
    })
    SaveResourceFile(GetCurrentResourceName(), 'database.json', jsonCevirme, -1)
end

RegisterNetEvent("oyuncuKaydett", function()
    local src = source
    local playerIdentifier = GetPlayerIdentifierByType(src, 'license')
    local databaseAlma = getDatabase()
    if not databaseAlma[playerIdentifier] then
        databaseAlma[playerIdentifier] = {
            level = 0,
            playerName = GetPlayerName(src)
        }
        setDatabase(databaseAlma)
    else
        print('Oyuncu halihazırda databasede.')
    end
end)

RegisterNetEvent("levelarttirma", function()
    local src = source
    local playerIdentifier = GetPlayerIdentifierByType(src, 'license')
    local databaseAlma = getDatabase()

    if not databaseAlma[playerIdentifier] then
        print('Oyuncu databasede yok.')
    else
        databaseAlma[playerIdentifier].level = databaseAlma[playerIdentifier].level + 1
        setDatabase(databaseAlma)
    end
end)