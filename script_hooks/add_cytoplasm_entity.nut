local max = 0;

foreach( key, value in this.Const.EntityType )
{
	if (typeof value == "integer" && value > max)
	{
		max = value;
	}
}

this.Const.AI.Agent.ID.Cytoplasm <- "agent.cytoplasm";
max = ++max;
this.Const.EntityType.Cytoplasm <- max;
this.Const.Strings.EntityName.push("Cytoplasm");
this.Const.Strings.EntityNamePlural.push("Cytoplasms");
this.Const.EntityIcon.push("cytoplasm_small_orientation");
this.Const.Tactical.Actor.Cytoplasm <- {
	XP = 150,
	ActionPoints = 8,
	Hitpoints = 110,
	Bravery = 90,
	Stamina = 100,
	MeleeSkill = 65,
	RangedSkill = 60,
	MeleeDefense = 10,
	RangedDefense = 5,
	Initiative = 70,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	FatigueRecoveryRate = 25,
	Vision = 7,
	Armor = [
		0,
		0
	]
};
this.Const.World.Spawn.Troops.Cytoplasm <- {
	ID = this.Const.EntityType.Cytoplasm,
	Variant = 0,
	Strength = 35,
	Cost = 40,
	Row = 2,
	Script = "scripts/entity/tactical/enemies/cytoplasm"
};
this.Const.World.Spawn.Cytoplasm <- [
	{
		Body = "figure_Cytoplasm_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Cytoplasm,
				Num = 1
			}
		]
	},
	{
		Body = "figure_Cytoplasm_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Cytoplasm,
				Num = 2
			}
		]
	},
	{
		Body = "figure_Cytoplasm_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Cytoplasm,
				Num = 3
			}
		]
	}
];
function onCostCompare( _party1, _party2 )
{
	if (_party1.Cost < _party2.Cost)
	{
		return -1;
	}
	else if (_party1.Cost > _party2.Cost)
	{
		return 1;
	}

	return 0;
}

function calculateCosts( _parties )
{
	foreach( party in _parties )
	{
		party.Cost <- 0;

		foreach( troop in party.Troops )
		{
			party.Cost += troop.Type.Cost * troop.Num;
		}

		if (!("MovementSpeedMult" in party))
		{
			party.MovementSpeedMult <- 1.0;
		}

		if (!("VisibilityMult" in party))
		{
			party.VisibilityMult <- 1.0;
		}

		if (!("VisionMult" in party))
		{
			party.VisionMult <- 1.0;
		}
	}

	_parties.sort(this.onCostCompare);
}

this.calculateCosts(this.Const.World.Spawn.Cytoplasm);

