# DelayBeGone

A simple NeoForge mod that removes the 5-tick shield blocking delay in Minecraft, allowing for instant shield activation.

## What It Does

In vanilla Minecraft, when you right-click to block with a shield, there's a 5-tick (0.25 second) delay before the shield actually starts blocking damage. This mod eliminates that delay, making shield combat more responsive and fluid.

## Supported Versions

- **Minecraft 1.20.4** (NeoForge 20.4.249)
- **Minecraft 1.20.6** (NeoForge 20.6.138)
- **Minecraft 1.21.1** (NeoForge 21.1.200)
- **Minecraft 1.21.3** (NeoForge 21.3.89)
- **Minecraft 1.21.4** (NeoForge 21.4.150)
- **Minecraft 1.21.5** (NeoForge 21.5.91)
- **Minecraft 1.21.6** (NeoForge 21.6.20-beta)
- **Minecraft 1.21.7** (NeoForge 21.7.25-beta)
- **Minecraft 1.21.8** (NeoForge 21.8.31)

## Download

Download the appropriate version for your Minecraft installation from the [Releases](../../releases) page.

## Installation

1. Install [NeoForge](https://neoforged.net/) for your Minecraft version
2. Download the DelayBeGone JAR file for your Minecraft version
3. Place the JAR file in your `mods` folder
4. Launch Minecraft

## Building from Source

### Prerequisites
- Java 21 or higher
- Git

### Quick Build
```bash
git clone https://github.com/yourusername/delaybegone-neoforge.git
cd delaybegone-neoforge

# Build for a specific version
./gradlew build -PmcVersion=1.21.1

# Build all supported versions
./gradlew buildAll
```

### Development
```bash
# Run the client for testing
./gradlew runClient -PmcVersion=1.21.1

# Run the server
./gradlew runServer -PmcVersion=1.21.1
```

For detailed build instructions, see [BUILD.md](BUILD.md).

## How It Works

The mod uses [Mixin](https://github.com/SpongePowered/Mixin) to modify the `LivingEntity.isBlocking()` method, changing the hardcoded 5-tick delay requirement to 0 ticks. This is a minimal, targeted modification that doesn't affect any other game mechanics.

## Compatibility

- **Server-side required**: This mod must be installed on the server to function properly, as it modifies combat mechanics
- **Client installation**: Can also be installed on the client for consistency, but server installation is essential
- **Mod compatibility**: Should be compatible with most other mods as it only modifies shield blocking timing

## License

All Rights Reserved

## Contributing

This project uses an automated multi-version build system. When adding support for new Minecraft versions:

1. Create a new properties file in `versions/{version}.properties`
2. The Gradle tasks will automatically detect the new version
3. Update the GitHub Actions workflow matrix if using CI

See [CLAUDE.md](CLAUDE.md) for detailed development guidance.