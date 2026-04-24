{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (texlive.combine {
      inherit (texlive)
        scheme-basic
        latexmk
        ;
    })
  ];
}
