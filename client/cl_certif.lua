ESX = nil

local Licenses                = {}

RegisterNetEvent('esx_weashop:loadLicenses')
AddEventHandler('esx_weashop:loadLicenses', function (licenses)
	for i = 1, #licenses, 1 do
		Licenses[licenses[i].type] = true
	end
end)



Citizen.CreateThread(function()
    while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(5000)
    end
end)

-- Menus
local AtmosMenu = {
    Base = { Title = "Retrait d'armes", HeaderColor = {255, 0, 122} },
    Data = { currentMenu = "Intéraction :" },
    Events = {
        onSelected = function(self, _, btn, JMenu, menuData, currentButton, currentSlt, result)
            if btn.name == "Retrait : ~g~Pétoire" then
                TriggerServerEvent('sns')
            end
            if btn.name == "Retrait : ~g~Pistolet" then
                TriggerServerEvent('pistol')
            end
        end
        
    },

    Menu = {
        ["Intéraction :"] = {
            b = {
                {name = "                             ~h~~r~ → ~s~Retrait arme~r~←", ask = "", askX = true},
                {name = "Retrait : ~g~Pétoire", ask = "→→→", askX = true},
                {name = "Retrait : ~g~Pistolet", ask = "→→→", askX = true},
                

            }
        },

        
    }
}

-- Ouverture du Menu

local position = {
    {x = 810.17706298828, y = -2157.4353027344, z = 29.618999481201   }        
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
            if dist <= 0.5 then
            ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour parler avec le vendeur")
            if IsControlJustPressed(1,51) then
                if Licenses['weapon'] ~= nil then
                    CreateMenu(AtmosMenu) 
                else
                    ESX.ShowNotification("Vous devez allez voir, la ~b~LSPD~s~ pour passer votre ~r~PPA~s~. ~g~Revenez plus tard ! ")
                end
               
            end
        end
    
    end
end
end)

local blips = {
    {title="Retrait d'armes", colour=26, id=110, x = 810.17706298828, y = -2157.4353027344, z = 29.618999481201, h = 266.946},      

}

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, 110)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.5)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)