::ModJelloCreatureCollection <- {
    ID = "mod_jellos_creature_collection",
    Name = "Jello's Creature Collection",
    Version = "1.0.0"
};

::ModJelloCreatureCollection.HooksMod <- ::Hooks.register(::ModJelloCreatureCollection.ID, ::ModJelloCreatureCollection.Version, ::ModJelloCreatureCollection.Name);
::ModJelloCreatureCollection.HooksMod.require("mod_msu >= 1.2.6");


::ModJelloCreatureCollection.HooksMod.queue(">mod_msu", function()
{
  // define mod class of this mod
  ::ModJelloCreatureCollection.Mod <- ::MSU.Class.Mod(::ModJelloCreatureCollection.ID, ::ModJelloCreatureCollection.Version, ::ModJelloCreatureCollection.Name);

  ::ModJelloCreatureCollection.Mod.Registry.addModSource(::MSU.System.Registry.ModSourceDomain.GitHub, "https://github.com/BreakyZ/mod_jello_creature_collection"); // this registers for release updates on the repo
  ::ModJelloCreatureCollection.Mod.Registry.setUpdateSource(::MSU.System.Registry.ModSourceDomain.GitHub);

  // load hook files
  foreach (file in ::IO.enumerateFiles("script_hooks"))
  {
      ::include(file);
  }
}, ::Hooks.QueueBucket.Normal);