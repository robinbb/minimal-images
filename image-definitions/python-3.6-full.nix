# python-3.6-full.nix
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
  name = "robinbb/minimal-python-3.6-full";
  tag = imageVersion;
  config = {
    Entrypoint = [ "${pkgs.python36Full}/bin/python" ];
    Env = [
       "PATH=${pkgs.python36Full}/bin"
    ];
  };
  maxLayers = 60;
}
