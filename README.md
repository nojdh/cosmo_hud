# Cosmo HUD
Simple status HUD for FiveM and ESX inspired by NoPixel 3.0 - Remake by lilfraae

## Creating Issue
* Check the [Closed Topics](https://github.com/xxpromw3mtxx/cosmo_hud/issues?q=is%3Aissue+is%3Aclosed) & [Wiki]() before opening an issue to see if your issue has already been Answered.
* Do NOT Delete the Pre-Written Text in the issue.
* Failue to due any of the above will result in Topic being deleted & you being Blocked. The Pre-Written text helps me with getting to the Bottom of the Issues & I hate explaining things over & over.

## Helpful Info
* Keep track of your hunger and thirst.
* Ability to know what your voice range is.
* Check your speed while driving.
* Simple and non-invasive ui.
* Female ped health fix.

## Requirements
* Required:
    * [esx_status](https://github.com/esx-framework/esx_status)
    * [esx_basicneeds](https://github.com/esx-framework/esx_basicneeds)
    * [mumble-voip](https://github.com/FrazzIe/mumble-voip-fivem)
* Optional:
    * [rp-radio](https://github.com/FrazzIe/rp-radio)

## Download & Installation
1. Download Master or Release & Extract the .zip or Open the .zip.
2. Edit the config.lua before starting the script.
3. Add `ensure cosmo_hud` to your server.cfg
4. To make sure that `cosmo_hud` works with `esx_status`, you have to change the following line in `[esx]/esx_status/client/main.lua`:
```
        92          TriggerEvent('esx_status:onTick', data)

        to

        92          --TriggerEvent('esx_status:onTick', data)
        93          TriggerEvent('cosmo_hud:onTick', data)
```
5. Set `Config.Display` to false in `[esx]/esx_status/config.lua`
6. Set `Config.Display` to false in `[esx]/esx_basicneeds/config.lua`
7. You're set!
8. **Do not change the name or it will not work.**

## Female ped health fix
1. To make sure that health get fixed, open the file `[esx]/esx_basicneeds/client/main.lua`
2. Go at the end
    2. the position it's not important actually
3. Add this portion of code:
```
        --Female ped health fix
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(1)
                if GetEntityMaxHealth(GetPlayerPed(-1)) ~= 200 then
                    SetEntityMaxHealth(GetPlayerPed(-1), 200)
                    SetEntityHealth(GetPlayerPed(-1), 200)
                end
            end
        end)
```
4. You're set!

## Known Bugs

## Credits/Original Code
* [nojdh](https://github.com/nojdh)
    * [cosmo_hud](https://github.com/nojdh/cosmo_hud)
* [colored_map](https://forum.cfx.re/u/Antoine)
* [PostalCodes_StreetNames](https://forum.cfx.re/t/release-original-street-names-w-postal-numbers/8717)
* [Loading-Bar](https://loading.io/progress/)

## Legal
### License
cosmo_hud - Simple status HUD for FiveM and ESX inspired by NoPixel 3.0

Copyright (C) 2011-2021 lilfraae/Xxprom3mtxX

This program Is free software: you can redistribute it And/Or modify it under the terms Of the GNU General Public License As published by the Free Software Foundation, either version 3 Of the License, Or (at your option) any later version.

This program Is distributed In the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty Of MERCHANTABILITY Or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License For more details.

You should have received a copy Of the GNU General Public License along with this program. If Not, see http://www.gnu.org/licenses/.
