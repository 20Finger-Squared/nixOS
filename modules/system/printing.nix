{ lib, ... }@inputs:
lib.mkSystemOption "printing" inputs {
  services.printing.enable = true;
}
