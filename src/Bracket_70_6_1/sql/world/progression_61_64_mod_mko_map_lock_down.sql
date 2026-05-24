-- Remove Quel'Danas map lock restriction when downgrading from TBC late phase
DELETE FROM `mod_mko_map_lock` WHERE `mapId` = 530;
