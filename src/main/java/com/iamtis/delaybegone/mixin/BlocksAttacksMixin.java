package com.iamtis.delaybegone.mixin;

import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.Overwrite;
import org.spongepowered.asm.mixin.Pseudo;

@Pseudo
@Mixin(targets = "net.minecraft.world.item.component.BlocksAttacks", remap = false)
public class BlocksAttacksMixin {
    /**
     * Remove block attack delay to improve combat responsiveness
     * This mixin targets Minecraft versions 1.21.5+ where the delay moved to BlocksAttacks.blockDelayTicks()
     * 
     * @reason Remove block attack delay by always returning 0 ticks
     * @author DelayBeGone
     */
    @Overwrite
    public int blockDelayTicks() {
        return 0;
    }
}