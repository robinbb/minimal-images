# bash.nix
#
# Copyright 2018 Robin Bate Boerop
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

{ imageVersion ? "latest" }:
let
  pkgs = import <nixpkgs> {};
in pkgs.dockerTools.buildLayeredImage {
  name = "robinbb/minimal-bash";
  tag = imageVersion;
  config = {
    Entrypoint = [ "${pkgs.bashInteractive}/bin/bash" ];
    Env = [
       "PATH=${pkgs.bashInteractive}/bin"
    ];
  };

  maxLayers = 40;
}
