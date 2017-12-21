onerror {quit -f}
vlib work
vlog -work work statecontroller.vo
vlog -work work statecontroller.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.statecontroller_vlg_vec_tst
vcd file -direction statecontroller.msim.vcd
vcd add -internal statecontroller_vlg_vec_tst/*
vcd add -internal statecontroller_vlg_vec_tst/i1/*
add wave /*
run -all
