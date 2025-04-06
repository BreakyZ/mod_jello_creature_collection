::ModJelloCreatureCollection <- {
    ID = "mod_jellos_creature_collection",
    Name = "Jello's Creature Collection",
    Version = "1.0.0"
};

::ModJelloCreatureCollection.HooksMod <- ::Hooks.register(::ModJelloCreatureCollection.ID, ::ModJelloCreatureCollection.Version, ::ModJelloCreatureCollection.Name);
::ModJelloCreatureCollection.HooksMod.require("mod_msu >= 1.2.6");

::mods_queue("mod_jellos_creature_collection", null, function ()
{
	::include("script_hooks/add_cytoplasm_entity");
});