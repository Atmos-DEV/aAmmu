ESX = nil

print("^0======================================================================^7")
print("^0[^4Author^0] ^7:^0 Atmos-DEV")
print("^0======================================================================^7")

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function LoadLicenses (source)
    TriggerEvent('esx_license:getLicenses', source, function (licenses)
      TriggerClientEvent('esx_weashop:loadLicenses', source, licenses)
    end)
end

RegisterNetEvent('para')
AddEventHandler('para', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoney = xPlayer.getMoney()
    local price = 8000

    if xMoney >= price then
      xPlayer.removeMoney(price)
      xPlayer.addWeapon('gadget_parachute', 1)
      TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
      
    else
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez ~r~d'argent~s~ !")
    end
end)

RegisterNetEvent('torche')
AddEventHandler('torche', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoney = xPlayer.getMoney()
    local price = 2000

    if xMoney >= price then
      xPlayer.removeMoney(price)
      xPlayer.addWeapon('weapon_flashlight', 1)
      TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
      
    else
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez ~r~d'argent~s~ !")
    end
end)

RegisterNetEvent('bat')
AddEventHandler('bat', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoney = xPlayer.getMoney()
    local price = 5000

    if xMoney >= price then
      xPlayer.removeMoney(price)
      xPlayer.addWeapon('weapon_bat', 1)
      TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
      
    else
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez ~r~d'argent~s~ !")
    end
end)

RegisterNetEvent('couteau')
AddEventHandler('couteau', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoney = xPlayer.getMoney()
    local price = 7500

    if xMoney >= price then
      xPlayer.removeMoney(price)
      xPlayer.addWeapon('weapon_switchblade', 1)
      TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
      
    else
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez ~r~d'argent~s~ !")
    end
end)

RegisterNetEvent('certifsns')
AddEventHandler('certifsns', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 40000
    local xMoney = xPlayer.getMoney()
    local item = "certifsns"
    local limiteitem = 1
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if xMoney >= price then
      if nbitemdansinventaire < limiteitem then
        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('certifsns', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué, allez cherche votre arme")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent ~s~, ou vous avez déjà un ~g~Certificat d'arme~s~ !")
    end
      end
end)

RegisterNetEvent('certifpistol')
AddEventHandler('certifpistol', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 70000
    local xMoney = xPlayer.getMoney()
    local item = "certifpistol"
    local limiteitem = 1
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if xMoney >= price then
      if nbitemdansinventaire < limiteitem then
        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('certifpistol', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué, allez cherche votre arme")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent ~s~, ou vous avez déjà un ~g~Certificat d'arme~s~ !")
    end
      end
end)

RegisterNetEvent('pistol')
AddEventHandler('pistol', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = "certifpistol"
    local limiteitem = 0
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if nbitemdansinventaire > limiteitem then
      xPlayer.removeInventoryItem(item, 1)
      xPlayer.addWeapon('WEAPON_pistol', 25)
      TriggerClientEvent('esx:showNotification', source, "~g~Voici votre arme !")
      
    else
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez aucun ~r~certificat d'arme~s~ !")
    
    end
end)

RegisterNetEvent('sns')
AddEventHandler('sns', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = "certifsns"
    local limiteitem = 0
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if nbitemdansinventaire > limiteitem then
      xPlayer.removeInventoryItem(item, 1)
      xPlayer.addWeapon('WEAPON_snspistol', 25)
      TriggerClientEvent('esx:showNotification', source, "~g~Voici votre arme !")
      
    else
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez aucun ~r~certificat d'arme~s~ !")
    
    end
end)

