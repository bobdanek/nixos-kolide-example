{ config, pkgs, inputs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix  # not included in this repo but you'll probably have one of these
    ];

  environment.systemPackages = with pkgs; [
    inputs.kolide-launcher
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  # Your enrollment secret goes into "text" here
  environment.etc."kolide-k2/secret" = {
    mode = "0600";
    text = "redacted";
  };

  # These may be different for your environment
  services.kolide-launcher = {
    enable = true;
    kolideHostname = "k2device.kolide.com";
    rootDirectory = "/var/kolide-k2/k2device.kolide.com";
    updateChannel = "stable";
  };
}
