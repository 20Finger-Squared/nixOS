{lib,config,pkgs,...}:
{
	options.system-config.boot = lib.mkEnableOption "my boot options";
	config = lib.mkIf config.system-config.boot {
		boot = {
			kernelPackages = pkgs.linuxPackages_latest;
			loader = {
				systemd-boot.enable = true;
				efi.canTouchEfiVariables = true;
			};
		};
	};
}
