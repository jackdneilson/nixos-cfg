{
  programs.yazi = {
    enable = true;
    # enableBashIntegration = true;
  };

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
}
