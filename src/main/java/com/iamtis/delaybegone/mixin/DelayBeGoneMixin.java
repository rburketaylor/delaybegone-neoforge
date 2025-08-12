package com.iamtis.delaybegone.mixin;

import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.Constant;
import org.spongepowered.asm.mixin.injection.ModifyConstant;

@Mixin(net.minecraft.world.entity.LivingEntity.class)
public class DelayBeGoneMixin {
    /**
     * Remove shield block delay by changing the required duration from 5 ticks to 0
     */
    @ModifyConstant(method = "isBlocking", constant = @Constant(intValue = 5))
    private int removeShieldDelay(int original) {
        return 0;
    }
}