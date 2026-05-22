{ lib, ... }@inputs:
lib.mkSystemOption "security" inputs {
  security.rtkit.enable = true;
}
