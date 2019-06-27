{ pkgs ? import <nixpkgs> {} }: with pkgs.lib; rec {
  info = builtins.fromJSON (builtins.readFile ./src/info.json);

  dir = pkgs.runCommand "${info.name}_${info.version}" {
    buildInputs = with pkgs; [ xorg.lndir ];
  } ''
    mkdir -p $out/$name
    lndir ${./src}      $out/$name/
    ln -s ${./icon.png} $out/$name/thumbnail.png
  '';

  zip = pkgs.runCommand "${info.name}_${info.version}.zip" {
    buildInputs = [ pkgs.zip ];
  } ''
    mkdir -p $out
    cd ${dir}
    zip -v -r $out/$name ./${dir.name}
  '';
}
