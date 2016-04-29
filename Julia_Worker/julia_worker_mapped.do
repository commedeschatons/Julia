onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_julia_worker/tb_clk
add wave -noupdate /tb_julia_worker/tb_n_rst
add wave -noupdate -radix unsigned /tb_julia_worker/tb_x
add wave -noupdate -radix hexadecimal /tb_julia_worker/tb_y
add wave -noupdate /tb_julia_worker/tb_JW_start
add wave -noupdate /tb_julia_worker/tb_MC_done
add wave -noupdate /tb_julia_worker/tb_JW_ready
add wave -noupdate /tb_julia_worker/tb_JW_done
add wave -noupdate /tb_julia_worker/tb_color
add wave -noupdate /tb_julia_worker/tb_address
add wave -noupdate /tb_julia_worker/tb_c_real_in
add wave -noupdate /tb_julia_worker/tb_c_imag_in
add wave -noupdate /tb_julia_worker/testcase
add wave -noupdate -radix unsigned /tb_julia_worker/DUT/PIXEL_CALCULATOR/size_squared_out
add wave -noupdate -radix unsigned /tb_julia_worker/DUT/PIXEL_CALCULATOR/Z_CALCULATOR/size_squared_out
add wave -noupdate /tb_julia_worker/DUT/PIXEL_CALCULATOR/rollover_flag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {453394 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 192
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {2625 ns}
