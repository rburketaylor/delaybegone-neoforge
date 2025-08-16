#!/bin/bash

# Test script for running DelayBeGone mod versions
# Usage: ./test-version.sh <version>
# Example: ./test-version.sh 1.21.1

# Get available versions from properties files
get_available_versions() {
    for file in versions/*.properties; do
        if [ "$(basename "$file")" != "common.properties" ]; then
            basename "$file" .properties
        fi
    done | sort -V
}

if [ $# -eq 0 ]; then
    echo "Usage: $0 <version>"
    echo "Available versions:"
    get_available_versions | sed 's/^/  /'
    exit 1
fi

VERSION=$1

# Check if version exists
if [ ! -f "versions/$VERSION.properties" ]; then
    echo "Error: Version $VERSION not found!"
    echo "Available versions:"
    get_available_versions | sed 's/^/  /'
    exit 1
fi

echo "Running Minecraft client for version $VERSION..."
./gradlew runClient -PmcVersion=$VERSION --project-cache-dir=build-cache/$VERSION