transcript on
if ![file isdirectory em_project_iputf_libs] {
	file mkdir em_project_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vlog "C:/Users/elena/Documents/quartus_workspace/em_project/quartus/refresh_pll_sim/refresh_pll.vo"

vlog -sv -work work +incdir+C:/Users/elena/Documents/quartus_workspace/em_project/src {C:/Users/elena/Documents/quartus_workspace/em_project/src/reset.sv}
vlog -sv -work work +incdir+C:/Users/elena/Documents/quartus_workspace/em_project/src {C:/Users/elena/Documents/quartus_workspace/em_project/src/em_project.sv}
vlog -sv -work work +incdir+C:/Users/elena/Documents/quartus_workspace/em_project/src {C:/Users/elena/Documents/quartus_workspace/em_project/src/vtc.sv}
vlog -sv -work work +incdir+C:/Users/elena/Documents/quartus_workspace/em_project/src {C:/Users/elena/Documents/quartus_workspace/em_project/src/pixel_gen.sv}

vlog -sv -work work +incdir+C:/Users/elena/Documents/quartus_workspace/em_project/quartus/../src {C:/Users/elena/Documents/quartus_workspace/em_project/quartus/../src/tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb

add wave *

add wave -position end  sim:/tb/DUT/PIXEL_GEN/B1_T_EDGE
add wave -position end  sim:/tb/DUT/PIXEL_GEN/b1_t_edge
add wave -position end  sim:/tb/DUT/PIXEL_GEN/B1_B_EDGE
add wave -position end  sim:/tb/DUT/PIXEL_GEN/b1_b_edge
add wave -position end  sim:/tb/DUT/PIXEL_GEN/B1_L_EDGE
add wave -position end  sim:/tb/DUT/PIXEL_GEN/b1_l_edge
add wave -position end  sim:/tb/DUT/PIXEL_GEN/B1_R_EDGE
add wave -position end  sim:/tb/DUT/PIXEL_GEN/b1_r_edge
add wave -position end  sim:/tb/DUT/PIXEL_GEN/in_box1
add wave -position end  sim:/tb/DUT/PIXEL_GEN/pixel_cnt
add wave -position end  sim:/tb/DUT/PIXEL_GEN/line_cnt
view structure
view signals
run -all
