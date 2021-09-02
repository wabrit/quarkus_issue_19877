package com.erewhon;

import io.smallrye.config.ConfigMapping;

@ConfigMapping(prefix = "erewhon")
public interface ErewhonConfig {

  String user();

}
