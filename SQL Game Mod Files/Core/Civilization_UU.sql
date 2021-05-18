/*
	Civilization Unique Unit

	Please note: the unique unit configured here replaces an existing unit in the 'food-chain' - which is the case for the majority of unique units that are included in the base game.

	It is, however, not required that a unique unit replaces an existing unit - I can provide an alternative set of code that showcases a unique unit that does not replace, should that be useful.
	
	Authors: MC
*/

-----------------------------------------------
-- Types

-- This inserts the Unique Unit reference into the primary Data Types table as a recognised trait. This is mandatory, if configuring a custom trait for your civilization. The string listed under 'Type' must be used throughout the mod when referring to the TraitType. In addition, we are inserting the Unit itself (UNIT_WEREJAGUAR) and defining the UnitAbility (ABILITY_WEREJAGUAR), which is then tied to this unit (and no others).

-- The standard naming convention follows: TRAIT_CIVILIZATION_UNIQUEUNITNAME

-- Configuring a Unique Unit for your custom civilization is entirely optional, but it is typically considered appropriate for balance to configure at least one, such that your custom civilization matches those from the base games in terms of complexity, both for flavour and gameplay balance (in my opinion).
-----------------------------------------------	
	
INSERT INTO Types
		(Type,										Kind		)
VALUES	('TRAIT_CIVILIZATION_WEREJAGUAR',		'KIND_TRAIT'	),
		('UNIT_WEREJAGUAR',						'KIND_UNIT'		),
		('ABILITY_WEREJAGUAR',					'KIND_ABILITY'	);

-----------------------------------------------
-- Tags

-- Certain game functions are aligned to groups of units (known as classes), rather than the individual unit-types themselves. For this reason, here we define the class (CLASS_WEREJAGUAR) - we will later associate the unit to this class (as the only unit of that class) but also the UnitAbility to that same class. The below table INSERT paves the way for the special ability to be applied to our custom unit.
-----------------------------------------------	
	
INSERT INTO Tags
		(Tag,						Vocabulary		)
VALUES	('CLASS_WEREJAGUAR',		'ABILITY_CLASS'	);

-----------------------------------------------
-- TypeTags

-- As mentioned above, we now link the Unit itself (UNIT_WEREJAGUAR) to our newly-defined class (CLASS_WEREJAGUAR). The second set of values associate the newly-defined Unit Ability (ABILITY_WEREJAGUAR) to all objects within that same class (CLASS_WEREJAGUAR).

-- The second INSERT function ensures our new Unit (UNIT_WEREJAGUAR) inherits the classes that the UNIT_SPEARMAN already has configured. This ensures that groups to which the UNIT_SPEARMAN belongs, the UNIT_WEREJAGUAR also belongs. This ensures integration with other Unit Abilities and identifications and allows for a cohesive replacement.
-----------------------------------------------		

INSERT INTO TypeTags
		(Type,					Tag					)
VALUES	('UNIT_WEREJAGUAR',		'CLASS_WEREJAGUAR'	),
		('ABILITY_WEREJAGUAR',	'CLASS_WEREJAGUAR'	);

INSERT INTO TypeTags (Type,		Tag)
SELECT 	'UNIT_WEREJAGUAR',	Tag
FROM 	TypeTags
WHERE 	Type = 'UNIT_WARRIOR';

-----------------------------------------------
-- Traits

-- With the TraitType defined (above), the below then inserts it into the overall Traits table. This allows it to exist in its own right, alongside other TraitType elements and ties it to the locally-referenced Name and Description text strings that name and describe the trait, respectively.
-----------------------------------------------
		
INSERT INTO Traits
		(TraitType,							Name,							Description							)
VALUES	('TRAIT_CIVILIZATION_WEREJAGUAR',	'LOC_UNIT_WEREJAGUAR_NAME',		'LOC_UNIT_WEREJAGUAR_DESCRIPTION'	);

-----------------------------------------------
-- CivilizationTraits

-- This defines the civilization to which the TraitType is applied (i.e. which civilization gets the Unique Unit). This is a simple matter of referencing the custom CivilizationType defined in Civilization_Config.sql and using the TraitType defined in this document.
-----------------------------------------------
		
INSERT INTO CivilizationTraits
		(CivilizationType,				TraitType							)
VALUES	('CIVILIZATION_MC_OLMEC',		'TRAIT_CIVILIZATION_WEREJAGUAR'		);

-----------------------------------------------
-- Units

-- The below defines the core behaviour/configuration of our custom Unit. This is where we instruct the game to ensure it is unique (by setting the TraitType value), as well as tie together the various locally-defined elements in this mod (UnitType, Name, Description).

-- You will note that the full set of values is populated via a hybrid of methods - some are taken from the UNIT_SPEARMAN that UNIT_WEREJAGUAR replaces, whilst others are brand-new values that we've defined in this mod.

-- For integer values, it is possible to set a relative value by using simple mathematical operators - you'll note that we do this for the unit Cost and the Combat (Strength). What we're saying here is that the UNIT_WEREJAGUAR has a Cost that is 15 higher than the UNIT_SPEARMAN, but it also has a Combat Strength of 5 more.

-- It is, of course, possible to explicitly define every value - in which case, the SELECT command would be replaced by VALUES; whilst the FROM and WHERE commands can be removed. As a syntax note: remember that if you use VALUES, you will need to use open ( and close ) parentheses to achieve valid code. The SELECT command does not require these, hence they are not present here.

-----------------------------------------------	
	
INSERT INTO Units	(
		UnitType,
		Name,
		Description,
		TraitType,
		BaseMoves,
		Cost,
		PurchaseYield,
		AdvisorType,
		Combat,
		RangedCombat,
		Range,
		BaseSightRange,
		ZoneOfControl,
		Domain,
		FormationClass,
		PromotionClass,
		Maintenance,
		MandatoryObsoleteTech,
		PrereqTech,
		PrereqCivic
		)
SELECT	'UNIT_WEREJAGUAR',	-- UnitType
		'LOC_UNIT_WEREJAGUAR_NAME',	-- Name
		'LOC_UNIT_WEREJAGUAR_DESCRIPTION', -- Description
		'TRAIT_CIVILIZATION_WEREJAGUAR', -- TraitType
		BaseMoves + 5,
		Cost - 35,
		PurchaseYield,
		AdvisorType,
		Combat + 10,
		RangedCombat,
		Range,
		BaseSightRange,
		ZoneOfControl,
		Domain,
		FormationClass,
		PromotionClass,
		Maintenance,
		MandatoryObsoleteTech,
		PrereqTech,
		PrereqCivic
FROM	Units
WHERE	UnitType = 'UNIT_WARRIOR';

-----------------------------------------------
-- UnitUpgrades

-- This section defines the position in the UnitUpgrades chain that the custom UNIT_WEREJAGUAR fits into. For this mod, we are simply replacing the UNIT_SPEARMAN, so this ensures the continuity of the UNIT_SPEARMAN chain for the UNIT_WEREJAGUAR.
-----------------------------------------------
		
INSERT INTO UnitUpgrades (Unit,	UpgradeUnit)
SELECT 	'UNIT_WEREJAGUAR',	UpgradeUnit
FROM 	UnitUpgrades
WHERE	Unit = 'UNIT_WARRIOR';

-----------------------------------------------
-- UnitAiInfos

-- UnitAiInfos are used to help mould the AI behaviour for Units. They essentially link each UnitType to one or more types of AI behaviour - such as exploration, melee combat or ranged combat.

-- In the below example, we are simply inheriting the UNIT_SPEARMAN behaviour for our UNIT_WEREJAGUAR.

-- A full list of UnitAiType entries can be found in Units.xml. A search for the string 'UnitAiType' will find the full list.
-----------------------------------------------
		
INSERT INTO UnitAiInfos (UnitType,	AiType)
SELECT 	'UNIT_WEREJAGUAR',		AiType
FROM 	UnitAiInfos
WHERE 	UnitType = 'UNIT_WARRIOR';
		
-----------------------------------------------
-- UnitReplaces

-- This command tells the game about the replacement itself - this ensures that for any civilization to whom the UNIT_WEREJAGUAR is available (which is only this custom civilization, thanks to the link to the TraitType), the UNIT_SPEARMAN will not be available; replaced instead by the UNIT_WEREJAGUAR.
-----------------------------------------------
		
INSERT INTO UnitReplaces
		(CivUniqueUnitType,		ReplacesUnitType	)
VALUES	('UNIT_WEREJAGUAR',		'UNIT_WARRIOR'		);

-----------------------------------------------
-- UnitAbilities

-- Whilst we inserted the UnitAbilityType into the core data table earlier in this document, we need the below to allow it to exist in its own right, alongside other UnitAbilityType elements. This also ties it to the locally-referenced Name and Description text strings that name and describe the Unit Ability, respectively.

-- It is worth noting that applying an ability to the unit is optional - it's an extra layer on top of any 'standard' variables that are common to all units. This particular ability enables this template to showcase the way that a Modifier can be used to change the effectiveness of our custom unit in certain situations.
-----------------------------------------------

INSERT INTO UnitAbilities
		(UnitAbilityType,			Name,								Description					)
VALUES	('ABILITY_WEREJAGUAR',		'LOC_UNIT_WEREJAGUAR_NAME',			'LOC_ABILITY_WEREJAGUAR'	);


INSERT INTO UnitAbilityModifiers	
		(UnitAbilityType,									ModifierId								)
VALUES	('ABILITY_WEREJAGUAR',								'MODIFIER_WEREJAGUAR_NEIGHBOUR_COMBAT'	);
-----------------------------------------------
-- Modifiers

-- If you've been following this in order, you may be well-versed in Modifiers by this point.

-- This particular Modifier is a little different - as it references an OwnerRequirementSetId. This instructs the game to implement this Modifier only when the requirements are met - but these requirement pertain to an OwnerRequirementSetId. This ensures it is only when the custom civilization, that has the UNIT_WEREJAGUAR, is in a Golden Age will the effect apply.
-----------------------------------------------
	
INSERT INTO Modifiers	
		(ModifierId,									ModifierType,												SubjectRequirementSetId							)
VALUES	('MODIFIER_WEREJAGUAR_NEIGHBOUR_COMBAT',			'MODIFIER_SINGLE_UNIT_ATTACH_MODIFIER',					'WEREJAGUAR_PLOT_IS_WEREJAGUAR_REQUIREMENTS'	),
		('MODIFIER_WEREJAGUAR_NEIGHBOUR_COMBAT_MOD',		'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',					Null											);

-----------------------------------------------
-- ModifierArguments

-- This is fairly straightforward - it defines the values that change when the Modifier is applied. As with other Modifiers, these values are used in conjunction with the ModifierType (referenced above). In this case, we're instructing the Amount to increase 5. A negative value would reduce the Combat Strength. The fact that this is targeting the Combat Strength value at all is derived from the ModifierType. This is what makes the ModifierType so important - this is one of the key parts of the game where the entries you configure are not all explicitly listed. In isolation, the below ModifierArgument could mean (or apply to) a number of things.
-----------------------------------------------

INSERT INTO ModifierArguments		
		(ModifierId,										Name,						Value											)
VALUES	('MODIFIER_WEREJAGUAR_NEIGHBOUR_COMBAT',			'ModifierId',				'MODIFIER_WEREJAGUAR_NEIGHBOUR_COMBAT_MOD'		),
		('MODIFIER_WEREJAGUAR_NEIGHBOUR_COMBAT_MOD',		'Amount',					50												);


INSERT INTO RequirementSets
		(RequirementSetId,									RequirementSetType						)
VALUES	('WEREJAGUAR_PLOT_IS_WEREJAGUAR_REQUIREMENTS',		'REQUIREMENT_TEST_ALL'					);


INSERT INTO RequirementSetRequirements
		(RequirementSetId,									RequirementId							)
VALUES	('WEREJAGUAR_PLOT_IS_WEREJAGUAR_REQUIREMENTS',		'REQUIRES_UNIT_NEXT_TO_WEREJAGUAR'		);


INSERT INTO Requirements
		(RequirementId,								RequirementType													)
VALUES	('REQUIRES_UNIT_NEXT_TO_WEREJAGUAR',		'REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TYPE_MATCHES'			);

INSERT INTO RequirementArguments
		(RequirementId,								Name,				Value					)
VALUES	('REQUIRES_UNIT_NEXT_TO_WEREJAGUAR',		'UnitType',			'UNIT_WARRIOR'		);

-----------------------------------------------
-- ModifierStrings

-- The final element of the Unique Unit gameplay configuration simply adds the tooltip-style preview that describes this unit's special ability.

-- We tie this to the Modifier, as the ability is triggered based on certain criteria being met. This is essentially what makes it an 'ability' rather than a staple part of that unit. Other ModifierStrings can be cross-referenced from UnitAbilities.xml.
-----------------------------------------------

INSERT INTO ModifierStrings
		(ModifierId,									Context,		Text						)
VALUES	('MODIFIER_WEREJAGUAR_NEIGHBOUR_COMBAT',		'Preview',		'LOC_ABILITY_WEREJAGUAR'	);