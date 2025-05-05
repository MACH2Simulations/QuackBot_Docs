+++
title = "Core_Inventory / Core_Clothing"
+++

> The stuff we have learnt trying to get these working.  

## FOR ESX
>Note; You might not Need core_weapons if you have Core_Inventory

Thanks to all the CORE staff & discord members (esp Grnphnx for the bits of code i have found to build this) 

>As per CORE documentaions do the following


>ADD/REPLACE THESE FUNCTIONS IN es_extended/server/classes/player.lua

```
function self.getInventory(minimal, inventory)
	inventory = inventory or 'content-' ..  self.identifier:gsub(":", "")
    return exports['core_inventory']:getInventory(inventory)
end

function self.getInventoryItem(name, inventory)
	inventory = inventory or 'content-' ..  self.identifier:gsub(":", "")
	return exports['core_inventory']:getItem(inventory, name)
end

function self.addInventoryItem(name, count, metadata, inventory)
	inventory = inventory or 'content-' ..  self.identifier:gsub(":", "")
	return exports['core_inventory']:addItem(inventory, name, count, metadata)
end

function self.removeInventoryItem(name, count, inventory)
	inventory = inventory or 'content-' ..  self.identifier:gsub(":", "")
	return exports['core_inventory']:removeItem(inventory, name, count)
end

function self.canCarryItem(name, count, inventory)
	inventory = inventory or 'content-' ..  self.identifier:gsub(":", "")
	return exports['core_inventory']:canCarry(inventory, name, count)
end
```

>1) Import SQL File  
 2) Add an x,y Value to all items (this sets how much space it takes up in the inventory)  
 3) Give all Weapons the "weapons" catagory  
 4) Set all weapon names to lowercase (This changes the command from /giveweapon to /giveitem  
 
 ---
 
## Weapon Purchasing  
 >1) REPLACE xplayer.addWeapon(GUNNAME,0) in weapons shops to xplayer.addInventoryItem(GUNNAME, 1) - This may be need to be done in scripts like esx_police  
  2) Add the SQL File [Core Gun Parts SQL](docs/coregunparts.md) to your database (This adds attachments to the database to use as items)  
  3)
  
## Pause Menu
 
 >if your pause menu is not working, remove this line in client.lua (around 316 for me)  
DisableControlAction(0, 199, true)

## Spawning items
>ID Is bascially slot, does not need to be adjusted  

Torso = ARMS  
Texture = Item Texture  
Model = What item it is  

Male Tosro  
``./giveitem PID torso 1 {"mTorso":15,"mID":11,"mTexture":1,"mModel":14}``  
Male Shirt  
``/giveitem PID tshirt 1 {"mID":8,"mTexture":1,"mModel":14}``  
Male Shoes  
``/giveitem PID shoes 1 {"mID":8,"mTexture":1,"mModel":14}``  
Male Pants  
``/giveitem PID pants 1 {"mID":8,"mTexture":1,"mModel":14}``  

Female Tosro  
``./giveitem PID torso 1 {"fTorso":15,"fID":11,"fTexture":1,"fModel":14}``  
Female Shirt  
``/giveitem PID tshirt 1 {"fID":8,"fTexture":1,"fModel":14}``  
Female Shoes  
``/giveitem PID shoes 1 {"fID":8,"fTexture":1,"fModel":14}``  
Female Pants  
``/giveitem PID pants 1 {"fID":8,"fTexture":1,"fModel":14}``  



>Clothing IDs  
0	Head  
1	Masks  
6	Shoes  
8	Undershirts  
11	Tops  





---
# Adding items to the store (Clothing)

Male Torso
```
['M_Torso_27_Tex_2'] = {
            category = false, -- 
            label = 'M_Torso_27_Tex_2'.
            parent = 'man_torso',
            price = 12,
            item = 'torso', -- 
			men = {id=11, model=27, texture = 2, torso = 0},
			woman = {}
			},
```	

Male T-Shirt 
```
['TS_11_TX_3'] = {
            category = false, -- If not category its purschasable
            label = 'TS_11_TX_3',
            parent = 'man_shirts',
            price = 12,
            item = 'tshirt', -- 
			men = {id=8, model=11, texture = 3},
			woman = {}

          },
```

Male Pants
```
['M_PANTS_18_1'] = {
               category = false, -- If not category its purschasable
               label = 'PANTS #18',
               parent = 'men_pants',
               price = 200,
               item = 'pants', -- 
               men = {id = 4, model = 18, texture = 1 },
               woman = {}
          },
```

Male Shoes
```
['M_SHOES_60_TXT_1'] = {
                category = false, -- If not category its purschasable
                label = 'M_SHOES_60_TXT_1',
                parent = 'men_shoes',
                price = 20,
                item = 'shoes', -- 
                men {id = 6, model = 60, texture = 1 },
                woman = {}
           },
```

---

Female Torso
```
['F_Torso_27_Tex_2'] = {
            category = false, -- 
            label = 'M_Torso_27_Tex_2'.
            parent = 'woman_torso',
            price = 12,
            item = 'torso', -- 
			men = {},
			woman = {id=11, model=27, texture = 2, torso = 0}
			},
```	

Female T-Shirt 
```
['F_TS_11_TX_3'] = {
            category = false, -- If not category its purschasable
            label = 'TS_11_TX_3',
            parent = 'woman_torso',
            price = 12,
            item = 'tshirt', -- 
			men = {},
			woman = {id=8, model=11, texture = 3}

          },
```

Female Pants
```
['F_PANTS_18_1'] = {
               category = false, -- If not category its purschasable
               label = 'PANTS #18',
               parent = 'woman_pants',
               price = 200,
               item = 'pants', -- 
               men = {},
               woman = {id = 4, model = 18, texture = 1 }
          },
```

Female Shoes
```
['F_SHOES_60_TXT_1'] = {
                category = false, -- If not category its purschasable
                label = 'F_SHOES_60_TXT_1',
                parent = 'woman_shoes',
                price = 20,
                item = 'shoes', -- 
                men {},
                woman = {id = 6, model = 60, texture = 1}
           },
```
---

# Police Searching 


Thanks too Flight Lieutenant on discord 
```
Police Search Function For ESX 1.1 not sure about 1.2 or above.
replace this function in police\client\main.lua line number 667.
Works for RNG Police too

Original :-

elseif action == 'body_search' then
TriggerServerEvent('esx_policejob:message', GetPlayerServerId(closestPlayer), _U('being_searched'))
TriggerEvent('disc-inventoryhud:search', source)
						
Replace to :-

elseif action == 'body_search' then
TriggerServerEvent('esx_policejob:message', GetPlayerServerId(closestPlayer), _U('being_searched'))
TriggerServerEvent('core_inventory:server:openInventory', GetPlayerServerId(closestPlayer), 'otherplayer', x, y)
```
