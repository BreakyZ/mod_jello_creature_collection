local max = 0;

foreach( key, value in this.Const.EntityType )
{
	if (typeof value == "integer" && value > max)
	{
		max = value;
	}
}

this.Const.Strings.PerchtNames <- [
	"Beelzebub",
	"Corvus",
	"Adramahlihk",
	"Duma",
	"Dagon",
	"Molag",
	"Barbatos",
	"Astaroth",
	"Nergal",
	"Ereshkigal",
	"Anankos",
	"Baphomet",
	"Alastor",
	"Gaucher",
	"Cambion",
	"Mammon",
	"Mephistopheles",
	"Grima",
	"Dagoth",
	"Belial",
	"Azazel",
	"Pan",
	"Samail",
	"Rubezahl",
	"Gil\'dan",
	"Kil\'jaeden",
	"Moloch",
	"Krampus"
];
this.Const.Strings.PerchtTitles <- [
	"the Harrier",
	"Bal",
	"the Great Horned One",
	"the Child Snatcher",
	"of the Black Sabbath",
	"the Maneater",
	"the Impaler",
	"Ash-Spitter",
	"Ur",
	"the Black",
	"Coal-Eyes",
	"the Raucous",
	"from Below",
	"the Black Bellows",
	"the Peeler",
	"the Anathema",
	"the King in Yellow",
	"the Old Man of the Mountain",
	"Sack-Stuffer",
	"Gore-Spiller",
	"of the Underworld",
	"the Boogeyman",
	"of the Dark",
	"the Bump in the Night"
];
this.Const.World.LocationNames.PerchtClearing <- [
	"Fortified Den",
	"Hell\'s Gate",
	"Eerie Clearing",
	"Gathering Stones",
	"Herdstones",
	"Spirit\'s Well",
	"Summoning Stones",
	"Bone-Strewn Hellhole",
	"Field of Delirium",
	"Ill-Omened Clearing",
	"Hellspawn\'s Den",
	"Sacrifice Rock",
	"Bone-Strewn Clearing",
	"Sealing Stones",
	"Pale Glade",
	"Silent Copse",
	"Wretched Clearing",
	"Abandoned Hunter\'s Camp",
	"Hunter\'s End",
	"Percht\'s Glade",
	"Uncharted Clearing",
	"Haunted Moor",
	"Den of Coal",
	"Den of Sulfur",
	"Huntsman\'s Copse",
	"Huntsman\'s End"
];
this.Const.World.LocationNames.PerchtCastle <- [
	"Child-Eater Hall",
	"Hall of Hell",
	"Greenbeard\'s Walls"
];

this.Const.AI.Agent.ID.Percht <- "agent.percht";
max = ++max;
this.Const.EntityType.Percht <- max;
this.Const.Strings.EntityName.push("Percht");
this.Const.Strings.EntityNamePlural.push("Perchts");
this.Const.EntityIcon.push("percht_orientation");
this.Const.Tactical.Actor.Percht <- {
	XP = 355,
	ActionPoints = 10,
	Hitpoints = 10,//350,
	Bravery = 140,
	Stamina = 140,
	MeleeSkill = 70,
	RangedSkill = 60,
	MeleeDefense = 10,
	RangedDefense = 10,
	Initiative = 90,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	FatigueRecoveryRate = 25,
	Vision = 7,
	Armor = [
		66,
		66
	]
};
this.Const.World.Spawn.Troops.Percht <- {
	ID = this.Const.EntityType.Percht,
	Variant = 1,
	Strength = 35,
	Cost = 40,
	Row = 2,
	Script = "scripts/entity/tactical/enemies/percht",
	NameList = this.Const.Strings.PerchtNames,
	TitleList = this.Const.Strings.PerchtTitles
};
this.Const.World.Spawn.Percht <- [
	{
		Body = "figure_percht_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Percht,
				Num = 1
			}
		]
	},
	{
		Body = "figure_percht_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Percht,
				Num = 2
			}
		]
	},
	{
		Body = "figure_percht_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Percht,
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

this.calculateCosts(this.Const.World.Spawn.Percht);

