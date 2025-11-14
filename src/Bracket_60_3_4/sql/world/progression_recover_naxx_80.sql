-- Enable Naxxramas Map (mapID: 533)
SET @MAP_ID := 533;

-- delete dbc difficulty of Naxx25
DELETE FROM `mapdifficulty_dbc` WHERE `MapID` = @MAP_ID;

-- Recover access to min level 80 for Naxx25
UPDATE `dungeon_access_template` SET `min_level` = 80 WHERE `map_id` = @MAP_ID AND `difficulty` = 1;


-- Recover Graveyard Position from Dragonblight to EPL
-- https://wow.tools/dbc/?dbc=worldsafelocs&build=3.3.5.12340#page=1&search=909
-- https://wow.tools/dbc/?dbc=areatable&build=3.3.5.12340#page=1&search=3456
DELETE FROM `graveyard_zone` WHERE `GhostZone` = 3456;
INSERT INTO `graveyard_zone` (`ID`, `GhostZone`, `Faction`, `Comment`)
VALUES
(1308, 3456, 469, 'Dragonblight, Wintergarde GY - Dragonblight');
INSERT INTO `graveyard_zone` (`ID`, `GhostZone`, `Faction`, `Comment`)
VALUES
(1309, 3456, 67, 'Dragonblight, Forsaken East GY - Naxxramas');



-- Recover Entrance transporter object. Necromantic Runestone (id: 189314, displayID: 7786)
SET @DEATH_KNIGHT_PORTAL_EFFECT:= 28444;
SET @TRANSPORTER_ENTRY:= 9000;
SET @TRANSPORTER_COOLDOWN:= 5;
DELETE FROM `gameobject_template` WHERE (`entry` = @TRANSPORTER_ENTRY);

DELETE FROM `gameobject` WHERE `id`=@TRANSPORTER_ENTRY AND `map`=0 AND `zoneId`=0 AND `areaID`=0;


-- Recover condition Attunement to teleport spell
DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId` = 17) AND
(`SourceGroup` = 0) AND (`SourceEntry` = @DEATH_KNIGHT_PORTAL_EFFECT) AND
(`SourceId` = 0) AND (`ElseGroup` IN (0,1,2)) AND (`ConditionTypeOrReference` =
8) AND (`ConditionTarget` = 1) AND (`ConditionValue1` IN (9121, 9122, 9123)) AND
(`ConditionValue2` = 0) AND (`ConditionValue3` = 0);


-- Recover Floating Naxx Object (id: 181056)
-- Node 0 of PathID 436 in taxiPathNode
-- https://wow.tools/dbc/?dbc=taxipathnode&build=3.3.5.12340#page=1&colFilter%5B1%5D=436
DELETE FROM `gameobject` WHERE `id`=181056;
DELETE FROM `transports` WHERE `guid`=21 AND `entry`=181056;


-- Recover speed (Data1) and map (Data6)
DELETE FROM `gameobject_template` WHERE (`entry` = 181056);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES
(181056, 15, 6637, 'Naxxramas', '', '', '', 1, 436, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 1);

-- Recover exit portals to EPL OR Disable exit portals like Naxx40
-- DELETE FROM `areatrigger_teleport` WHERE `ID` in (5196, 5197, 5198, 5199);
-- INSERT INTO `areatrigger`
-- (`entry`, `map`, `x`, `y`, `z`, `radius`, `length`, `width`, `height`, `orientation`)
--  VALUES 
-- (5196,533,3005.47,-3445.11,297.925,0,9.3,1.718,8,0.02805),
-- (5197,533,3016.94,-3434.39,297.928,0,9.3,1.718,8,4.714),
-- (5198,533,3005.67,-3423.28,297.927,0,9.3,1.718,8,6.276),
-- (5199,533,2994.63,-3434.37,297.928,0,9.3,1.718,8,4.728);

--Recover triggers teleport to Naxx exits
DELETE FROM `areatrigger_teleport` WHERE `ID` in (5196, 5197, 5198, 5199);
INSERT INTO `areatrigger_teleport` 
(`ID`, `Name`, `target_map`, `target_position_x`, `target_position_y`,`target_position_z`, `target_orientation`)
VALUES 
(5196,'Naxxramas (exit1)',571,3679.25,-1278.58,243.55,2.39),
(5197,'Naxxramas (exit2)',571,3679.03,-1259.68,243.55,3.98),
(5198,'Naxxramas (exit3)',571,3661.14,-1279.55,243.55,0.82),
(5199,'Naxxramas (exit4)',571,3660.01,-1260.99,243.55,5.51);

--Recover Meeting stone
DELETE FROM `gameobject` WHERE `id`=193166 and `map`=0;

--Recover meeting stone requirements
DELETE FROM `gameobject_template` WHERE entry=193166;
INSERT INTO `gameobject_template`
(`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`,
`size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`,
`Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`,
`Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`,
`AIName`, `ScriptName`, `VerifiedBuild`) 
VALUES 
(193166,23,5492,'Meeting Stone','','','',0.75,15,255,3456,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',12340);

-- Recover Echoes of War (QuestID: 9003)
UPDATE `quest_template` SET `RequiredNpcOrGoCount3` = 5 WHERE (`ID` = 9033);

-- Disable T3 turn in Quests
INSERT INTO `disables` VALUES 
(1,9034,0,'','','Deprecated quest: Dreadnaught Breastplate'),
(1,9036,0,'','','Deprecated quest: Dreadnaught Legplates'),
(1,9037,0,'','','Deprecated quest: Dreadnaught Helmet'),
(1,9038,0,'','','Deprecated quest: Dreadnaught Pauldrons'),
(1,9039,0,'','','Deprecated quest: Dreadnaught Sabatons'),
(1,9040,0,'','','Deprecated quest: Dreadnaught Gauntlets'),
(1,9041,0,'','','Deprecated quest: Dreadnaught Waistguard'),
(1,9042,0,'','','Deprecated quest: Dreadnaught Bracers'),
(1,9043,0,'','','Deprecated quest: Redemption Tunic'),
(1,9044,0,'','','Deprecated quest: Redemption Legguards'),
(1,9046,0,'','','Deprecated quest: Redemption Spaulders'),
(1,9047,0,'','','Deprecated quest: Redemption Boots'),
(1,9048,0,'','','Deprecated quest: Redemption Handguards'),
(1,9049,0,'','','Deprecated quest: Redemption Girdle'),
(1,9050,0,'','','Deprecated quest: Redemption Wristguards'),
(1,9054,0,'','','Deprecated quest: Cryptstalker Tunic'),
(1,9055,0,'','','Deprecated quest: Cryptstalker Legguards'),
(1,9056,0,'','','Deprecated quest: Cryptstalker Headpiece'),
(1,9057,0,'','','Deprecated quest: Cryptstalker Spaulders'),
(1,9058,0,'','','Deprecated quest: Cryptstalker Boots'),
(1,9059,0,'','','Deprecated quest: Cryptstalker Handguards'),
(1,9060,0,'','','Deprecated quest: Cryptstalker Girdle'),
(1,9061,0,'','','Deprecated quest: Cryptstalker Wristguards'),
(1,9068,0,'','','Deprecated quest: Earthshatter Tunic'),
(1,9069,0,'','','Deprecated quest: Earthshatter Legguards'),
(1,9070,0,'','','Deprecated quest: Earthshatter Headpiece'),
(1,9071,0,'','','Deprecated quest: Earthshatter Spaulders'),
(1,9072,0,'','','Deprecated quest: Earthshatter Boots'),
(1,9073,0,'','','Deprecated quest: Earthshatter Handguards'),
(1,9074,0,'','','Deprecated quest: Earthshatter Girdle'),
(1,9075,0,'','','Deprecated quest: Earthshatter Wristguards'),
(1,9077,0,'','','Deprecated quest: Bonescythe Breastplate'),
(1,9078,0,'','','Deprecated quest: Bonescythe Legplates'),
(1,9079,0,'','','Deprecated quest: Bonescythe Helmet'),
(1,9080,0,'','','Deprecated quest: Bonescythe Pauldrons'),
(1,9081,0,'','','Deprecated quest: Bonescythe Sabatons'),
(1,9082,0,'','','Deprecated quest: Bonescythe Gauntlets'),
(1,9083,0,'','','Deprecated quest: Bonescythe Waistguard'),
(1,9084,0,'','','Deprecated quest: Bonescythe Bracers'),
(1,9086,0,'','','Deprecated quest: Dreamwalker Tunic'),
(1,9087,0,'','','Deprecated quest: Dreamwalker Legguards'),
(1,9088,0,'','','Deprecated quest: Dreamwalker Headpiece'),
(1,9089,0,'','','Deprecated quest: Dreamwalker Spaulders'),
(1,9090,0,'','','Deprecated quest: Dreamwalker Boots'),
(1,9091,0,'','','Deprecated quest: Dreamwalker Handguards'),
(1,9092,0,'','','Deprecated quest: Dreamwalker Girdle'),
(1,9093,0,'','','Deprecated quest: Dreamwalker Wristguards'),
(1,9095,0,'','','Deprecated quest: Frostfire Robe'),
(1,9096,0,'','','Deprecated quest: Frostfire Leggings'),
(1,9097,0,'','','Deprecated quest: Frostfire Circlet'),
(1,9098,0,'','','Deprecated quest: Frostfire Shoulderpads'),
(1,9099,0,'','','Deprecated quest: Frostfire Sandals'),
(1,9100,0,'','','Deprecated quest: Frostfire Gloves'),
(1,9101,0,'','','Deprecated quest: Frostfire Belt'),
(1,9102,0,'','','Deprecated quest: Frostfire Bindings'),
(1,9103,0,'','','Deprecated quest: Plagueheart Robe'),
(1,9104,0,'','','Deprecated quest: Plagueheart Leggings'),
(1,9105,0,'','','Deprecated quest: Plagueheart Circlet'),
(1,9106,0,'','','Deprecated quest: Plagueheart Shoulderpads'),
(1,9107,0,'','','Deprecated quest: Plagueheart Sandals'),
(1,9108,0,'','','Deprecated quest: Plagueheart Gloves'),
(1,9109,0,'','','Deprecated quest: Plagueheart Belt'),
(1,9110,0,'','','Deprecated quest: Plagueheart Bindings'),
(1,9111,0,'','','Deprecated quest: Robe of Faith'),
(1,9112,0,'','','Deprecated quest: Leggings of Faith'),
(1,9113,0,'','','Deprecated quest: Circlet of Faith'),
(1,9114,0,'','','Deprecated quest: Shoulderpads of Faith'),
(1,9115,0,'','','Deprecated quest: Sandals of Faith'),
(1,9116,0,'','','Deprecated quest: Gloves of Faith'),
(1,9117,0,'','','Deprecated quest: Belt of Faith'),
(1,9118,0,'','','Deprecated quest: Bindings of Faith');
