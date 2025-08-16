# TODO List

## Documentation
- [ ] Add troubleshooting section for common build issues

## Future Enhancements
- [ ] Add support for Fabric versions alongside NeoForge

---

## Completed ✓
- [x] Fix OutOfMemoryError issues with increased heap size
- [x] Add fast/full build modes
- [x] Implement separate cache directories per version
- [x] Replace shell scripts with unified Gradle tasks
- [x] Add comprehensive .gitignore for build artifacts
- [x] Test build-cache performance improvements on second runs
- [x] Verify memory usage is stable with new cache directories
- [x] Update GitHub Actions release workflow to handle new cache structure
- [x] Add build time reporting to measure cache effectiveness
- [x] Consider adding option to build specific versions only (e.g., `./gradlew buildVersions -PversionsFilter=1.21.5,1.21.6`)
- [x] Add validation that cache directories don't exceed reasonable size limits
- [x] Investigate if daemon restarts are still needed with separated caches
- [x] Update README with new build options and cache management
- [x] Document cache cleaning procedures and when to use them
- [x] Investigate faster NeoForm alternatives or optimizations
- [x] Consider build parallelization for multiple versions
- [x] Add automatic version detection from Minecraft/NeoForge releases
- [x] Add input validation for build script parameters
- [x] Test builds on different operating systems
- [x] Verify all supported MC versions still build correctly
- [x] Test clean-cache functionality thoroughly