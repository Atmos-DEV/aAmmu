Citizen.CreateThread(function()
    local pedName = "s_m_y_ammucity_01"
    local pedHash = GetHashKey(pedName)
    
    RequestModel(pedHash)
    while not HasModelLoaded(pedHash) do
    Citizen.Wait(10)
    end
    
    local ped = CreatePed(9, pedHash, 810.14605712891, -2159.3640136719, 28.618989944458, 355.01, false, false)
    
    FreezeEntityPosition(ped, true)
    
    SetBlockingOfNonTemporaryEvents(ped, true)
    
end)



Citizen.CreateThread(function()
    local pedName = "s_m_y_ammucity_01"
    local pedHash = GetHashKey(pedName)
    
    RequestModel(pedHash)
    while not HasModelLoaded(pedHash) do
    Citizen.Wait(10)
    end
    
    local ped = CreatePed(9, pedHash, 22.723518371582,-1105.1242675781,28.797033309937, 155.06, false, false)
    
    FreezeEntityPosition(ped, true)
    
    SetBlockingOfNonTemporaryEvents(ped, true)
    
end)