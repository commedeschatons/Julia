onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_julia_worker/tb_clk
add wave -noupdate /tb_julia_worker/tb_n_rst
add wave -noupdate /tb_julia_worker/tb_x
add wave -noupdate /tb_julia_worker/tb_y
add wave -noupdate /tb_julia_worker/tb_JW_start
add wave -noupdate /tb_julia_worker/tb_MC_done
add wave -noupdate /tb_julia_worker/tb_JW_ready
add wave -noupdate /tb_julia_worker/tb_JW_done
add wave -noupdate -radix hexadecimal /tb_julia_worker/tb_color
add wave -noupdate -radix hexadecimal /tb_julia_worker/tb_address
add wave -noupdate /tb_julia_worker/tb_c_real_in
add wave -noupdate /tb_julia_worker/tb_c_imag_in
add wave -noupdate /tb_julia_worker/testcase
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4714175 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
configure wave -timelineunits ps
update
WaveRestoreZoom {4617223 ps} {4781287 ps}
