{ lib, ... }:
let
  types = lib.types;
in
{
  options.home-manager-modules = lib.mkOption {
    type=types.listOf types.deferredModule;
    default=[];
  };
}
