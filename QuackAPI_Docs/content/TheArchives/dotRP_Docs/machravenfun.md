+++ 
title = " MACH & ONYX FiveM Functions"
+++

---
## TODO  
NORMAL BLIPS in blip function


---

## Usable items  

This function replaces the need to add the snipped bellow for every item you want to use, the items still need to to be [IN THE DATABASE](/dbitems.md).  

```lua
ESX.RegisterUsableItem('fishbait', function(source) //fishbait db item name 
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('fishbait', 1) //fishbait is item name in db
    TriggerClientEvent('esx_status:add', source, 'hunger', 8000) //fill food
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_fishbait')) 
    //used_fishbait (for translations)
end)
```  

> Head to the useable items section in the cfg file.  

### About the file  

> 1)Function Name - Usable Items  
> 2)Script Location - server/usableitems.lua (Tebex encrypted)  
> 3)Description - This allows you to add useable items in a simpler config file, rather than having to add 500 Useable item chunks as above  
> 4)UseableItemsDebug - Set this to true to print item registration attempts to the SERVER CONSOLE  
> 5)Note this uses the default ESX Notification, you can change this in "resources\es_extended\client\functions.lua" (which is a good way of globally updating this)  
> 6)The numbers is these docs are low for formatting reasons, 250000 is a reasonable number, 250 IS NOT

### Syntax

#### Food  

>DBName - The item name in the database  
Type - Always "food" (lowercase)  
Hunger - How much hunger to fill 250000 is about a quarter under normal settings  
OnUseNotify - What text to display when used  

```lua
{dbname = "burger",type="food",hunger=250000,OnUseNotify="Hmmm Burger"},
```

#### Drink  

> DBName - The item name in the database  
Type - Always "drink" (lowercase)  
Thirst - How much Thirst to fill 250000 is about a quarter under normal settings  
OnUseNotify - What text to display when used  

```lua
{dbname = "icedtea",type="drink",thirst=250,OnUseNotify="Cold Tea? Are you high?"},
```

#### Alcohol  

> DBName - The item name in the database  
Type - Always "alcohol" (lowercase)  
Thirst - How much Thirst to fill 250000 is about a quarter under normal settings  
Drunkness - How Drunk to get someone, 100000 is a good value  
OnUseNotify - What text to display when used  

```lua
{dbname = "whiskey",type="alcohol",thirst=250,drunkness=300,OnUseNotify="Hmmm"},
```

#### Meal

> DBName - The item name in the database  
Type - Always "meal" (lowercase)  
Hunger - How much hunger to fill 250000 is about a quarter under normal settings  
Thirst - How much Thirst to fill 250000 is about a quarter under normal settings  
OnUseNotify - What text to display when used  

```lua
{dbname = "the_works",type="meal",hunger=300,thirst=320,OnUseNotify="Yummy!"},
```

### This should then look like this  

```lua
UseableItemsDebug = false,
UseableItems = {
{dbname = "burger",type="food",hunger=250,OnUseNotify="Hmmm Burger"},
{dbname = "icedtea",type="drink",thirst=250,OnUseNotify="Cold Tea?"},
{dbname = "whiskey",type="alcohol",thirst=250,drunkness=300,OnUseNotify="Hmmm"},
{dbname = "the_works",type="meal",hunger=300,thirst=320,OnUseNotify="Yum"},
},
--Note, set to low numbers for formatting reasons, 250000 is much better choice
```

---

## Blips  

This script allows you to add radial (Circle) Zones, Area (Square) Zone and Blips

> Head to the Blips section in the cfg file.  

### About the file  


> 1)Function Name - Blips  
> 2)Script Location - client/blips.lua (Tebex encrypted)    
> 3)Description - This allows you to add blips are zones to the map  
> 4)Blip- Set this to true to print Blip creation attempts to CLIENT Console  


#### Radial Blips

#### Area Blips


#### Normal Blips
