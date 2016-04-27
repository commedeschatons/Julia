onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_julia_worker/tb_clk
add wave -noupdate /tb_julia_worker/tb_n_rst
add wave -noupdate /tb_julia_worker/tb_x
add wave -noupdate /tb_julia_worker/tb_y
add wave -noupdate /tb_julia_worker/tb_JW_start
add wave -noupdate /tb_julia_worker/tb_MC_busy
add wave -noupdate /tb_julia_worker/tb_JW_ready
add wave -noupdate /tb_julia_worker/tb_JW_done
add wave -noupdate /tb_julia_worker/DUT/calc_start
add wave -noupdate /tb_julia_worker/DUT/calc_done
add wave -noupdate /tb_julia_worker/DUT/convert_start
add wave -noupdate /tb_julia_worker/DUT/convert_done
add wave -noupdate /tb_julia_worker/DUT/WCU/state
add wave -noupdate /tb_julia_worker/DUT/WCU/next_state
add wave -noupdate /tb_julia_worker/testcase
add wave -noupdate /tb_julia_worker/tb_pixel
add wave -noupdate /tb_julia_worker/tb_c_real_in
add wave -noupdate /tb_julia_worker/tb_c_imag_in
add wave -noupdate /tb_julia_worker/DUT/PIXEL_CALCULATOR/z_real_out
add wave -noupdate /tb_julia_worker/DUT/PIXEL_CALCULATOR/z_real_old_wire
add wave -noupdate /tb_julia_worker/DUT/PIXEL_CALCULATOR/z_real_old_next
add wave -noupdate /tb_julia_worker/DUT/PIXEL_CALCULATOR/z_real_in
add wave -noupdate /tb_julia_worker/DUT/PIXEL_CALCULATOR/z_imag_out
add wave -noupdate /tb_julia_worker/DUT/PIXEL_CALCULATOR/z_imag_old_wire
add wave -noupdate /tb_julia_worker/DUT/PIXEL_CALCULATOR/z_imag_old_next
add wave -noupdate /tb_julia_worker/DUT/PIXEL_CALCULATOR/z_imag_in
add wave -noupdate -radix decimal /tb_julia_worker/DUT/PIXEL_CALCULATOR/size_squared_out
add wave -noupdate /tb_julia_worker/DUT/PIXEL_CALCULATOR/second_iter_next
add wave -noupdate /tb_julia_worker/DUT/PIXEL_CALCULATOR/second_iter
add wave -noupdate /tb_julia_worker/DUT/PIXEL_CALCULATOR/rollover_flag
add wave -noupdate /tb_julia_worker/DUT/PIXEL_CALCULATOR/pixel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {22128 ps} 0}
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
WaveRestoreZoom {0 ps} {52500 ps}
