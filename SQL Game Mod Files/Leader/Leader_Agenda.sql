/*
	Leader Agendas
	Authors: MC
*/

-----------------------------------------------
-- Types
-----------------------------------------------

INSERT INTO Types
			(Type,							Kind			)
VALUES		('TRAIT_AGENDA_MC_PO_NGBE',		'KIND_TRAIT'	);

-----------------------------------------------
-- Agendas
-----------------------------------------------

INSERT INTO Agendas
			(AgendaType,			Name,							Description								)
VALUES 		('AGENDA_MC_PO_NGBE',	'LOC_AGENDA_MC_PO_NGBE_NAME',	'LOC_AGENDA_MC_PO_NGBE_DESCRIPTION'		);

-----------------------------------------------
-- Traits
-----------------------------------------------

INSERT INTO Traits				
			(TraitType,						Name,							Description								)
VALUES		('TRAIT_AGENDA_MC_PO_NGBE',		'LOC_AGENDA_MC_PO_NGBE_NAME',	'LOC_AGENDA_MC_PO_NGBE_DESCRIPTION'		);

-----------------------------------------------
-- AgendaTraits
-----------------------------------------------

INSERT INTO AgendaTraits
			(AgendaType,			TraitType					)
VALUES 		('AGENDA_MC_PO_NGBE',	'TRAIT_AGENDA_MC_PO_NGBE'	);

-----------------------------------------------
-- HistoricalAgendas
-----------------------------------------------

INSERT INTO HistoricalAgendas
			(LeaderType,			AgendaType				)
VALUES 		('LEADER_MC_PO_NGBE',	'AGENDA_MC_PO_NGBE'		);

-----------------------------------------------
-- ExclusiveAgendas
-----------------------------------------------

INSERT INTO ExclusiveAgendas
			(AgendaOne,				AgendaTwo				)
VALUES 		('AGENDA_MC_PO_NGBE',	'AGENDA_EXPLORER'		),
			('AGENDA_MC_PO_NGBE',	'AGENDA_DEVOUT'			),
			('AGENDA_MC_PO_NGBE',	'AGENDA_WESTERNIZER'	);

-----------------------------------------------
-- TraitModifiers
-----------------------------------------------

INSERT INTO TraitModifiers
			(TraitType,						ModifierId							)
VALUES		('TRAIT_AGENDA_MC_PO_NGBE',	'AGENDA_MODIFIER_MC_PO_NGBE_UNHAPPY'	),
			('TRAIT_AGENDA_MC_PO_NGBE',	'AGENDA_MODIFIER_MC_PO_NGBE_HAPPY'		);
		
-----------------------------------------------
-- Modifiers
-----------------------------------------------

INSERT INTO Modifiers	
			(ModifierId,								ModifierType,									SubjectRequirementSetId			)
VALUES		('AGENDA_MODIFIER_MC_PO_NGBE_UNHAPPY',		'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	'REQSET_MC_PO_NGBE_UNHAPPY'		),
			('AGENDA_MODIFIER_MC_PO_NGBE_HAPPY',		'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	'REQSET_MC_PO_NGBE_HAPPY'		);

-----------------------------------------------	
-- ModifierStrings
-----------------------------------------------	
INSERT INTO ModifierStrings
			(ModifierId,								Context,	Text								)
VALUES		('AGENDA_MODIFIER_MC_PO_NGBE_UNHAPPY',		'Sample',	'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'	),
			('AGENDA_MODIFIER_MC_PO_NGBE_HAPPY',		'Sample',	'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'	);

-----------------------------------------------
-- ModifierArguments
-----------------------------------------------

INSERT INTO ModifierArguments
			(ModifierId,							Name,							Value												)
VALUES		('AGENDA_MODIFIER_MC_PO_NGBE_UNHAPPY',	'InitialValue',					-5													),
			('AGENDA_MODIFIER_MC_PO_NGBE_UNHAPPY',	'IncrementValue',				-1													),
			('AGENDA_MODIFIER_MC_PO_NGBE_UNHAPPY',	'IncrementTurns',				-10													),
			('AGENDA_MODIFIER_MC_PO_NGBE_UNHAPPY',	'MaxValue',						-25													),
			('AGENDA_MODIFIER_MC_PO_NGBE_UNHAPPY',	'StatementKey',					'LOC_DIPLO_WARNING_LEADER_MC_PO_NGBE_REASON_ANY'	),
			('AGENDA_MODIFIER_MC_PO_NGBE_UNHAPPY',	'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_MC_PO_NGBE_UNHAPPY'				),
	
			('AGENDA_MODIFIER_MC_PO_NGBE_HAPPY',	'InitialValue',					5													),
			('AGENDA_MODIFIER_MC_PO_NGBE_HAPPY',	'IncrementValue',				1													),
			('AGENDA_MODIFIER_MC_PO_NGBE_HAPPY',	'IncrementTurns',				10													),
			('AGENDA_MODIFIER_MC_PO_NGBE_HAPPY',	'MaxValue',						12													),
			('AGENDA_MODIFIER_MC_PO_NGBE_HAPPY',	'StatementKey',					'LOC_DIPLO_KUDO_LEADER_MC_PO_NGBE_REASON_ANY'		),
			('AGENDA_MODIFIER_MC_PO_NGBE_HAPPY',	'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_MC_PO_NGBE_HAPPY'				);
			
-----------------------------------------------
-- RequirementSets
-----------------------------------------------

INSERT INTO RequirementSets
			(RequirementSetId,				RequirementSetType			)
VALUES		('REQSET_MC_PO_NGBE_UNHAPPY',	'REQUIREMENTSET_TEST_ALL'	),
			('REQSET_MC_PO_NGBE_HAPPY',		'REQUIREMENTSET_TEST_ALL'	);

-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------

INSERT INTO RequirementSetRequirements
			(RequirementSetId,				RequirementId						)
VALUES		('REQSET_MC_PO_NGBE_UNHAPPY',	'REQUIRES_MAJOR_CIV_OPPONENT'		),
			('REQSET_MC_PO_NGBE_UNHAPPY',	'REQUIRES_MET_10_TURNS_AGO'			),
			('REQSET_MC_PO_NGBE_UNHAPPY',	'REQUIRES_HAS_LOW_FAITH'			),
			('REQSET_MC_PO_NGBE_HAPPY',		'REQUIRES_MAJOR_CIV_OPPONENT'		),
			('REQSET_MC_PO_NGBE_HAPPY',		'REQUIRES_MET_10_TURNS_AGO'			),
			('REQSET_MC_PO_NGBE_HAPPY',		'REQUIRES_HAS_HIGH_CULTURE'			),
			('REQSET_MC_PO_NGBE_HAPPY',		'REQUIRES_HAS_HIGH_SCIENCE'			);
