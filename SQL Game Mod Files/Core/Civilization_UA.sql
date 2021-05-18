/*
	Civilization Unique Ability
	Authors: MC
*/

-----------------------------------------------
-- Types

-- This inserts the Unique Ability reference into the primary Data Types table as a recognised trait. This is mandatory, if configuring a custom trait for your civilization. The string listed under 'Type' must be used throughout the mod when referring to the TraitType.

-- The standard naming convention follows: TRAIT_CIVILIZATION_TRAITNAME

-- Configuring a Unique Ability for your custom civilization is entirely optional, but it is typically considered appropriate for balance to configure one, such that your custom civilization matches those from the base games in terms of complexity, both for flavour and gameplay balance (in my opinion).
-----------------------------------------------

INSERT INTO	Types
		(Type,												Kind			)
VALUES	('TRAIT_CIVILIZATION_LET_THE_GODS_FEED_US',			'KIND_TRAIT'	);

-----------------------------------------------
-- Traits

-- With the TraitType defined (above), the below then inserts it into the overall Traits table. This allows it to exist in its own right, alongside other TraitType elements and ties it to the locally-referenced Name and Description text strings that name and describe the trait, respectively.

-----------------------------------------------

INSERT INTO	Traits	
		(TraitType,										Name,													Description													)
VALUES	('TRAIT_CIVILIZATION_LET_THE_GODS_FEED_US',		'LOC_TRAIT_CIVILIZATION_LET_THE_GODS_FEED_US_NAME',		'LOC_TRAIT_CIVILIZATION_LET_THE_GODS_FEED_US_DESCRIPTION'	);
		
-----------------------------------------------
-- CivilizationTraits

-- This defines the civilization to which the TraitType is applied (i.e. which civilization gets the Unique Ability). This is a simple matter of referencing the custom CivilizationType defined in Civilization_Config.sql and using the TraitType defined at the head of this document.
-----------------------------------------------

INSERT INTO	CivilizationTraits
		(CivilizationType,				TraitType									)
VALUES	('CIVILIZATION_MC_OLMEC',		'TRAIT_CIVILIZATION_LET_THE_GODS_FEED_US'	);

-----------------------------------------------
-- TraitModifiers

-- The below entry - or entries, in this example case - tie the effective modifiers to the TraitType. A modifier is the top-level item that instructs the game to perform a deviation away from the base ruleset in some way. The possibilities are endless, so these notes make no attempt to cover what can be done - only to instruct against the logic, step by step.

-- There are numerous ways to unfurl the logic that follows below. For me, the most effective way was a combination of following the base game data, trial and error and (admittedly) a healthy dose of asking for help/

-- The starting point to search in the base game XML is to look-up an existing CivilizationType (e.g. CIVILIZATION_AMERICA) and note their TRAIT_CIVILIZATION_ that is neither the Unique Infrastructure nor the Unique Unit. In America's case, it is TRAIT_CIVILIZATION_FOUNDING_FATHERS. Searching that will lead you to the ModifierId entry (or entries) that grant the various bonuses associated with that TraitType. You can apply this logic to do a cascading look-up all the way down, as long as you appreciate that you must follow every 'route' down which you are led to build up a picture of all of the cross-references/dependencies.

-----------------------------------------------

INSERT INTO	TraitModifiers	
		(TraitType,										ModifierId											)
VALUES	('TRAIT_CIVILIZATION_LET_THE_GODS_FEED_US',		'MODIFIER_LET_THE_GODS_FEED_US_SHRINE_YIELD'		),
		('TRAIT_CIVILIZATION_LET_THE_GODS_FEED_US',		'MODIFIER_LET_THE_GODS_FEED_US_TEMPLE_YIELD'		);

-----------------------------------------------
-- EmergencyBuffs

-- These are sections I have ommitted from my mods as I do not yet understand them. They concern boosts that the custom civilization would get when it is in a state of emergency in-game.
-----------------------------------------------

-----------------------------------------------
-- EmergencyRewards

-- These are sections I have ommitted from my mods as I do not yet understand them. They concern boosts that the custom civilization would get when it is in a state of emergency in-game.
-----------------------------------------------

-----------------------------------------------
-- Modifiers

-- This section defines, for each of your modifiers, the type of modifier it is and the conditions under which it is applied.

-- The ModifierType is important - it governs the sphere of application of the effect(s) in question. It does this by having a defined pair of values linked to it - known as a CollectionType and an EffectType. The CollectionType instructs the game on which elements/items (all civilizations, one specific civilization, all cities of one civilization, etc) to apply the modifier, whilst the EffectType instructs the game as to what change to apply.

-- RunOnce and Permanent are boolean values that instruct the game on the points at which the modifier is, or can be, applied. There is an excellent guide available via CivFanatics that explains these concepts (and more) that I highly recommend:

-- https://forums.civfanatics.com/resources/using-modifiers-chapter-1-creating-and-attaching-modifiers.25683/ --
-----------------------------------------------

INSERT INTO	Modifiers
		(ModifierId,										ModifierType,											RunOnce,		Permanent	)
VALUES	('MODIFIER_LET_THE_GODS_FEED_US_SHRINE_YIELD',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	0,				1			),
		('MODIFIER_LET_THE_GODS_FEED_US_TEMPLE_YIELD',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	0,				1			);

-----------------------------------------------
-- ModifierArguments

-- The below entries define the specific deviations from the base game ruleset that are applied when the modifier is executed and attached to the pertinent items.

-- The ModifierType governs the actual 'values' that are accepted within the Name column, which in turn governs the values that are accepted within the value column. I expect the below example data will make those connections clear.

-- Side-note: the below implementation can be achieved using a single ModifierId (rather than one for each BuildingType), given the effect is the same. The Value for 'BuildingType' can, in fact, include multiple buildings, comma-separated:

-- VALUES	('MODIFIER_LET_THE_GODS_FEED_US_SHRINE_YIELD',			'BuildingType',					'BUILDING_SHRINE,BUILDING_TEMPLE'		),
--			('MODIFIER_LET_THE_GODS_FEED_US_SHRINE_YIELD',			'YieldType',					'YIELD_FOOD'							),
--			('MODIFIER_LET_THE_GODS_FEED_US_SHRINE_YIELD',			'Amount',						'2'										),

-- Doing it this way would eliminate the need to insert two new Modifiers, as well as the need to attach those two Modifiers to the same TraitType. I've left this as it is to serve as an illustrative example of how to attach multiple Modifiers to a single Trait.
-----------------------------------------------

INSERT INTO	ModifierArguments
		(ModifierId,											Name,							Value									)
VALUES	('MODIFIER_LET_THE_GODS_FEED_US_SHRINE_YIELD',			'BuildingType',					'BUILDING_MONUMENT'						),
		('MODIFIER_LET_THE_GODS_FEED_US_SHRINE_YIELD',			'YieldType',					'YIELD_CULTURE'							),
		('MODIFIER_LET_THE_GODS_FEED_US_SHRINE_YIELD',			'Amount',						'5'										),
		('MODIFIER_LET_THE_GODS_FEED_US_TEMPLE_YIELD',			'BuildingType',					'BUILDING_TEMPLE'						),
		('MODIFIER_LET_THE_GODS_FEED_US_TEMPLE_YIELD',			'YieldType',					'YIELD_FOOD'							),
		('MODIFIER_LET_THE_GODS_FEED_US_TEMPLE_YIELD',			'Amount',						'2'										);
