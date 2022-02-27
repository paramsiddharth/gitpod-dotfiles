#!/usr/bin/env bash

[[ ! -z $GNUGPG  ]] &&
cd ~ &&
rm -rf .gnupg &&
echo $GNUGPG | base64 -d | tar --no-same-owner -xzvf -

[[ ! -z $GNUPG_SIGNING_KEY  ]] &&
git config --global user.signingkey $GNUPG_SIGNING_KEY &&
git config commit.gpgsign true