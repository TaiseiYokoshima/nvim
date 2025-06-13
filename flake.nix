{
  description = "Neovim flake with dependencies";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
  };

  outputs = { 
    self, 
    nixpkgs,
   }: let
    systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];

    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f {
      inherit system;
      pkgs = import nixpkgs { inherit system; };
    });

  in {

    packages = forAllSystems (args: {
      default = args.pkgs.writeShellApplication {
        name = "nvim";
        runtimeInputs = with args.pkgs; [
          rust-analyzer
          pyright
          lua-language-server
          typescript-language-server
          nodePackages.vscode-json-languageserver
          llvmPackages.clang
          bash-language-server
          sqls

          neovim
          ripgrep
          unzip
          zip
        ];

        text = ''
          export nvim_in_nix="1"
          exec ${args.pkgs.neovim}/bin/nvim "$@"
        '';
      };
    });



    apps = forAllSystems (args: {
      default = {
        type = "app";
        program = "${args.pkgs.writeShellApplication {
          name = "nvim";
          runtimeInputs = with args.pkgs; [
            rust-analyzer
            pyright
            lua-language-server
            typescript-language-server
            nodePackages.vscode-json-languageserver
            llvmPackages.clang
            bash-language-server
            sqls

            neovim
            ripgrep
            unzip
            zip
          ];
          text = '' 
            export nvim_in_nix="1"
            exec ${args.pkgs.neovim}/bin/nvim "$@" 
          '';
        }}/bin/nvim";
      };
    });

  };
}


