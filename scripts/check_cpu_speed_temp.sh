cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
/opt/vc/bin/vcgencmd measure_temp
vcgencmd get_config int | egrep "(arm|core|gpu|sdram)_freq|over_volt"
for src in arm core h264 isp v3d; do echo -e "$src:\t$(vcgencmd measure_clock $src)"; done
for id in core sdram_c sdram_i sdram_p ; do echo -e "$id:\t$(vcgencmd measure_volts $id)"; done
sudo grep clock /sys/kernel/debug/mmc0/ios

