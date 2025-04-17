#DIP_SW:
set_property -dict {PACKAGE_PIN T3 IOSTANDARD LVCMOS33} [get_ports B] ;#B
set_property -dict {PACKAGE_PIN J3 IOSTANDARD LVCMOS33} [get_ports A] ;#A


#LEDS
set_property -dict {PACKAGE_PIN B24 IOSTANDARD LVCMOS33} [get_ports S]

set_property -dict {PACKAGE_PIN B20 IOSTANDARD LVCMOS33} [get_ports Cout]

#Touch Button
set_property -dict {PACKAGE_PIN T2 IOSTANDARD LVCMOS33} [get_ports en_n] ;#BTN1
set_property -dict {PACKAGE_PIN M1 IOSTANDARD LVCMOS33} [get_ports C] ;#BTN2



set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]