#!/bin/bash

# 初始化变量
add=0
del=0

# 获取 Git log 数据，并进行处理
git log --author="提交者姓名或邮箱" --since="起始日期" --until="结束日期" --pretty=tformat: --numstat | while read -r line; do
    # 提取每行的新增行数和删除行数
    add_lines=$(echo "$line" | awk '{print $1}')
    del_lines=$(echo "$line" | awk '{print $2}')

    # 累加新增行数和删除行数
    add=$((add + add_lines))
    del=$((del + del_lines))
done

# 输出结果
echo "新增行数: $add"
echo "删除行数: $del"
echo "总修改行数: $((add + del))"

#给脚本添加权限 Linux、macOS
# chmod +x git_log_stats.sh
