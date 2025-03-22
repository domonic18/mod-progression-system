-- Recovery Zul Aman
DELETE FROM `disables` WHERE `entry` IN (568);
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES 
(2, 568, 1, "", "", "Zul'Aman");