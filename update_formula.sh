#!/bin/bash

# Script to update the threefingers formula with the correct SHA256

VERSION=${1:-"1.0.2"}
URL="https://github.com/geongeorge/threefingers/archive/refs/tags/v${VERSION}.tar.gz"

echo "Downloading and calculating SHA256 for version ${VERSION}..."
echo "URL: ${URL}"

# Download the tar.gz file and calculate SHA256
SHA256=$(curl -sL "${URL}" | shasum -a 256 | cut -d' ' -f1)

if [ -z "$SHA256" ]; then
    echo "Error: Could not download or calculate SHA256"
    exit 1
fi

echo "SHA256: ${SHA256}"

# Update the formula file
sed -i '' "s/sha256 \"\"/sha256 \"${SHA256}\"/" Formula/threefingers.rb
sed -i '' "s/version \".*\"/version \"${VERSION}\"/" Formula/threefingers.rb
sed -i '' "s|url \".*\"|url \"${URL}\"|" Formula/threefingers.rb

echo "Updated Formula/threefingers.rb with:"
echo "  - Version: ${VERSION}"
echo "  - SHA256: ${SHA256}"
echo "  - URL: ${URL}"

echo ""
echo "You can now test the formula locally with:"
echo "  brew install --build-from-source ./Formula/threefingers.rb"
