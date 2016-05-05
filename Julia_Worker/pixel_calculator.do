onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_pixel_calculator/tb_clk
add wave -noupdate /tb_pixel_calculator/tb_n_rst
add wave -noupdate /tb_pixel_calculator/tb_calc_start
add wave -noupdate /tb_pixel_calculator/tb_calc_done
add wave -noupdate /tb_pixel_calculator/tb_z_real_in
add wave -noupdate /tb_pixel_calculator/tb_z_imag_in
add wave -noupdate /tb_pixel_calculator/tb_c_real_in
add wave -noupdate /tb_pixel_calculator/tb_c_imag_in
add wave -noupdate /tb_pixel_calculator/tb_z_real_out
add wave -noupdate /tb_pixel_calculator/tb_z_imag_out
add wave -noupdate /tb_pixel_calculator/tb_size_squared_out
add wave -noupdate /tb_pixel_calculator/tb_iteration_in
add wave -noupdate -radix unsigned /tb_pixel_calculator/tb_pixel
add wave -noupdate /tb_pixel_calculator/testcase
add wave -noupdate /tb_pixel_calculator/DUT/rollover_flag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {134225 ps} 0}
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
WaveRestoreZoom {0 ps} {328128 ps}
