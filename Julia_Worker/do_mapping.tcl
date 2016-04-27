# Step 1:  Read in the source file
analyze -format sverilog -lib WORK {pixel2color.sv z_calculator.sv fixed_multiplication.sv flex_counter.sv addr_calculator.sv real2imag.sv wcu.sv pixel_calculator.sv julia_worker.sv}
elaborate julia_worker -lib WORK
uniquify
# Step 2: Set design constraints
# Uncomment below to set timing, area, power, etc. constraints
# set_max_delay <delay> -from "<input>" -to "<output>"
# set_max_area <area>
# set_max_total_power <power> mW


# Step 3: Compile the design
compile -map_effort medium

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1 -nworst 1 > reports/julia_worker.rep
report_area >> reports/julia_worker.rep
report_power -hier >> reports/julia_worker.rep

# Step 5: Output final VHDL and Verilog files
write_file -format verilog -hierarchy -output "mapped/julia_worker.v"
echo "\nScript Done\n"
echo "\nChecking Design\n"
check_design
quit
