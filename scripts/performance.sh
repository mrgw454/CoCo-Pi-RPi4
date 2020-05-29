
for cpugov in `cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor` 
do 
    echo  "Current CPU governor mode: $cpugov"
done

for cpufreq in `cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq`
do
    echo "Current CPU frequency: $cpufreq"
done

echo "performance" |sudo tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

