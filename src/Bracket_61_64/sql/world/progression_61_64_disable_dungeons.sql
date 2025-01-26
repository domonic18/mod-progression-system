
-- 65-69 level range
DELETE FROM `disables` WHERE `entry` IN (269, 556, 558, 560);
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES 
(2, 269, 3, "", "", "The Black Morass"),
(2, 556, 3, "", "", "Sethekk Halls"),
(2, 558, 3, "", "", "Auchenai Crypts"),
(2, 560, 3, "", "", "The Escape from Durnholde");

-- 70 level range
DELETE FROM `disables` WHERE `entry` IN (532, 534, 540, 544, 545, 548, 550, 552, 553, 554, 555, 564, 565, 568, 580, 585);
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES 
(2, 532, 1, "", "", "Karazhan"),
(2, 534, 1, "", "", "Hyjal Summit"),
(2, 540, 3, "", "", "The Shattered Halls"),
(2, 544, 1, "", "", "Magtheridon's Lair"),
(2, 545, 3, "", "", "The Steamvault"),
(2, 548, 1, "", "", "Serpentshrine Cavern"),
(2, 550, 1, "", "", "The Eye"),
(2, 552, 3, "", "", "The Arcatraz"),
(2, 553, 3, "", "", "The Botanica"),
(2, 554, 3, "", "", "The Mechanar"),
(2, 555, 3, "", "", "Shadow Labyrinth"),
(2, 564, 1, "", "", "Black Temple"),
(2, 565, 1, "", "", "Gruul's Lair"),
(2, 568, 1, "", "", "Zul'Aman"),
(2, 580, 1, "", "", "Sunwell Plateau"),
(2, 585, 3, "", "", "Magisters' Terrace");

-- 71-74 level range
DELETE FROM `disables` WHERE `entry` IN (574, 576, 600, 601, 619);
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES 
(2, 574, 3, "", "", "Utgarde Keep"),
(2, 576, 3, "", "", "The Nexus"),
(2, 600, 3, "", "", "Drak’Tharon Keep"),
(2, 601, 3, "", "", "Azjol-Nerub"),
(2, 619, 3, "", "", "Ahn’kahet: The Old Kingdom");

-- 75-79 level range
DELETE FROM `disables` WHERE `entry` IN (575, 578, 595, 599, 602, 604, 608);
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES 
(2, 575, 3, "", "", "Utgarde Pinnacle"),
(2, 578, 3, "", "", "The Oculus"),
(2, 595, 3, "", "", "The Culling of Stratholme"),
(2, 599, 3, "", "", "Halls of Stone"),
(2, 602, 3, "", "", "Halls of Lightning"),
(2, 604, 3, "", "", "Gundrak"),
(2, 608, 3, "", "", "Violet Hold");

-- 80 level range
DELETE FROM `disables` WHERE `entry` IN (249, 533, 603, 615, 616, 624, 631, 632, 649, 650, 658, 668, 724, 13276);
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES 
(2, 249, 3, "", "", "Onyxia Lair"),
(4, 13276, 0, "", "", "Onyxia Lair LK Statistic"),
(2, 533, 3, "", "", "Naxxramas"),
(2, 603, 3, "", "", "Ulduar"),
(2, 615, 3, "", "", "The Obsidian Sanctum"),
(2, 616, 3, "", "", "The Eye of Eternity"),
(2, 624, 3, "", "", "Vault of Archavon"),
(2, 631, 15, "", "", "Icecrown Citadel"),
(2, 632, 3, "", "", "The Forge of Souls"),
(2, 649, 15, "", "", "Trial of The Crusader"),
(2, 650, 3, "", "", "Trial of the Champion"),
(2, 658, 3, "", "", "Pit of Saron"),
(2, 668, 3, "", "", "Halls of Reflection"),
(2, 724, 15, "", "", "The Ruby Sanctum");
