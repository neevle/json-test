RegisterCommand("benikaydet", function()
    print('sa')
    TriggerServerEvent("oyuncuKaydett")
end, false)

RegisterCommand("levelarttir", function()
    TriggerServerEvent("levelarttirma")
end, false)