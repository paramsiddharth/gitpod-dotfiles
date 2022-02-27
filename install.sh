#!/usr/bin/env bash

# Add the keys
[[ ! -z $GNUGPG  ]] &&
cd ~ &&
rm -rf .gnupg &&
echo $GNUGPG | base64 -d | tar --no-same-owner -xzvf -

# Set up the keys
[[ ! -z $GNUPG_SIGNING_KEY  ]] &&
git config --global user.signingkey $GNUPG_SIGNING_KEY &&
git config --global commit.gpgsign true

# Configure Git
git config --global user.name  "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"