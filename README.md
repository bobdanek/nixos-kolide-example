# nixos-kolide-example
Basic nixos+flake config with Kolide working. Not meant to result in a working NixOS system without modification, this is just a cleaned up version of my (non-public) NixOS files for my work laptop with the essentials for getting Kolide working.

I followed the steps over on the [Kolide nix-agent readme](https://github.com/kolide/nix-agent?tab=readme-ov-file#running-kolide-launcher) to extract my enrollment secret from the .deb file provided by my workplace's Kolide enrollment automation. There may be other options you'll need to set or change which you may be able to find in your enrollment .deb package if it's similar to the one I was provided.
