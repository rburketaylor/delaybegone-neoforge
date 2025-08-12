# DelayBeGone Multi-Version Build Guide

This mod supports multiple Minecraft versions with NeoForge. Here's how to build for different versions.

## Supported Versions

- Minecraft 1.20.4 (NeoForge 20.4.249)
- Minecraft 1.20.6 (NeoForge 20.6.138)
- Minecraft 1.21.1 (NeoForge 21.1.200)
- Minecraft 1.21.3 (NeoForge 21.3.89)
- Minecraft 1.21.4 (NeoForge 21.4.150)
- Minecraft 1.21.5 (NeoForge 21.5.91)
- Minecraft 1.21.6 (NeoForge 21.6.20-beta)
- Minecraft 1.21.7 (NeoForge 21.7.25-beta)
- Minecraft 1.21.8 (NeoForge 21.8.31)

**Note:** Minecraft 1.20.2 requires NeoGradle 7.0.116 and is not compatible with our current build system using NeoGradle 7.0.192.

## Building Individual Versions

### Command Line
```bash
# Build for a specific version
./gradlew build -PmcVersion=1.21.1
./gradlew build -PmcVersion=1.20.4
# etc.

# Default (without -PmcVersion) builds for 1.21.1
./gradlew build
```

### Build Scripts
```bash
# Build all versions - fast incremental builds (Windows)
build-all.bat

# Build all versions with clean - slower but ensures fresh build (Windows)
build-all.bat clean

# Build all versions - fast incremental builds (Linux/Mac)
./build-all.sh

# Build all versions with clean - slower but ensures fresh build (Linux/Mac)
./build-all.sh clean
```

**Performance Note:** The scripts now default to incremental builds for faster compilation. Use the `clean` flag only when you need a completely fresh build or are troubleshooting build issues.

## Output
- Individual builds: `build/libs/`
- All versions (using scripts): `builds/{version}/`

## GitHub Actions
The repository includes automated builds for all versions:
- Triggered on push/PR to main branch
- Can be manually triggered via "Actions" tab
- Artifacts available for download after completion

## Properties Structure
The build system uses a two-tier property system organized in the `versions/` directory:

### Common Properties (`versions/common.properties`)
Contains shared configuration:
- Gradle settings (JVM args, caching, etc.)
- Common mod metadata (name, author, description, etc.)
- Loader version range

### Version-Specific Properties (`versions/{version}.properties`)
Contains only version-specific overrides:
- Minecraft version
- NeoForge version  
- Parchment mappings version
- Version-specific mod version suffix

This structure eliminates duplication and makes it easy to update common settings across all versions.

## Adding New Versions
1. Create new `versions/{version}.properties` file
2. The build scripts will automatically detect the new version (no manual updates needed)
3. Add version to GitHub Actions matrix if using automated builds

**Note:** The build scripts now automatically discover supported versions from the properties files in the `versions/` directory, so you no longer need to manually update the version lists in the scripts.