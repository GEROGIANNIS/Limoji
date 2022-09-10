#!/bin/bash

export DEBFULLNAME="Lefteris Garyfalakis"
export DEBEMAIL="lefterisgar@gmail.com"

# Check if devscripts package is installed
if ! hash dch 2> /dev/null; then
    echo Please install devscripts and try again!
    exit 2
fi

# Check if git is installed
if ! hash git 2> /dev/null; then
    echo Please install git and try again!
    exit 2
fi

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
git push > /dev/null 2>&1
git push --tags > /dev/null 2>&1
