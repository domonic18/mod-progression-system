-- Hide Shattered Sun Offensive NPCs and Vendors near Portal to Isle of Quel'Danas
UPDATE `creature` SET `phasemask` = 16384 WHERE `id1` IN (
26560 -- Exarch Naasun
);