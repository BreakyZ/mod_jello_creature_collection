this.cyto_racial_no_merge <- this.inherit("scripts/skills/racials/cyto_racial", {
	m = {},
	function create()
	{
		this.cyto_racial.create();
		this.m.ID = "racial.cyto_no_merge";
	}


    function onUpdate( _properties )
	{

	}

});

