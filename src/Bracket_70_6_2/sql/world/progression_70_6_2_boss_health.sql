-- Sunwell Plateau Boss Health Adjustments
-- Bracket 70_6_2 (Sunwell Plateau, Arena Season 4)

-- Boss
-- Kalecgos (HealthModifier=332.5 -> 498.75)
UPDATE `creature_template` SET `HealthModifier` = 498.75 WHERE (`entry` = 24850);

-- Brutallus (HealthModifier=968.8 -> 1453.2)
UPDATE `creature_template` SET `HealthModifier` = 1453.2 WHERE (`entry` = 24882);

-- Lady Sacrolash (HealthModifier=332.5 -> 498.75)
UPDATE `creature_template` SET `HealthModifier` = 498.75 WHERE (`entry` = 25165);

-- Grand Warlock Alythess (HealthModifier=332.5 -> 498.75)
UPDATE `creature_template` SET `HealthModifier` = 498.75 WHERE (`entry` = 25166);

-- M'uru (HealthModifier=252 -> 378)
UPDATE `creature_template` SET `HealthModifier` = 378 WHERE (`entry` = 25741);

-- Entropius (HealthModifier=189 -> 283.5)
UPDATE `creature_template` SET `HealthModifier` = 283.5 WHERE (`entry` = 25840);

-- Kil'jaeden (HealthModifier=1540 -> 2310)
UPDATE `creature_template` SET `HealthModifier` = 2310 WHERE (`entry` = 25315);
