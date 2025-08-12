package com.iamtis.delaybegone.mixin;

import org.spongepowered.asm.mixin.Final;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.Mutable;
import org.spongepowered.asm.mixin.Shadow;

@Mixin(net.minecraft.world.item.ShieldItem.class)
public class DelayBeGoneMixin {
    @Shadow
    @Final
    @Mutable
    public static int EFFECTIVE_BLOCK_DELAY = 0;
}