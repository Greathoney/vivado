connect -url tcp:127.0.0.1:3121
source C:/Users/thyoo/vivado/ps_textlcd/ps_textlcd.sdk/system_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB Port_#0002.Hub_#0003"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Platform Cable USB Port_#0002.Hub_#0003" && level==0} -index 1
fpga -file C:/Users/thyoo/vivado/ps_textlcd/ps_textlcd.sdk/system_wrapper_hw_platform_0/system_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB Port_#0002.Hub_#0003"} -index 0
loadhw -hw C:/Users/thyoo/vivado/ps_textlcd/ps_textlcd.sdk/system_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB Port_#0002.Hub_#0003"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Platform Cable USB Port_#0002.Hub_#0003"} -index 0
dow C:/Users/thyoo/vivado/ps_textlcd/ps_textlcd.sdk/ps_textlcd/Debug/ps_textlcd.elf
configparams force-mem-access 0
bpadd -addr &main
