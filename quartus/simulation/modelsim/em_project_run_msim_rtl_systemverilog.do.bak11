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


vlog "C:/Users/elena/Documents/quartus_workspace/em_project/quartus/refresh_pll_720p_sim/refresh_pll_720p.vo"  
vlog "C:/Users/elena/Documents/quartus_workspace/em_project/quartus/refresh_pll_1080p_sim/refresh_pll_1080p.vo"

vlog -sv -work work +incdir+C:/Users/elena/Documents/quartus_workspace/em_project/quartus {C:/Users/elena/Documents/quartus_workspace/em_project/quartus/rom_p4.v}
vlog -sv -work work +incdir+C:/Users/elena/Documents/quartus_workspace/em_project/src {C:/Users/elena/Documents/quartus_workspace/em_project/src/reset.sv}
vlog -sv -work work +incdir+C:/Users/elena/Documents/quartus_workspace/em_project/src {C:/Users/elena/Documents/quartus_workspace/em_project/src/em_project.sv}
vlog -sv -work work +incdir+C:/Users/elena/Documents/quartus_workspace/em_project/src {C:/Users/elena/Documents/quartus_workspace/em_project/src/vtc.sv}
vlog -sv -work work +incdir+C:/Users/elena/Documents/quartus_workspace/em_project/src {C:/Users/elena/Documents/quartus_workspace/em_project/src/pixel_gen.sv}

vlog -sv -work work +incdir+C:/Users/elena/Documents/quartus_workspace/em_project/quartus/../src {C:/Users/elena/Documents/quartus_workspace/em_project/quartus/../src/tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb

add wave *
add wave -position end  sim:/tb/DUT/PIXEL_GEN/rom_addr
add wave -position end  sim:/tb/DUT/PIXEL_GEN/bar_cnt
add wave -position end  sim:/tb/DUT/PIXEL_GEN/pixel_cnt
add wave -position end  sim:/tb/DUT/PIXEL_GEN/line_cnt
view structure
view signals
run -all
