/*
	Leader Badge Colours
	Authors: MC
*/

-----------------------------------------------
-- PlayerColors

-- This assigns the civilization's colours to the leader - when selecting the leader, this will control the order in which the colour-combinations appear (with PrimaryColor and SecondaryColor representing the default values).

-- These eight colour references are locally-defined values, taken straight from Civilization_Colors.sql. Again, as we only have one leader, we simply match the order.
-----------------------------------------------

INSERT INTO	PlayerColors (Type, Usage, PrimaryColor, SecondaryColor, Alt1PrimaryColor, Alt1SecondaryColor, Alt2PrimaryColor, Alt2SecondaryColor, Alt3PrimaryColor, Alt3SecondaryColor )
VALUES	(
		'LEADER_MC_PO_NGBE',
		'Unique',
		'COLOR_MC_OLMEC_A_PRIMARY',
		'COLOR_MC_OLMEC_A_SECONDARY',
		'COLOR_MC_OLMEC_B_PRIMARY',
		'COLOR_MC_OLMEC_B_SECONDARY',
		'COLOR_MC_OLMEC_C_PRIMARY',
		'COLOR_MC_OLMEC_C_SECONDARY',
		'COLOR_MC_OLMEC_D_PRIMARY',
		'COLOR_MC_OLMEC_D_SECONDARY'
		);