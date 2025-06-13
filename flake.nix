{
  description = "Neovim flake with dependencies";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";

    neovim.url = "nixpkgs/nixos-25.05";

    rust_analyzer.url = "nixpkgs/nixos-25.05";
    pyright.url = "nixpkgs/nixos-25.05";
    lua_ls.url = "nixpkgs/nixos-25.05";
    ts_ls.url = "nixpkgs/nixos-25.05";
    json_ls.url = "nixpkgs/nixos-25.05";
    clangd.url = "nixpkgs/nixos-25.05";
    bash_ls.url = "nixpkgs/nixos-25.05";
    sql_ls.url = "nixpkgs/nixos-25.05";

  };

  outputs = { 
    self, 
    nixpkgs,
    neovim,
    rust_analyzer,
    pyright,
    lua_ls,
    ts_ls,
    json_ls,
    clangd,
    bash_ls,
    sql_ls,
   }: let
    systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];

    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f {
      inherit system;
      pkgs = import nixpkgs { inherit system; };
      neovimPkgs = import neovim { inherit system; };
      rust_analyzerPkgs = import rust_analyzer { inherit system; };
      pyrightPkgs = import pyright { inherit system; };
      lua_lsPkgs = import lua_ls { inherit system; };
      ts_lsPkgs = import ts_ls { inherit system; };
      json_lsPkgs = import json_ls { inherit system; };
      clangdPkgs = import clangd { inherit system; };
      bash_lsPkgs = import bash_ls { inherit system; };
      sql_lsPkgs = import sql_ls { inherit system; };
    });

  in {

    packages = forAllSystems (args: {
      default = args.pkgs.writeShellApplication {
        name = "nvim";
        runtimeInputs = with args; [

          rust_analyzerPkgs.rust-analyzer
          pyrightPkgs.pyright
          lua_lsPkgs.lua-language-server
          ts_lsPkgs.typescript-language-server
          json_lsPkgs.nodePackages.vscode-json-languageserver
          clangdPkgs.llvmPackages.clang
          bash_lsPkgs.bash-language-server
          sql_lsPkgs.sqls

          neovimPkgs.neovim

          pkgs.ripgrep
          pkgs.unzip
          pkgs.zip
          pkgs.gcc
        ];

        text = ''
          export nvim_in_nix="1"
          exec ${args.neovimPkgs.neovim}/bin/nvim "$@"
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


