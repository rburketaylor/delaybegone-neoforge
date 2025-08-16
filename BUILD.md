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

### Multi-Version Builds
```bash
# Build all versions - fast incremental builds
./gradlew buildAll

# Clean and build all versions (fast mode) - builds jar only, skips tests/javadoc
./gradlew cleanBuildAll

# Clean and build all versions (full mode) - runs complete build including tests
./gradlew cleanBuildAllFull
```

**Performance Note:** 
- Use `buildAll` for fastest incremental builds during development
- Use `cleanBuildAll` for fresh jar builds when troubleshooting (skips tests/javadoc for speed)  
- Use `cleanBuildAllFull` for complete clean builds including all tasks (tests, javadoc, etc.)

## Output
- Individual builds: `build/libs/`
- All versions (using Gradle tasks): `builds/{version}/`

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
2. The Gradle tasks will automatically detect the new version (no manual updates needed)
3. Add version to GitHub Actions matrix if using automated builds

**Note:** The Gradle tasks automatically discover supported versions from the properties files in the `versions/` directory, so you no longer need to manually update version lists.