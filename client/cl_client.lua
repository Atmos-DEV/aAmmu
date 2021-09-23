ESX = nil

local Licenses                = {}
local membership = false

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
    Base = { Title = "Boutique d'armes", HeaderColor = {255, 0, 122} },
    Data = { currentMenu = "Intéraction :" },
    Events = {
        onSelected = function(self, _, btn, JMenu, menuData, currentButton, currentSlt, result)
            if btn.name == "~r~Prix~s~ : Parachute" then
                TriggerServerEvent('para')
            end
            if btn.name == "~r~Prix~s~ : Lampe Torche" then
                TriggerServerEvent('torche')
            end
            if btn.name == "~r~Prix~s~ : Bat de Baseball" then
                TriggerServerEvent('bat')
            end
            if btn.name == "~r~Prix~s~ : Couteau à cran d'arrêt" then
                TriggerServerEvent('couteau')
            end
            if Licenses['weapon'] ~= nil then
                if btn.name == "~r~Prix~s~ : Pistolet" then
                    TriggerServerEvent('certifpistol') 
                end
            else 
                ESX.ShowNotification("Vous devez allez voir, la ~b~LSPD~s~ pour passer votre ~r~PPA~s~. ~g~Revenez plus tard ! ")
            end
            if Licenses['weapon'] ~= nil then
                if btn.name == "~r~Prix~s~ : Pétoire" then
                    TriggerServerEvent('certifsns') 
                end
            else 
                ESX.ShowNotification("Vous devez allez voir, la ~b~LSPD~s~ pour passer votre ~r~PPA~s~. ~g~Revenez plus tard ! ")
            end
                
        end
        
    },

    Menu = {
        ["Intéraction :"] = {
            b = {
                {name = "                             ~h~~r~ → ~s~Accessoires~r~←", ask = "", askX = true},
                {name = "~r~Prix~s~ : Parachute", ask = "~r~8000$~s~ →", askX = true},
                {name = "                         ~h~~r~ → ~s~Armes Blanches ~r~←", ask = "", askX = true},
                {name = "~r~Prix~s~ : Lampe Torche", ask = "~r~2000$~s~ →", askX = true},
                {name = "~r~Prix~s~ : Bat de Baseball", ask = "~r~5000$~s~ →", askX = true},
                {name = "~r~Prix~s~ : Couteau à cran d'arrêt", ask = "~r~7500$~s~ →", askX = true},
                {name = "                           ~h~~r~ → ~s~Armes Létales ~r~←", ask = "", askX = true},
                {name = "~r~Prix~s~ : Pétoire", ask = "~r~40000$~s~ →", askX = true},
                {name = "~r~Prix~s~ : Pistolet", ask = "~r~70000$~s~ →", askX = true},
                

            }
        },

        
    }
}

-- Ouverture du Menu

local position = {
    {x = 22.01602935791, y = -1107.16015625, z = 29.797021865845 }           
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
                CreateMenu(AtmosMenu)
            end
        end
    
    end
end
end)

local blips = {
    {title="Boutique d'armes", colour=1, id=311, x = 22.01602935791, y = -1107.16015625, z = 29.797021865845, h = 266.946},      

}

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, 313)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.5)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)