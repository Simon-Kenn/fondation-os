return {
	s(
		"module", 
		fmt(
			[[
				{{
					config,
					lib,
					...
				}}:
				with lib; let
					cfg = config.{};
				in {{
					options.{} = {{
						enable = mkEnableOption "{}";
					}};

					config = mkIf cfg.enable {{
						{} = {{
							{}
						}};
					}};
				}}
			]],
			{
				i(1, "mymodule"),
				rep(1),
				i(2, "mymodule"),
				i(3, "myconfiguration"),
				i(4),
			}
		)
	),
	--s(
	--	"mkOption",
	--	fmt(
	--		[[
	--			{} = mkOption {{
	--				type = types.{};
	--				default = {};
	--				description = {};
	--				example = {};
	--			}}
	--		]],
	--		{
	--			i(1, "option name"),
	--			i(2, "set the type of the option"),
	--			i(3, "choice a description for the option"),
	--			i(4, "write an examble for the option"),
	--		}
	--	)
	--),
}
