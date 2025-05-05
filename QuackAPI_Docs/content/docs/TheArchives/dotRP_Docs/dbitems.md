+++
title = "MACH & ONYX FiveM Functions"
+++


#FOR ESX



## Adding Items to the Database.  
First you need to add all the items you want to use to the Database, a good way of doing this is in a CSV File! 
[ITEMS.CSV](/items.csv)  


| name                                                            | label                                        | weight                               | rare     | can\_remove | degrade\_modifier | unique   | description      | x                   | y | category                |
| --------------------------------------------------------------- | -------------------------------------------- | ------------------------------------ | -------- | ----------- | ----------------- | -------- | ---------------- | ------------------- | - | ----------------------- |
| The name of the item, always lowercase, no spaces or spec chars | How you want it to be displayed in inventory | a weight (0 if using core inventory) | Always 0 | Always 1    | Best set to 1     | Always 0 | opt discription  | Core inventroy Size |   | Core inventory category |
| drink\_flaming\_slater                                          | Flaming Slater                               | 0                                    | 0        | 1           | 1                 | 0        | Boom Peepo Drunk | 1                   | 1 | drinks                  |

> For images the must match the name and be placed it the inventory's picture location. The same images will need to be put in the \core_crafting\html\img folder.
