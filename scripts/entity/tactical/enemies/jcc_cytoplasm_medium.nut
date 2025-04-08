this.jcc_cytoplasm_medium <- this.inherit("scripts/entity/tactical/enemies/jcc_cytoplasm", {
	m = {},
	function create()
	{
		this.jcc_cytoplasm.create();
	}

	function onInit()
	{
		this.jcc_cytoplasm.onInit();
		this.grow(true);
	}

});
