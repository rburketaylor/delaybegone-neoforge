package com.iamtis.delaybegone;

import org.slf4j.Logger;

import com.mojang.logging.LogUtils;

import net.neoforged.bus.api.IEventBus;
import net.neoforged.fml.ModContainer;
import net.neoforged.fml.common.Mod;

@Mod(DelayBeGone.MODID)
public class DelayBeGone {
    public static final String MODID = "delaybegone";
    public static final Logger LOGGER = LogUtils.getLogger();

    public DelayBeGone(IEventBus modEventBus, ModContainer modContainer) {
        LOGGER.info("DelayBeGone initialized - removing block attack delay");
    }
}
