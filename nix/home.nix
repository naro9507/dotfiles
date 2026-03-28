{ pkgs, username, ... }: {
  home.username = username;
  home.homeDirectory = "/Users/${username}";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    act
    awscli2
    btop
    codex
    colima
    docker
    fzf
    gh
    ghq
    git
    git-delta
    gitflow
    jq
    lazydocker
    lazygit
    lazysql
    mise
    terraform
    (callPackage ./pkgs/czg.nix { })
  ];

  programs.starship.enable = true;
  programs.home-manager.enable = true;
}
