#!/bin/bash

clean_flag=""
full_mode=false

if [ "$1" == "clean" ]; then
    clean_flag="clean"
    echo "Building DelayBeGone for all supported versions with clean..."
elif [ "$1" == "full" ]; then
    full_mode=true
    echo "Building DelayBeGone for all supported versions with full build (tests + javadoc)..."
elif [ "$1" == "clean-full" ] || [ "$2" == "full" ]; then
    clean_flag="clean"
    full_mode=true
    echo "Building DelayBeGone for all supported versions with clean + full build..."
else
    echo "Building DelayBeGone for all supported versions (fast mode - use 'full' for complete build)..."
fi

# Ensure clean daemon state for reliable multi-version builds
echo "Stopping any existing daemons..."
./gradlew --stop

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
    
    # Clean build directory to avoid copying old artifacts
    rm -rf build/libs/*.jar
    
    # Stop daemon before each build to prevent memory accumulation
    ./gradlew --stop
    
    if [ "$full_mode" == "true" ]; then
        ./gradlew $clean_flag build -PmcVersion=$version
    else
        ./gradlew $clean_flag jar -x test -x javadoc -PmcVersion=$version
    fi
    
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

# Pause for user to read output (like Windows batch pause)
read -p "Press Enter to continue..."