{
	programs.nixvim = {
		plugins.auto-session = {
			enable = true;

			autoSession = {
				enabled = true;
			};
			autoSave = {
				enabled = true;
			};
			autoRestore = {
				enabled = true;
			};
			sessionLens = {
				loadOnSetup = true;
			};
		};
	};
}
