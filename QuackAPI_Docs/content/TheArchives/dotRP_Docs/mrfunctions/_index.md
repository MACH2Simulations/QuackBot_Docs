+++
archetype = "chapter"
title = "MACH-Raven-Functions"
+++
# MACH & Raven Functions  

Please read our [Documentation](../../dotrp_docs/mrfunctions/) For help with configuration  

---

## Discord Rich Presence

__STANDALONE__  
This allows you to set the following in discord to show when players are playing on the server.  
You must have a discord application set up as per the docs [here](../../dotrp_docs/mrfunctions/drp)  
![image](../../dotrp_docs/mrfunctions/drp.PNG)

---
## Hands Up  

Put Yer hands up, custom keybind, not much more to say!
No docs for this one, you can change a letter

---

## Blips  

__STANDALONE__  
This allows you to create blips anywhere on the map, as well as create map zones to display stuff like a green zone on the map.  
This is good for when some scripts have forgot blips or you just want a lightweight way to add a zone without a whole script to depend on.  
[Config](../../dotrp_docs/mrfunctions/blips)
See Zones bellow
![image](../../dotrp_docs/mrfunctions/zones.jpg)

---

## Car names

__STANDALONE__
Are you fed up with scripts showing car names as ***NULL*** ? Well this allows you to fix that.  
A Simple Config to fix this issue!  
[Config](../../dotrp_docs/mrfunctions/carnames)

---

## Usable Items  

__REQUIRES ESX__  
Simple Script to allow you to add useable items (food, drink, booze, meals) rather than having to manually register useable item every time.  
Allows you to set what prop is used too!  
[Config](../../dotrp_docs/mrfunctions/usableitems)

---

## Speed Limiter  

__STANDALONE__  
This allows you to set the max speed of each vehicle class, or set it to be unlimited.  
This is a hard cap which will stop the vehicle from being able to exceed that speed.  
[Speed Docs](../../dotrp_docs/mrfunctions/speed) ***caveats***.  

---

## Trains  

__STANDALONE__  
This allows you to set if trains spawn and how often.  
There is not much more to it than that lol.  
[Train Docs](../../dotrp_docs/mrfunctions/trains)  

---

## Traffic  

__STANDALONE__  
This sets the multipliers for how many peds, cars etc are on the road.  
You will also be able to set if boats or garbage trucks spawn (TODO)  
[Traffic](../../dotrp_docs/mrfunctions/traffic)  

---

## DeadFinder

__REQUIRES ESX__
This allows you to set a key which wibbles your body when dead, this resets your location in the world.  
This is good for when bodies sometimes go missing when someone dies and EMS arrives  
[Dead Finder](../../dotrp_docs/mrfunctions/dead) ***caveats*** - Can trip some anticheat.  

---
## PED YEETER  

This stops any ped from spawning in a given location. 
[Config](../../dotrp_docs/mrfunctions/pedyeeter)



## INFO EVENTS  

Under construction, tires to pass get street name from client to server  

---

### Code Commenting:  

This explains how the code is commented at the top of the config blocks  

FUNCTION NAME  
FILE (SEP)  
FILE LOCATION  
DEC (SEP)  
A SHORT DESCRIPTION  
IMPORTANT (SEP)  
ANY IMPORTANT INFO  
SUGGESTIONS (SEP)  
ANY SUGGESTED CONFIG  
INFO (SEP)  
ANY NATIVE INFO OR ODDITYS  

***Inline Comments***  
**--Must be**  
Must be a float! -- This means the number must have a decimal place, IE 1.0  
Must be a INT! -- This means the number must be a whole number!  
**--DEF**  
This is what the default recommended values are!  
--DEF 300




```Lua
--SPEED LIMITER (THIS WILL BE THE Functions NAME)
--FILE
--client/Speed.lua (LOCATION OF FILE)
--Desc
--The sets the speedlimits for vechs (SHORT description)
--IMPORTANT
--this is based of the Vech class in <vehicleClass>xxxx</vehicleClass> in vehicles.meta, it does not care what is in your database! (ANY IMPORTANT INFO)
--Suggestion
--150 seems like a good max speed so far in testing, with 250 for heli/ac. You really dont want to be going much higher than this (ANY SUGGESTIONS)
--Info
--Car Class Info https://docs.fivem.net/natives/?_0x29439776AAA00A62 (ANY NATIVE INFO / ODDITIES )
--Some HUDS Round stuff weridly, so shown speed might be 1/2 MPH In either direction
--We also think that at very high speeds the math to caluclate it stuggles

```


---


## TODO DESC & DOCS




info events 

##  todo docs
discord rich pres (and config) - consider adding switch to remove what the player is doing
blips
car names
PED YEETER  
## TODO SCRIPTING 
StopPeds -- Stop Certain peds from spawning  
StopCars -- Stops Certain vehicles from spawning (most of the time)


---
