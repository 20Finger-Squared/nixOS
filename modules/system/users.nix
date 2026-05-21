{lib, pkgs, config, my-pkgs, ...}:
{
	options.system-config.users = lib.mkEnableOption "my user config";
	config = lib.mkIf config.system-config.users {
		users.users.tf = {
			isNormalUser = true;
			description = "Rhylie M. Orton";
			extraGroups = [ "networkmanager" "wheel" ];
			packages = with pkgs; [ firefox vesktop my-pkgs.tmux kitty lazygit kdePackages.kate ];
		};

	};
}
