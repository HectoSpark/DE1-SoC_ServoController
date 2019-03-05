onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ServoController_tb/dut/clock
add wave -noupdate /ServoController_tb/dut/load
add wave -noupdate /ServoController_tb/dut/duty
add wave -noupdate /ServoController_tb/dut/counter
add wave -noupdate /ServoController_tb/dut/clockdiv
add wave -noupdate -divider {New Divider}
add wave -noupdate -radix unsigned /ServoController_tb/dut/pwmgen/clockdiv
add wave -noupdate -radix unsigned /ServoController_tb/dut/pwmgen/duty
add wave -noupdate -radix unsigned -childformat {{{/ServoController_tb/dut/pwmgen/counter[11]} -radix unsigned} {{/ServoController_tb/dut/pwmgen/counter[10]} -radix unsigned} {{/ServoController_tb/dut/pwmgen/counter[9]} -radix unsigned} {{/ServoController_tb/dut/pwmgen/counter[8]} -radix unsigned} {{/ServoController_tb/dut/pwmgen/counter[7]} -radix unsigned} {{/ServoController_tb/dut/pwmgen/counter[6]} -radix unsigned} {{/ServoController_tb/dut/pwmgen/counter[5]} -radix unsigned} {{/ServoController_tb/dut/pwmgen/counter[4]} -radix unsigned} {{/ServoController_tb/dut/pwmgen/counter[3]} -radix unsigned} {{/ServoController_tb/dut/pwmgen/counter[2]} -radix unsigned} {{/ServoController_tb/dut/pwmgen/counter[1]} -radix unsigned} {{/ServoController_tb/dut/pwmgen/counter[0]} -radix unsigned}} -subitemconfig {{/ServoController_tb/dut/pwmgen/counter[11]} {-radix unsigned} {/ServoController_tb/dut/pwmgen/counter[10]} {-radix unsigned} {/ServoController_tb/dut/pwmgen/counter[9]} {-radix unsigned} {/ServoController_tb/dut/pwmgen/counter[8]} {-radix unsigned} {/ServoController_tb/dut/pwmgen/counter[7]} {-radix unsigned} {/ServoController_tb/dut/pwmgen/counter[6]} {-radix unsigned} {/ServoController_tb/dut/pwmgen/counter[5]} {-radix unsigned} {/ServoController_tb/dut/pwmgen/counter[4]} {-radix unsigned} {/ServoController_tb/dut/pwmgen/counter[3]} {-radix unsigned} {/ServoController_tb/dut/pwmgen/counter[2]} {-radix unsigned} {/ServoController_tb/dut/pwmgen/counter[1]} {-radix unsigned} {/ServoController_tb/dut/pwmgen/counter[0]} {-radix unsigned}} /ServoController_tb/dut/pwmgen/counter
add wave -noupdate -radix unsigned /ServoController_tb/dut/pwmgen/PWMOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7772117 ps} 0} {{Cursor 2} {100127270000 ps} 0} {{Cursor 3} {0 ps} 0} {{Cursor 4} {101628710000 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 295
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ms
update
WaveRestoreZoom {0 ps} {175370401500 ps}
