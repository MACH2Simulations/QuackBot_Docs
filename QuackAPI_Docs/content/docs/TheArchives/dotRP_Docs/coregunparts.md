+++
title = "Core Gunparts SQL"
+++

> Thanks to Grnphnx#9071 in discord! 


-- Refrenced here https://wiki.rage.mp/index.php?title=Weapons_Components#Assault_Rifle

-- Here is a template
-- ('', '', '1', '0', '1', '2','2', '', NULL, '', NULL, NULL, 'Attachment component'),
-- Remember the last line does not need a comma at the end.
-- First blank space is the item name you will put for your stores or through command... i.e. /giveitem 1 pistol_flashlight 1
-- Second blank is the label for the item so it will say "you purchased 1 Pistol Flashlight".
-- Third blank is component_name.
-- Fourth Blank is the component hash key. Remember this one is all capitals. 

-- After uploading this sql, be sure to add all items to whichever store system you use.

-- I will try to update this file with png for all items...

-- You may add/remove any item here. If you get errors while uploading this to your SQL, check the error cause, there may be a duplicated item in your database already. Take the existing one out so you can upload this without error for best use of the core_inventory. Also, Only upload this AFTER uploading the SQL from the core_inventory.

-- Lastly, restart your server after uploading and doing whatever you have to do.

-- Grnphnx#9071 If you have any questions or issues, you may DM me, I will try to help best I can.

-- Visit my website. https://www.grnphnx.com


```sql
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `x`, `y`, `category`, `componentTint`, `componentHash`, `backpackModel`, `backgroundTexture`, `description`) VALUES 
('pistol_defaultclip', 'Pistol Default Clip', '1', '0', '1', '2', '2', 'component_clip', NULL, 'COMPONENT_PISTOL_CLIP_01', NULL, NULL, 'Attachment component'),
('pistol_extended_clip', 'Pistol Extended Clip', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_PISTOL_CLIP_02', NULL, NULL, 'Attachment component'),
('pistol_flashlight', 'Pistol Flashlight', '1', '0', '1', '2','2', 'component_flashlight', NULL, 'COMPONENT_AT_PI_FLSH', NULL, NULL, 'Attachment component'),
('pistol_suppressor', 'Pistol Suppressor', '1', '0', '1', '2','2', 'component_supressor', NULL, 'COMPONENT_AT_PI_SUPP_02', NULL, NULL, 'Attachment component'),
('combat_pistol_default_clip', 'Combat Pistol Default Clip', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_COMBATPISTOL_CLIP_01', NULL, NULL, 'Attachment component'),
('combat_pistol_extended_clip', 'Combat Pistol Extended Clip', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_COMBATPISTOL_CLIP_02', NULL, NULL, 'Attachment component'),
('ap_pistol_default_clip', 'AP Pistol Default Clip', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_APPISTOL_CLIP_01', NULL, NULL, 'Attachment component'),
('ap_pistol_extended_clip', 'AP Pistol Extended Clip', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_APPISTOL_CLIP_02', NULL, NULL, 'Attachment component'),
('ap_pistol_metal_finish', 'AP Pistol Metal Finish', '1', '0', '1', '2','2', 'component_finish', NULL, 'COMPONENT_APPISTOL_VARMO_LUXE', NULL, NULL, 'Attachment component'),
('pistol50_default_clip', 'Pistol .50 Default Clip', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_PISTOL50_CLIP_01', NULL, NULL, 'Attachment component'),
('pistol50_extended_clip', 'Pistol .50 Extended Clip', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_PISTOL50_CLIP_02', NULL, NULL, 'Attachment component'),
('pistol50_suppressor', 'Pistol .50 Suppressor', '1', '0', '1', '2','2', 'component_suppressor', NULL, 'COMPONENT_AT_AR_SUPP_02', NULL, NULL, 'Attachment component'),
('pistol50_pearl_finish', 'Pistol .50 Pearl Finish', '1', '0', '1', '2','2', 'component_finish', NULL, 'COMPONENT_PISTOL50_VARMOD_LUXE', NULL, NULL, 'Attachment component'),
('heavyrevolver_vip_variant', 'Heavy Revolver VIP Finish', '1', '0', '1', '2','2', 'component_finish', NULL, 'COMPONENT_REVOLVER_VARMOD_BOSS', NULL, NULL, 'Attachment component'),
('heavyrevolver_bodyguard_variant', 'Heavy Revolver Bodyguard Finish', '1', '0', '1', '2','2', 'component_finish', NULL, 'COMPONENT_REVOLVER_VARMOD_GOON', NULL, NULL, 'Attachment component'),
('heavyrevolver_default_clip', 'Heavy Revolver Default Clip', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_REVOLVER_CLIP_01', NULL, NULL, 'Attachment component'),
('sns_default_clip', 'SNS Default Clip', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_SNSPISTOL_CLIP_01', NULL, NULL, 'Attachment component'),
('sns_extended_clip', 'SNS Extended Clip', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_SNSPISTOL_CLIP_02', NULL, NULL, 'Attachment component'),
('sns_wood_finish', 'SNS Wood Finish', '1', '0', '1', '2','2', 'component_finish', NULL, 'COMPONENT_SNSPISTOL_VARMOD_LOWRIDER', NULL, NULL, 'Attachment component'),
('heavypistol_default_clip', 'Heavy Pistol Default Clip', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_HEAVYPISTOL_CLIP_01', NULL, NULL, 'Attachment component'),
('heavypistol_extended_clip', 'Heavy Pistol Extended Clip', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_HEAVYPISTOL_CLIP_02', NULL, NULL, 'Attachment component'),
('heavypistol_suppressor', 'Heavy Pistol Suppressor', '1', '0', '1', '2','2', 'component_suppressor', NULL, 'COMPONENT_AT_PI_SUPP', NULL, NULL, 'Attachment component'),
('heavypistol_wood_finish', 'Heavy Pistol Wood Finish', '1', '0', '1', '2','2', 'component_finish', NULL, 'COMPONENT_HEAVYPISTOL_VARMOD_LUXE', NULL, NULL, 'Attachment component'),
('assaultrifle_luxuryfinish', 'Rifle Luxury Finish', '1', '0', '1', '2', '2', 'component_finish', NULL, 'COMPONENT_ASSAULTRIFLE_VARMOD_LUXE', NULL, NULL, 'Attachment component'),
('ceramic_pistol_default_clip', 'Ceramic Pistol Default Clip', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_CERAMICPISTOL_CLIP_01', NULL, NULL, 'Attachment component'),
('ceramic_pistol_extended_clip', 'Ceramic Pistol Extended Clip', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_CERAMICPISTOL_CLIP_02', NULL, NULL, 'Attachment component'),
('ceramic_pistol_suppressor', 'Ceramic Pistol Suppressor', '1', '0', '1', '2','2', 'component_suppressor', NULL, 'COMPONENT_CERAMICPISTOL_SUPP', NULL, NULL, 'Attachment component'),
('microsmg_default_clip', 'MicroSMG Default Clip', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_MICROSMG_CLIP_01', NULL, NULL, 'Attachment component'),
('microsmg_extended_clip', 'MicroSMG Extended Clip', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_MICROSMG_CLIP_02', NULL, NULL, 'Attachment component'),
('microsmg_scope', 'MicroSMG Scope', '1', '0', '1', '2','2', 'component_scope', NULL, 'COMPONENT_AT_SCOPE_MACRO', NULL, NULL, 'Attachment component'),
('microsmg_suppressor', 'MicroSMG Suppressor', '1', '0', '1', '2','2', 'component_suppressor', NULL, 'COMPONENT_AT_AR_SUPP_02', NULL, NULL, 'Attachment component'),
('microsmg_luxury_finish', 'MicroSMG Luxury Finish', '1', '0', '1', '2','2', 'component_finish', NULL, 'COMPONENT_MICROSMG_VARMOD_LUXE', NULL, NULL, 'Attachment component'),
('smg_default_clip', 'SMG Default Clip', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_SMG_CLIP_01', NULL, NULL, 'Attachment component'),
('smg_extended_clip', 'SMG Extended Clip', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_SMG_CLIP_02', NULL, NULL, 'Attachment component'),
('smg_drum_mag', 'SMG Drum Mag', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_SMG_CLIP_03', NULL, NULL, 'Attachment component'),
('smg_scope', 'SMG Scope', '1', '0', '1', '2','2', 'component_scope', NULL, 'COMPONENT_AT_SCOPE_MACRO_02', NULL, NULL, 'Attachment component'),
('smg_suppressor', 'SMG Suppressor', '1', '0', '1', '2','2', 'component_suppressor', NULL, 'COMPONENT_AT_PI_SUPP', NULL, NULL, 'Attachment component'),
('smg_luxury_finish', 'SMG Luxury Finish', '1', '0', '1', '2','2', 'component_finish', NULL, 'COMPONENT_SMG_VARMOD_LUXE', NULL, NULL, 'Attachment component'),
('assault_smg_default_clip', 'Assault SMG Default Clip', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_ASSAULTSMG_CLIP_01', NULL, NULL, 'Attachment component'),
('assault_smg_extended_clip', 'Assault SMG Default Clip', '1', '0', '1', '2','2', 'component_clip', NULL, 'COMPONENT_ASSAILTSMG_CLIP_02', NULL, NULL, 'Attachment component'),
('assault_smg_suppressor', 'Assault SMG Suppressor', '1', '0', '1', '2','2', 'component_suppressor', NULL, 'COMPONTENT_AT_AR_SUPP_02', NULL, NULL, 'Attachment component')
```