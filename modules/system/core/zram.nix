{ config, ... }:

{

  # Enable ZRAM swap to improve performance on limited RAM
  zramSwap = {
    enable = true;
    algorithm = "lz4";                # Fast compression
    memoryPercent = 100;              # Use up to 100% of RAM for ZRAM
    priority = 999;                   # High swap priority
  };
}
