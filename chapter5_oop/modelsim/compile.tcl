# 1. 配置基础路径 (根据你的实际路径修改)
set PROJECT_ROOT "F:/My study/SV_study"
set WORK_LIB "work"

# 2. 如果工作库已存在则删除，确保干净编译
if [file exists $WORK_LIB] {
    vdel -all -lib $WORK_LIB
}
vlib $WORK_LIB
vmap work $WORK_LIB

# 3. 定义递归查找文件的过程 (Procedure)
proc find_sv_files {dir} {
    set files {}
    # 循环遍历当前目录下的所有内容
    foreach item [glob -nocomplain -directory $dir *] {
        if {[file isdirectory $item]} {
            # 如果是目录，递归调用
            set files [concat $files [find_sv_files $item]]
        } elseif {[file extension $item] == ".sv" || [file extension $item] == ".v"} {
            # 如果是 .sv 或 .v 文件，加入列表
            lappend files $item
        }
    }
    return $files
}

# 4. 获取所有源文件并编译
set all_sources [find_sv_files $PROJECT_ROOT]

foreach file $all_sources {
    puts "Compiling: $file"
    # 使用 -sv 开启 SystemVerilog 支持
    vlog -sv -work $WORK_LIB $file
}

# 5. 启动仿真 (假设顶层模块名为 top)
# -voptargs=+acc 是为了方便观察信号，防止优化掉
vsim -voptargs="+acc" work.sim_top

# 6. 添加信号并运行
# add wave -recursive *
# run -all