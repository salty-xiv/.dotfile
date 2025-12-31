# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
imports =
	[ # Include the results of the hardware scan.
		./hardware-configuration.nix
	];

nix.settings.experimental-features = [ "nix-command" "flakes" ];

# Bootloader. aka grub
	# boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.grub.enable = true;
	boot.loader.grub.device = "nodev";
	boot.loader.grub.efiSupport = true;
	boot.loader.grub.useOSProber = true;

# NTFS support for disk drives
	boot.supportedFilesystems = [ "ntfs" ];

# networking
	networking.hostName = "nixos"; # Define your hostname.
	# networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.
# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
# Enable networking
	networking.networkmanager.enable = true;

# Set your time zone.
	time.timeZone = "America/New_York";

# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8";
		LC_MONETARY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";
	};

# Enable the X11 windowing system.
	# services.xserver.enable = true;

# Enable the GNOME Desktop Environment.
	# services.xserver.displayManager.gdm.enable = true;
	# services.xserver.desktopManager.gnome.enable = true;

# Configure keymap in X11
	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};

# Enable CUPS to print documents.
	services.printing.enable = true;

# Enable sound with pipewire.
	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;

		# If you want to use JACK applications, uncomment this
		#jack.enable = true;
	
		# use the example session manager (no others are packaged yet so this is enabled by default,
		# no need to redefine it in your config for now)
		#media-session.enable = true;
	};

# Enable touchpad support (enabled default in most desktopManager).
	# services.xserver.libinput.enable = true;

# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.salty = {
		isNormalUser = true;
		description = "salty";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [
		# thunderbird
		];
	};

# Enable automatic login for the user.
	services.displayManager.autoLogin.enable = true;
	services.displayManager.autoLogin.user = "salty";

# Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
	systemd.services."getty@tty1".enable = false;
	systemd.services."autovt@tty1".enable = false;

# Install firefox.
	programs.firefox.enable = true;

# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

# Enable wayland for gnome
	services.xserver = {
		enable = true;
		displayManager.gdm = {
			enable = true;
			wayland = true;
		};
		desktopManager.gnome.enable = true;
	};
	
# Enable sddm (display manager)
	# services.xserver.enable = true;
	# services.displayManager.sddm = {
	#	 enable = true;
	#	 wayland.enable = true;
	#	 settings = {
	#		 Theme = {
	#			 CursorTheme = "catppuccin-latte-sky-cursors";
	#		 };
	#	 };
	# };

# Enable Hyprland
	# services.xserver.displayManager.gdm.wayland = true;
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};
	services.displayManager.defaultSession = "hyprland";

# Enable the i3 Desktop Environment.
	# services.xserver.windowManager.i3.enable = true;
	# services.displayManager.defaultSession = "none+i3";

# cursor
	# programs.dconf.profiles.user.databases = [
	#	 {
	#		 settings."org/gnome/desktop/interface" = {
	#			 cursor-theme = "catppuccin-latte-sky-cursors";
	#			 cursor-size = "196";
	#		 };
	#	 }
	# ];
	# environment.variables.XCURSOR_SIZE = "96";
	# environment.variables.HYPRCURSOR_SIZE = "96";

# Enable OpenGL
	hardware.graphics = {
    		enable = true;
    		enable32Bit = true;

    		extraPackages = with pkgs; [ nvidia-vaapi-driver ];
	};

# Load nvidia driver for Xorg and Wayland
	boot.initrd.availableKernelModules = [ "nvidia_drm" "nvidia_modeset" "nvidia" "nvidia_uvm" ];
	services.xserver.videoDrivers = ["nvidia"];
	# nixpkgs.config.cudaSupport = true; # requires over an hour to compile
	hardware.nvidia = {

		# Modesetting is required.
		modesetting.enable = true;

		# Nvidia power management. Experimental, and can cause sleep/suspend to fail.
		# Enable this if you have graphical corruption issues or application crashes after waking
		# up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
		# of just the bare essentials.
		powerManagement.enable = false;
	
		# Fine-grained power management. Turns off GPU when not in use.
		# Experimental and only works on modern Nvidia GPUs (Turing or newer).
		powerManagement.finegrained = false;
	
		# Use the NVidia open source kernel module (not to be confused with the
		# independent third-party "nouveau" open source driver).
		# Support is limited to the Turing and later architectures. Full list of 
		# supported GPUs is at: 
		# https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
		# Only available from driver 515.43.04+
		open = false;
	
		# Enable the Nvidia settings menu,
		# accessible via `nvidia-settings`.
		nvidiaSettings = true;

		 # Optionally, you may need to select the appropriate driver version for your specific GPU.
		package = config.boot.kernelPackages.nvidiaPackages.stable;
	};

# Enable bluetooth gui
	services.blueman.enable = true;

# Fonts
	fonts.packages = with pkgs; [
		nerd-fonts.comic-shanns-mono
		jetbrains-mono
	];

# Shell
	programs.zsh.enable = true;
	users.defaultUserShell = pkgs.zsh;

# Neovim
	programs.neovim = {
		enable = true;
		defaultEditor = true;
	};

# OBS
	programs.obs-studio = {
  		enable = true;
  		package = pkgs.obs-studio.override {
    			cudaSupport = true;
		};
  	};

# gamescope
	boot.kernelPackages = pkgs.linuxPackages; # (this is the default) some amdgpu issues on 6.10
	programs = {
		gamescope = {
			enable = true;
			capSysNice = true;
		};
		steam = {
			enable = true;
			gamescopeSession.enable = true;
			remotePlay.openFirewall = true;
			dedicatedServer.openFirewall = true;
		};
	};
	# hardware.xone.enable = true; # support for the xbox controller USB dongle
	# services.getty.autologinUser = "salty";
	# environment = {
	#	 systemPackages = pkgs.mangohud;
	#	 loginShellInit = ''
	#		 [[ "$(tty)" = "/dev/tty1" ]] && ./gs.sh
	#	 '';
	# };

# extra kernal level rules for oryx to mod keyboard layout
	services.udev.extraRules = ''
		# Your rule goes here
		# Rules for Oryx web flashing and live training
		KERNEL=="hidraw*", ATTRS{idVendor}=="16c0", MODE="0664", GROUP="plugdev"
		KERNEL=="hidraw*", ATTRS{idVendor}=="3297", MODE="0664", GROUP="plugdev"
	
		# Legacy rules for live training over webusb (Not needed for firmware v21+)
		# Rule for all ZSA keyboards
		SUBSYSTEM=="usb", ATTR{idVendor}=="3297", GROUP="plugdev"
		# Rule for the Moonlander
		SUBSYSTEM=="usb", ATTR{idVendor}=="3297", ATTR{idProduct}=="1969", GROUP="plugdev"
		# Rule for the Ergodox EZ
		SUBSYSTEM=="usb", ATTR{idVendor}=="feed", ATTR{idProduct}=="1307", GROUP="plugdev"
		# Rule for the Planck EZ
		SUBSYSTEM=="usb", ATTR{idVendor}=="feed", ATTR{idProduct}=="6060", GROUP="plugdev"
	
		# Wally Flashing rules for the Ergodox EZ
		ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789B]?", ENV{ID_MM_DEVICE_IGNORE}="1"
		ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789A]?", ENV{MTP_NO_PROBE}="1"
		SUBSYSTEMS=="usb", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789ABCD]?", MODE:="0666"
		KERNEL=="ttyACM*", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789B]?", MODE:="0666"
	
		# Keymapp / Wally Flashing rules for the Moonlander and Planck EZ
		SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", MODE:="0666", SYMLINK+="stm32_dfu"
		# Keymapp Flashing rules for the Voyager
		SUBSYSTEMS=="usb", ATTRS{idVendor}=="3297", MODE:="0666", SYMLINK+="ignition_dfu"
	'';
	
	
# List packages installed in system profile. To search, run: $ nix search wget
	environment.systemPackages = with pkgs; [
		# base
		vim # basic editor
		wget # basic tool
	
		# window manager
		catppuccin-cursors.latteSky # cursor pack
		hyprshot # screenshot tool
		hyprlock # locker
		nwg-look # configuration for cursor
		rofi-wayland # app lanucher like dmenu
		swayidle # idle daemon for wayland (related to screen locking)
		# swaylock # wayland screen locking util
		swaynotificationcenter # notification daemon
		waybar # status bar for hyprland
		wl-clipboard # wayland clipboard
		wpaperd # wallpaper for hyprland
		wttrbar # weather for waybar
	
		# tools
		alacritty # terminal
		autojump # for speed moving in terminal
		curl # curl
		fd # fuzzy find
		fzf # fuzzy find
		git # git
		gparted # partition tool
		nautilus # file explorer
		# p7zip # 7z aka 7zip fork
		parted # partition disk management
		pavucontrol # audio controller for pipewire
		ripgrep # fuzzy find
		tldr # TODO idr
		tmux # tmux
		udisks2 # disk mounting tool
		unzip # for zip files
	
		# programs
		brave # internet browser
		discord # social media
		gimp3 # photoshop
		keepassxc # password manager
		libreoffice # office program
		parsec-bin # remote streaming
		prismlauncher # minecraft launcher
		rclone # google drive sync
		spotify # spotify music
		streamcontroller # for the elgato streamdeck
		synology-drive-client # client to sync with synology nas
		vlc # media player
		ytmdesktop # youtube music desktop
		vesktop # discord alt client

	
		# code
		gcc14 # c++ for nvim
		# love # love3d
		lua51Packages.lua # lua for nvim
		# rustup # rust
	
		# lsp
		lua-language-server # lua lsp
	
		# linter
		luajitPackages.luacheck # lua lint
	
		# formatter
		nixfmt-rfc-style # nix format
		stylua # lua format
	
		# game
		fflogs # uploader only
		mangohud # fps/perforance counter
		xivlauncher # FFXIV
	];

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#	 enable = true;
	#	 enableSSHSupport = true;
	# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
	# services.openssh.enable = true;

# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];

# Or disable the firewall altogether.
	# networking.firewall.enable = false;

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "25.05"; # Did you read the comment?

}
