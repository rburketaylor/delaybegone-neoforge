# TODO List

## High Priority
- [ ] Test build-cache performance improvements on second runs
- [ ] Verify memory usage is stable with new cache directories
- [ ] Update GitHub Actions release workflow to handle new cache structure

## Build System
- [ ] Add build time reporting to measure cache effectiveness
- [ ] Consider adding option to build specific versions only (e.g., `./gradlew buildVersions -PversionsFilter=1.21.5,1.21.6`)
- [ ] Add validation that cache directories don't exceed reasonable size limits
- [ ] Investigate if daemon restarts are still needed with separated caches

## Documentation
- [ ] Update README with new build options and cache management
- [ ] Document cache cleaning procedures and when to use them
- [ ] Add troubleshooting section for common build issues

## Future Enhancements
- [ ] Add support for Fabric versions alongside NeoForge
- [ ] Investigate faster NeoForm alternatives or optimizations
- [ ] Consider build parallelization for multiple versions
- [ ] Add automatic version detection from Minecraft/NeoForge releases

## Code Quality
- [ ] Add input validation for build script parameters
- [ ] Consider adding build configuration file for advanced options
- [ ] Add error recovery mechanisms for partial build failures

## Testing
- [ ] Test builds on different operating systems
- [ ] Verify all supported MC versions still build correctly
- [ ] Test clean-cache functionality thoroughly

---

## Completed ✓
- [x] Fix OutOfMemoryError issues with increased heap size
- [x] Add fast/full build modes
- [x] Implement separate cache directories per version
- [x] Replace shell scripts with unified Gradle tasks
- [x] Add comprehensive .gitignore for build artifacts