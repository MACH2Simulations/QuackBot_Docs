+++
title = "Core_Crafting"
+++

This is how you add items to core_crafting!  

#FOR ESX

## Adding Items to the Database.  

First you need to add all the items you want to use to the Database, a good way of doing this is in a CSV File! 
[ITEMS.CSV](/items.csv)  


| name                                                            | label                                        | weight                               | rare     | can\_remove | degrade\_modifier | unique   | description      | x                   | y | category                |
| --------------------------------------------------------------- | -------------------------------------------- | ------------------------------------ | -------- | ----------- | ----------------- | -------- | ---------------- | ------------------- | - | ----------------------- |
| The name of the item, always lowercase, no spaces or spec chars | How you want it to be displayed in inventory | a weight (0 if using core inventory) | Always 0 | Always 1    | Best set to 1     | Always 0 | opt discription  | Core inventroy Size |   | Core inventory category |
| drink\_flaming\_slater                                          | Flaming Slater                               | 0                                    | 0        | 1           | 1                 | 0        | Boom Peepo Drunk | 1                   | 1 | drinks                  |

> For images the must match the name and be placed it the inventory's picture location. The same images will need to be put in the \core_crafting\html\img folder.

## Making items useable  


>This is for stuff that you want to be consumable, like rum and coke, but you wouldn't add ice here.  
If you want the person to be able to drink/eat it it needs to be here  
This would go in your food script. We used to use [viv_snackies](https://github.com/Vivi4n/viv_snackies) but have since moved to our own functions script.  
This could also be added to esx_basicneeds


> For non alcoholic drinks 
```
ESX.RegisterUsableItem('cola', function(source)  // Cola db item name
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('cola', 1) // Cola is name of item in DB
    TriggerClientEvent('esx_status:add', source, 'thirst', 220000) //fill thirst 
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_cola')) 
    //used_cola (for translations)  
end)  
```
> For alcoholic drinks  
```
ESX.RegisterUsableItem('whiskey', function(source) //Whiskey db item name
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('whiskey', 1) //Whiskey is db item name
    TriggerClientEvent('esx_status:add', source, 'drunk', 220000) //Shitfaced 
    TriggerClientEvent('esx_status:add', source, 'thirst', 220000) //fill thirst
    TriggerClientEvent('esx_optionalneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_whiskey')) 
    //used_whiskey (for translations)
end)  
```
> For Food  
```
ESX.RegisterUsableItem('fishbait', function(source) //fishbait db item name 
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('fishbait', 1) //fishbait is item name in db
    TriggerClientEvent('esx_status:add', source, 'hunger', 8000) //fill food
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_fishbait')) 
    //used_fishbait (for translations)
end)
```

> Then into the locales file add the correct locales  
```
['used_fishbait'] ='You ate my wet meat',  // What comes up when you use the item
```  
## Adding to Core_Crafting

> If you want to add catagorys the syntax is

```
['drinks'] = {
Label = 'Drinks',
Image = 'beer',
Jobs = {} //IE Jobs = {"ambulance","police"}
},
```

> Crafting Syntax (for the lazy / automaters see after this section)

```
['bandage'] = { -- This must match the item name
Level = 0, -- From what level this item will be craftable
Category = 'medical', -- The category item will be put in
isGun = false, -- Specify if this is a gun so it will be added to the loadout
Jobs = {'ambulance'}, -- What jobs can craft this item, leaving {} allows any job
JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
Amount = 2, -- The amount that will be crafted
SuccessRate = 100, -- 100% you will recieve the item
requireBlueprint = false, 
-- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: 
--itemname_blueprint EXAMPLE: bandage_blueprint
Time = 10, -- Time in seconds it takes to craft this item
Ingredients = { -- Ingredients needed to craft this item
['clothe'] = 2, -- item name and count, 
--adding items that dont exist in database will crash the script
['wood'] = 1
}
},
```  

> For the automaters  
a CSV And Mailmerge works wonders here.  
[Merger.CSV](/merger.csv)  

> Leave unsed Ingredients blank  
Note the commas after igcounts (how many of each item used), apart from, the last item   

| itemname               | level | category | isgun | jobs | jobsgrades | ammount | SuccessRate | requireBlueprint | time | Ingredient1    | ig1count | Ingredient2  | ig2count |
| ---------------------- | ----- | -------- | ----- | ---- | ---------- | ------- | ----------- | ---------------- | ---- | -------------- | -------- | ------------ | -------- |
| drink\_flaming\_slater | 0     | drinks   | FALSE |      |            | 4       | 100         | FALSE            | 10   | \['kraken'\] = | 1,       | \['cola'\] = | 1,       |  


This is cut off at item 2 for formatting, see CSV for full example, i do not see why it couldnt be more than 6 items!




> Then you should have a Mailmerge that looks something like this

```
['«itemname»'] = {
Level = «level»,
Category = '«category»',
isGun = «isgun»,
Jobs = {«jobs»},
JobGrades = {«jobsgrades»},
Amount = «ammount»,
SuccessRate = «SuccessRate»,
requireBlueprint = «requireBlueprint», 
Time = «time», 
Ingredients = {
«Ingredient1»«ig1count»
«Ingredient2»«ig2count»
«Ingredient3»«ig3count»
«Ingredient4»«ig4count»
«Ingredient5»«ig5count»
«Ingredient6»«ig6count»
}
},
```

>which then looks like

```
['drink_flaming_slater'] = {
Level = 0,
Category = 'drinks',
isGun = FALSE,
Jobs = {},
JobGrades = {},
Amount = 4,
SuccessRate = 100,
requireBlueprint = FALSE, 
Time = 10,
Ingredients = {
['kraken'] = 1,
['cola'] =1,
['gunpowder'] =1,
['lighter'] =1
}
},

```

> Important note, word uses weird charaters for ' / " sometimes, you may have to cntrl + F and change them in your text editor when adding this to your core crafting cfg
