vlib work
vlog TESSTBENCH.v MUX_REG.v PROJECT1.v
vsim -voptargs=+acc work.DSP_TB
add wave *
run -all
#quit -sim