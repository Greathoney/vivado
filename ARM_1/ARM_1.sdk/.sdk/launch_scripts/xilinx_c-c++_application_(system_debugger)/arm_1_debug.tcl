connect -url tcp:127.0.0.1:3121
source C:/Users/thyoo/ARM_1/ARM_1.sdk/system_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB Port_#0003.Hub_#0004"} -index 0
loadhw -hw C:/Users/thyoo/ARM_1/ARM_1.sdk/system_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB Port_#0003.Hub_#0004"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Platform Cable USB Port_#0003.Hub_#0004"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Platform Cable USB Port_#0003.Hub_#0004"} -index 0
dow C:/Users/thyoo/ARM_1/ARM_1.sdk/ARM_1/Debug/ARM_1.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Platform Cable USB Port_#0003.Hub_#0004"} -index 0
con
