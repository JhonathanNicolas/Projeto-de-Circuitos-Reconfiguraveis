create_clock -period 10.000 -waveform {0.000 5.00} -name clkin [get_ports clk]
set_input_delay -clock clkin �-max 3.00 [get_ports reset]
set_input_delay -clock clkin �-min 1.00 [get_ports reset]
set_input_delay -clock clkin �-max 3.00 [get_ports sw]
set_input_delay -clock clkin �-min 0.50 [get_ports sw]
set_input_delay -clock clkin �-max 3.00 [get_ports start]
set_input_delay -clock clkin �-min 0.50 [get_ports start]
set_input_delay -clock clkin �-max 3.00 [get_ports adress[0]]
set_input_delay -clock clkin �-min 0.50 [get_ports adress[0]]
set_input_delay -clock clkin �-max 3.00 [get_ports adress[1]]
set_input_delay -clock clkin �-min 0.50 [get_ports adress[1]]
set_input_delay -clock clkin �-max 3.00 [get_ports adress[2]]
set_input_delay -clock clkin �-min 0.50 [get_ports adress[2]]
set_input_delay -clock clkin �-max 3.00 [get_ports adress[3]]
set_input_delay -clock clkin �-min 0.50 [get_ports adress[3]]
set_input_delay -clock clkin �-max 3.00 [get_ports adress[4]]
set_input_delay -clock clkin �-min 0.50 [get_ports adress[4]]
set_input_delay -clock clkin �-max 3.00 [get_ports adress[5]]
set_input_delay -clock clkin �-min 0.50 [get_ports adress[5]]
set_input_delay -clock clkin �-max 3.00 [get_ports adress[6]]
set_input_delay -clock clkin �-min 0.50 [get_ports adress[6]]
set_input_delay -clock clkin �-max 3.00 [get_ports adress[7]]
set_input_delay -clock clkin �-min 0.50 [get_ports adress[7]]
set_output_delay -clock clkin 8 [get_ports led[0]]
set_output_delay -clock clkin 8 [get_ports led[1]]
set_output_delay -clock clkin 8 [get_ports led[2]]
set_output_delay -clock clkin 8 [get_ports led[3]]
set_output_delay -clock clkin 8 [get_ports led[4]]
set_output_delay -clock clkin 8 [get_ports led[5]]
set_output_delay -clock clkin 8 [get_ports led[6]]
set_output_delay -clock clkin 8 [get_ports led[7]]
set_output_delay -clock clkin 8 [get_ports led[8]]
set_output_delay -clock clkin 8 [get_ports led[9]]
set_output_delay -clock clkin 8 [get_ports led[10]]
set_output_delay -clock clkin 8 [get_ports led[11]]
set_output_delay -clock clkin 8 [get_ports led[12]]
set_output_delay -clock clkin 8 [get_ports led[13]]
set_output_delay -clock clkin 8 [get_ports led[14]]
set_output_delay -clock clkin 8 [get_ports led[15]]
set_output_delay -clock clkin 8 [get_ports dp]