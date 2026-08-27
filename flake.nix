{
  description = "HDL Development Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          verible
          vhdl-ls
        ];

        shellHook = ''
          echo "HDL environment loaded!"
          echo "Verible version: $(verible-verilog-ls --version)"
        '';
      };
    };
}
