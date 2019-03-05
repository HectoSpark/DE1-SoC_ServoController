onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ServoController_tb/dut/pwmgen/clock
add wave -noupdate /ServoController_tb/dut/pwmgen/counterout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {999176487 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 269
configure wave -valuecolwidth 360
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
configure wave -timelineunits ns
update
WaveRestoreZoom {987801691 ps} {1027872063 ps}
