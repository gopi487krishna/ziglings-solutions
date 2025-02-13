{
  description = "Ziglings dev environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    zig.url = "github:mitchellh/zig-overlay";
  };

  outputs = { self, nixpkgs, zig }:
    let 
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ 
          zig.overlays.default
        ];
      };
    in
    {
      devShell.x86_64-linux = pkgs.mkShell {
        buildInputs = [
          pkgs.nixpkgs-fmt
          pkgs.zigpkgs.master
        ];

      };
  };
}
