# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

DelayBeGone is a NeoForge mod that removes the 5-tick shield blocking delay in Minecraft. The mod uses Mixin to modify the `LivingEntity.isBlocking()` method, changing the required duration from 5 ticks to 0. Since this modifies server-side combat mechanics, the mod must be installed on the server to function.

## Multi-Version Architecture

This project supports multiple Minecraft versions through a sophisticated property-based system:

### Property System Structure
- `versions/common.properties` - Shared configuration for all versions (Gradle settings, mod metadata, etc.)
- `versions/{version}.properties` - Version-specific overrides (MC version, NeoForge version, mappings)
- `build.gradle` loads common properties first, then version-specific properties override as needed

### Version Management
All supported versions are automatically discovered from `.properties` files in the `versions/` directory. The build system dynamically loads the appropriate configuration based on the `-PmcVersion` parameter.

## Build Commands

**Always specify the Minecraft version with `-PmcVersion=<version>` - the build will fail without it.**

### Individual Builds
```
# Build for specific version
./gradlew build -PmcVersion=<version>
./gradlew clean build -PmcVersion=<version>  # with clean
```

### Multi-Version Builds
```
# Fast incremental builds (default)
./build-all.sh          # Linux/Mac
build-all.bat          # Windows

# Clean builds (slower, ensures fresh build)
./build-all.sh clean
build-all.bat clean
```

### Development Tasks
```
# List available tasks
./gradlew tasks -PmcVersion=1.21.1

# Run client for testing
./gradlew runClient -PmcVersion=1.21.1

# Run server
./gradlew runServer -PmcVersion=1.21.1
```

## Code Architecture

### Core Components
- `DelayBeGone.java` - Main mod class with minimal initialization
- `DelayBeGoneMixin.java` - Single mixin that modifies `LivingEntity.isBlocking()`
- `delaybegone.mixins.json` - Mixin configuration targeting the DelayBeGoneMixin class

### Mixin Implementation
The mod uses `@ModifyConstant` to change the hardcoded `5` tick delay to `0` in the `isBlocking` method. This is a simple, targeted modification that removes shield activation delay. Since `isBlocking` affects damage calculation and combat mechanics, this modification must run server-side to be effective.

## Build Optimizations

- Gradle daemon, parallel builds, and caching are enabled in `common.properties`
- Java compiler includes `-Xlint` flags for deprecation, removal, and unchecked warnings
- Build scripts default to incremental builds for speed, with optional `clean` flag

## Adding New Versions

1. Create `versions/{new_version}.properties` with version-specific configuration
2. Build scripts automatically detect the new version
3. Update GitHub Actions matrix in `.github/workflows/build-all-versions.yml` if using CI

## Important Build Notes

- All builds require Java 21 (specified in build.gradle)
- The project uses NeoGradle 7.0.192 - versions requiring different NeoGradle versions will fail with a descriptive error
- When making build system changes, always update BUILD.md documentation
- Build artifacts are placed in `build/libs/` for individual builds, `builds/{version}/` for multi-version builds