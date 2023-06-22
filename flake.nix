{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShell = let
        generateEditorConfig = pkgs.writeShellScriptBin "generateEditorConfig" ''
          if [ ! -f .editorconfig ]; then
            echo "root = true" > .editorconfig
            echo "" >> .editorconfig
            echo "[*]" >> .editorconfig
            echo "end_of_line = lf" >> .editorconfig
            echo "insert_final_newline = true" >> .editorconfig
            echo "trim_trailing_whitespace = true" >> .editorconfig
            echo "charset = utf-8" >> .editorconfig
            echo "" >> .editorconfig
            echo "[*.{py,r,R}]" >> .editorconfig
            echo "indent_style = space" >> .editorconfig
            echo "indent_size = 4" >> .editorconfig
            echo "" >> .editorconfig
            echo "[*.{json,yaml,html}]" >> .editorconfig
            echo "indent_style = space" >> .editorconfig
            echo "indent_size = 2" >> .editorconfig
            echo "" >> .editorconfig
            echo "[*.md]" >> .editorconfig
            echo "trim_trailing_whitespace = false" >> .editorconfig
            echo "indent_style = space" >> .editorconfig
            echo "indent_size = 2" >> .editorconfig
          fi
        '';
      in
        pkgs.mkShell {
          name = "devShell";
          buildInputs = with pkgs; [
            python311Packages.numpy
            python311Packages.discordpy
          ];
          shellHook = ''
            ${generateEditorConfig}/bin/generateEditorConfig
          '';
        };
    });
}
