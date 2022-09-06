#!/bin/bash

export DEBFULLNAME="Lefteris Garyfalakis"
export DEBEMAIL="lefterisgar@gmail.com"

REL_VER=$(grep "^readonly VERSION" limoji | cut -d'"' -f2)
dch -v "${REL_VER}" --distribution=unstable "New upstream release."
git add limoji debian/changelog
git commit -m "${REL_VER}"
git tag "${REL_VER}"
git push
git push --tags
