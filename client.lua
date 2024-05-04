local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("Syrox-DvAll:dvall")
AddEventHandler("Syrox-DvAll:dvall", function()
    local vehicles = GetGamePool('CVehicle')
    for k, vehicle in pairs(vehicles) do
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then 
            SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
            SetEntityAsMissionEntity(vehicle, false, false) 
            DeleteVehicle(vehicle)
            DeleteEntity(vehicle)
            if (DoesEntityExist(vehicle)) then 
                DeleteVehicle(vehicle) 
                DeleteEntity(vehicle)
            end
        end
    end
end)