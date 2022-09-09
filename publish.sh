#!/bin/bash

export DEBFULLNAME="Lefteris Garyfalakis"
export DEBEMAIL="lefterisgar@gmail.com"

# Update changelog
REL_VER=$(grep "^readonly VERSION" limoji | cut -d'"' -f2)
dch -v "${REL_VER}" --distribution=unstable "New upstream release." > /dev/null

echo "Creating the release commit..."

# Commit the changes
git add limoji debian/changelog > /dev/null
git commit -m "${REL_VER}" > /dev/null

echo "Tagging the new release..."

# Tag the new release
git tag "${REL_VER}" > /dev/null

echo "Pushing tags..."

# Push the release commit & tags
git push > /dev/null
git push --tags > /dev/null
