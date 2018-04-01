
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name ex1vf -dir "C:/Users/Bermuda/Desktop/ch2v/ex1vf/planAhead_run_3" -part xc3s400tq144-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "ex2vf.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {ex2vf.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top ex2vf $srcset
add_files [list {ex2vf.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s400tq144-4
