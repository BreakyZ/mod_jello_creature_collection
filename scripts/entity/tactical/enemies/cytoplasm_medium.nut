this.cytoplasm_medium <- this.inherit("scripts/entity/tactical/enemies/cytoplasm", {
	m = {},
	function create()
	{
		this.cytoplasm.create();
	}

	function onInit()
	{
		this.cytoplasm.onInit();
		this.grow(true);
	}

});
