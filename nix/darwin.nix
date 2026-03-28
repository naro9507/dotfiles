{ pkgs, username, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    casks = [
      "bitwarden"
      "claude"
      "dbeaver-community"
      "discord"
      "firefox"
      "google-chrome"
      "google-cloud-sdk"
      "google-drive"
      "google-japanese-ime"
      "insomnia"
      "karabiner-elements"
      "monitorcontrol"
      "notion"
      "proxyman"
      "raycast"
      "slack"
      "spotify"
      "visual-studio-code"
      "wave"
      "wezterm"
      "zoom"
    ];
  };

  system.stateVersion = 5;
}
