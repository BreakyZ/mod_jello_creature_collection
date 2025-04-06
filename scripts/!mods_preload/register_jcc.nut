::ModJelloCreatureCollection <- {
	ID = "mod_jello_creature_collection",
	Name = "Jello's Creature Collection",
	Version = "1.0.0"
};

::ModJelloCreatureCollection.HooksMod <- ::Hooks.register(::ModJelloCreatureCollection.ID, ::ModJelloCreatureCollection.Version, ::ModJelloCreatureCollection.Name);
::ModJelloCreatureCollection.HooksMod.require("mod_msu >= 1.2.6");

// both "require" and "conflictWith" function has adaptive number parameter so you can add as many as you wish
// instead adding many parametersm you can combine all into an array as a single parameter.

// add which mods are needed to run this mod
// is the same as ::Mod_Necro.HooksMod.require(["mod_msu >= 1.2.6", "mod_legends>= 18.1.0"]);

// use this too tell which mods may causes conflict with this mod, i use ptr are a quick reference
//::Mod_Necro.HooksMod.conflictWith("mod_legends_PTR");


// like above you can add as many parameters to determine the queue order of the mod before adding the parameter to run the callback function. 
// ::ModJelloCreatureCollection.HooksMod.queue(">mod_msu", function()
// {
// 	// define mod class of this mod
// 	::ModJelloCreatureCollection.Mod <- ::MSU.Class.Mod(::ModJelloCreatureCollection.ID, ::ModJelloCreatureCollection.Version, ::ModJelloCreatureCollection.Name);

// 	// ::ModJelloCreatureCollection.Mod.Registry.addModSource(::MSU.System.Registry.ModSourceDomain.GitHub, "https://github.com/BreakyZ/mod_unarmed_combat");
// 	// ::ModJelloCreatureCollection.Mod.Registry.setUpdateSource(::MSU.System.Registry.ModSourceDomain.GitHub);
// 	// if (!("Is_SSU_Exist" in this.getroottable())) ::Is_SSU_Exist <- ::mods_getRegisteredMod("mod_sellswords") != null;

// 	// load hook files
// 	::include("mod_unarmed_combat/load.nut");
// }, ::Hooks.QueueBucket.Normal);