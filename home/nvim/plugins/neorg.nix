{pkgs, ...}: {
  programs.nixvim.plugins.neorg = {
    enable = true;
    package = with pkgs.vimPlugins; [
      neorg
      neorg-telescope
    ];

    lazyLoading = true;
    modules = {
      "core.default" = {__empty = null;};
      "core.concealer" = {__empty = null;};
      "core.dirman" = {
        config = {
          workspaces = {
            notes = "~/Notes";
          };
          index = "index.norg";
          default_workspace = "notes";
        };
      };
    };
  };
}
