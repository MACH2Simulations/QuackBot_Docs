+++
title = "Usable-Items"
+++

# MRF Docs Usable items  

This function replaces the need to add the snipped bellow for every item you want to use, the items still need to to be [IN THE DATABASE](../core/dbitems).  

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

> You will also need the following links
[GTA5 Prop List](https://gtahash.ru/)  
[GTA Animations](https://alexguirre.github.io/animations-list/)

## About the file  

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
Prop - What Prop to use  
DFAD - FOOD ANIMATION DICTONARY - normally "mp_player_inteat@burger"  
DFA - FOOD ANIMATION - normally "mp_player_int_eat_burger_fp"  

```lua
{dbname = "burger",type="food",hunger=250000,OnUseNotify="Hmmm Burger", prop="prop_cs_burger_01", DFAD = "mp_player_inteat@burger" , DFA = "mp_player_int_eat_burger_fp"},
```

#### Drink  

> DBName - The item name in the database  
Type - Always "drink" (lowercase)  
Thirst - How much Thirst to fill 250000 is about a quarter under normal settings  
OnUseNotify - What text to display when used  
Prop - What Prop to use  
DDAD - DRINK ANIMATION DICTONARY - normally "mp_player_intdrink"  
DDA - DRINK ANIMATION - normally "loop_bottle"  


```lua
{dbname = "icedtea",type="drink",thirst=250,OnUseNotify="Cold Tea? Are you high?",prop="stt_prop_lives_bottle", DDAD = "mp_player_intdrink", DDA = "loop_bottle"},
```

#### Alcohol  

> DBName - The item name in the database  
Type - Always "alcohol" (lowercase)  
Thirst - How much Thirst to fill 250000 is about a quarter under normal settings  
Drunkness - How Drunk to get someone, 100000 is a good value  
OnUseNotify - What text to display when used  
Prop - What Prop to use  
DDAD - DRINK ANIMATION DICTONARY - normally "mp_player_intdrink"  
DDA - DRINK ANIMATION - normally "loop_bottle" 

```lua
{dbname = "whiskey",type="alcohol",thirst=250,drunkness=300,OnUseNotify="Hmmm",prop="prop_cs_whiskey_bottle", DDAD = "mp_player_intdrink", DDA = "loop_bottle"},
```

#### Meal

> DBName - The item name in the database  
Type - Always "meal" (lowercase)  
Hunger - How much hunger to fill 250000 is about a quarter under normal settings  
Thirst - How much Thirst to fill 250000 is about a quarter under normal settings  
OnUseNotify - What text to display when used  
Prop - What Prop to use  
DFAD - FOOD ANIMATION DICTONARY - normally "mp_player_inteat@burger"  
DFA - FOOD ANIMATION - normally "mp_player_int_eat_burger_fp"  

```lua
{dbname = "the_works",type="meal",hunger=300,thirst=320,OnUseNotify="Yummy!",prop="v_res_tt_pizzaplate",  DFAD = 'mp_player_inteat@burger' , DFA ='mp_player_int_eat_burger_fp'},
```

### This should then look like this  

```lua
UseableItemsDebug = false,
UseableItems = {
{dbname = "whiskey",type="alcohol",thirst=2,drunkness=1,OnUseNotify="Dang",prop="prop_cs_whiskey_bottle", DDAD = "mp_player_intdrink", DDA = "loop_bottle"},
{dbname = "icedtea",type="drink",thirst=2,OnUseNotify="Co?",prop="stt_prop_lives_bottle", DDAD = 'mp_player_intdrink', DDA = 'loop_bottle'},
{dbname = "pizza",type="food",hunger=2,OnUseNotify="COW",prop="v_res_tt_pizzaplate",  DFAD = 'mp_player_inteat@burger' , DFA = 'mp_player_int_eat_burger_fp'},
{dbname = "the_works",type="meal",hunger=3,thirst=3,OnUseNotify="Yum",prop="v_res_tt_pizzaplate",  DFAD = 'mp_player_inteat@burger' , DFA = 'mp_player_int_eat_burger_fp'},
},
--Note, set to low numbers for formatting reasons, 250000 is much better choice
```

---
