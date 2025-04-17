#Touch Button
set_property -dict {PACKAGE_PIN T2 IOSTANDARD LVCMOS33} [get_ports C] ;#BTN1
set_property -dict {PACKAGE_PIN M1 IOSTANDARD LVCMOS33} [get_ports B] ;#BTN2
set_property -dict {PACKAGE_PIN P3 IOSTANDARD LVCMOS33} [get_ports A] ;#BTN3

#LEDS
set_property -dict {PACKAGE_PIN B24 IOSTANDARD LVCMOS33} [get_ports F]


set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]