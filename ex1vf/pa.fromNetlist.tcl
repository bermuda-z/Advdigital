
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name ex1vf -dir "C:/Users/Bermuda/Desktop/ch2v/ex1vf/planAhead_run_2" -part xc3s400tq144-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Bermuda/Desktop/ch2v/ex1vf/ex2vf.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Bermuda/Desktop/ch2v/ex1vf} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "ex2vf.ucf" [current_fileset -constrset]
add_files [list {ex2vf.ucf}] -fileset [get_property constrset [current_run]]
link_design
