{ ... }:

{
  imports = [
    ../../modules/user/nvim
    ../../modules/user/git
    ../../modules/user/yazi
  ];

  home.username = "jack";
  home.homeDirectory = "/home/jack";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    initExtra = ''
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
    '';
  };

  programs.git.extraConfig.core.autocrlf = true;
  # programs.nixvim.plugins.lsp.servers.delphi_ls.enable = true;
}
