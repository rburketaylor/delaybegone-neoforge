package com.iamtis.delaybegone.mixin;

import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.Constant;
import org.spongepowered.asm.mixin.injection.ModifyConstant;

@Mixin(value = net.minecraft.world.entity.LivingEntity.class, remap = true)
public class DelayBeGoneMixin {
    /**
     * Remove shield block delay by changing the required duration from 5 ticks to 0
     * This mixin targets Minecraft versions before 1.21.5 where the delay was in LivingEntity.isBlocking()
     */
    @ModifyConstant(method = "isBlocking", constant = @Constant(intValue = 5), require = 0)
    private int removeShieldDelay(int original) {
        return 0;
    }
}