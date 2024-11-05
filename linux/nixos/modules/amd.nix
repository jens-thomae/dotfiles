
{ pkgs, config, lib, ... }:

{
  # Load drivers early
  boot.initrd.kernelModules = [ "amdgpu" ];

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}
