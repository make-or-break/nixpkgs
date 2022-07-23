{
  description = "A collection of packages for the Nix package manager";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { nixpkgs, self }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    in
    {
      packages = forAllSystems (system:
        import ./pkgs/top-level/python-packages.nix {
          pkgs = import nixpkgs { inherit system; };
        });
    };
}
