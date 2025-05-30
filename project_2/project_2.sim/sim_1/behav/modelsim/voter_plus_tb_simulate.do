######################################################################
#
# File name : voter_plus_tb_simulate.do
# Created on: Sun Apr 13 14:07:44 +0800 2025
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vsim -voptargs="+acc" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.voter_plus_tb xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {voter_plus_tb_wave.do}

view wave
view structure
view signals

do {voter_plus_tb.udo}

run 1000ns
