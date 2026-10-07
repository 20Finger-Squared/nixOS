{
  lib,
  libappindicator-gtk3,
  rustPlatform,
  fetchFromGitHub,
  fetchurl,
  cargo-tauri,
  pkg-config,
  wrapGAppsHook3,
  nodejs,
  pnpm,
  pnpmConfigHook,
  fetchPnpmDeps,
  jq,
  openssl,
  webkitgtk_4_1,
  librsvg,
  mpv-unwrapped,
  glib-networking,
  gst_all_1,
}:

let
  # rusty_v8's build.rs tries to download this at build time, which the sandbox blocks.
  librusty_v8 = fetchurl {
    name = "librusty_v8-130.0.7";
    url = "https://github.com/denoland/rusty_v8/releases/download/v130.0.7/librusty_v8_release_x86_64-unknown-linux-gnu.a.gz";
    hash = "sha256-pkdsuU6bAkcIHEZUJOt5PXdzK424CEgTLXjLtQ80t10=";
  };

  # lindera-ipadic's build.rs downloads this at build time.
  mecab-ipadic = fetchurl {
    name = "mecab-ipadic-2.7.0-20070801.tar.gz";
    url = "https://github.com/lindera-morphology/mecab-ipadic/archive/refs/tags/2.7.0-20070801.tar.gz";
    hash = "sha256-CZ5G6A1V58DWkGeDr/cTdI4a6Q9Gxe+W7BU7vwm/VVA=";
  };
in
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "limusic";
  version = "0.1.0"; # match Cargo.toml / tauri.conf.json

  src = fetchFromGitHub {
    owner = "SimoHypers";
    repo = "limusic";
    rev = "master";
    hash = "sha256-+p8Z4cAbm78g692LwLtRPk+T0YosBjcl2PYdWTKYuQo=";
  };

  buildAndTestSubdir = "src-tauri";
  cargoHash = "sha256-dp8KezTgZf8vdJxQr9Joj1lQl0wIqGYp1kqQMFaJRLQ=";

  pnpmRoot = "ui";
  pnpmDeps = fetchPnpmDeps {
    inherit (finalAttrs) pname version src;
    sourceRoot = "${finalAttrs.src.name}/ui";
    fetcherVersion = 3;
    hash = "sha256-8KfgcGcpuEn+32NkSrJUC2cAjnIp8t645f1Ia/VZJNo=";
  };

  env = {
    RUSTY_V8_ARCHIVE = librusty_v8;
    MECAB_IPADIC_ARCHIVE = mecab-ipadic;
  };

  nativeBuildInputs = [
    cargo-tauri.hook
    pkg-config
    wrapGAppsHook3
    nodejs
    pnpm
    pnpmConfigHook
    jq
  ];

  buildInputs = [
    mpv-unwrapped.dev
    openssl
    webkitgtk_4_1
    librsvg
    mpv-unwrapped
    glib-networking
    libappindicator-gtk3
  ]
  ++ (with gst_all_1; [
    gstreamer
    gst-plugins-base
    gst-plugins-good
  ]);

  # Tauri runs `pnpm build` from the repo root, but package.json is in ui/.
  # Drop that hook and build the frontend ourselves.
  postPatch = ''
    jq 'del(.build.beforeBuildCommand) | del(.bundle.createUpdaterArtifacts)' \
      src-tauri/tauri.conf.json > tauri.conf.json.new
    mv tauri.conf.json.new src-tauri/tauri.conf.json
  '';

  preBuild = ''
    pnpm --dir ui build

    # Make lindera-ipadic use the pre-fetched archive instead of downloading.
    dir=$(find "$NIX_BUILD_TOP" -maxdepth 3 -type d -name 'lindera-ipadic-0.30.0' | head -n1)
    echo "patching vendored crate at: $dir"
    chmod -R u+w "$dir"
    substituteInPlace "$dir/build.rs" \
      --replace-fail \
        'if !source_path_for_build.exists() {' \
        'if !source_path_for_build.exists() { std::fs::copy(std::env::var_os("MECAB_IPADIC_ARCHIVE").unwrap(), &source_path_for_build)?; } if false {'
    jq '.files = {}' "$dir/.cargo-checksum.json" > "$dir/.cargo-checksum.json.new"
    mv "$dir/.cargo-checksum.json.new" "$dir/.cargo-checksum.json"
  '';

  preFixup = ''
    gappsWrapperArgs+=(--prefix LD_LIBRARY_PATH : ${
      lib.makeLibraryPath [
        mpv-unwrapped
        libappindicator-gtk3
      ]
    })
  '';

  meta = {
    description = "limusic music player";
    homepage = "https://github.com/SimoHypers/limusic";
    license = lib.licenses.mit; # confirm against the repo's LICENSE file
    mainProgram = "limusic";
    platforms = lib.platforms.linux;
  };
})
