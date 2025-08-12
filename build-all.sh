#!/bin/bash

clean_flag=""
if [ "$1" == "clean" ]; then
    clean_flag="clean"
    echo "Building DelayBeGone for all supported versions with clean..."
else
    echo "Building DelayBeGone for all supported versions..."
fi

echo "Discovering versions from properties files..."
versions=()
for file in versions/*.properties; do
    filename=$(basename "$file" .properties)
    if [ "$filename" != "common" ]; then
        versions+=("$filename")
    fi
done

for version in "${versions[@]}"; do
    echo ""
    echo "========================================"
    echo "Building for Minecraft $version"
    echo "========================================"
    
    ./gradlew $clean_flag build -PmcVersion=$version
    
    if [ $? -ne 0 ]; then
        echo "ERROR: Build failed for version $version"
        exit 1
    fi
    
    echo "Moving build artifacts..."
    mkdir -p "builds/$version"
    cp build/libs/*.jar "builds/$version/"
done

echo ""
echo "========================================"
echo "All builds completed successfully!"
echo "Check the 'builds' folder for artifacts."
echo "========================================"