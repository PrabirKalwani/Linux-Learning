{ pkgs, ... }: {
  channel = "stable-23.11"; 
  packages = [
    pkgs.nodePackages.firebase-tools
    pkgs.jdk17
    pkgs.unzip
    pkgs.cargo
    pkgs.rustc
    pkgs.rustfmt
    pkgs.stdenv.cc
    pkgs.nodejs_20
    pkgs.python3
    pkgs.python311Packages.pip

  ];
  env = {
    # RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";

  };
  idx = {
    extensions = [
      "Dart-Code.flutter"
      "Dart-Code.dart-code"
      "rust-lang.rust-analyzer"
      "tamasfe.even-better-toml"
      "serayuzgur.crates"
      "vadimcn.vscode-lldb"
    "rangav.vscode-thunder-client"

    ];
    workspace = {
   

};
};
}