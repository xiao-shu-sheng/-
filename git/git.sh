# 在现有项目中初始化仓库
git init 

# 克隆
git clone https://github.com/username/repo.git

# 添加所有改动，放入暂存区
git add .

# 添加.c文件，放入暂存区
git add *.c

# 添加多个文件，放入暂存区
git add *.c *.h

# 添加单个文件，放入暂存区
git add file.c

# 添加文件夹(dir)，放入暂存区
git add dir

# 删除文件
git rm file.c

# 删除文件夹(dir)
git rm -r dir

# 删除多个文件
git rm -r file1.c file2.c

# 提交
git commit -m "commit message"

# 查看状态
git status

# 查看历史记录
git log

# 显示每次提交的内容差异
git log -p

# 显示每次提交的文件差异 -n, 最近n次提交
git log -p -n

# 查看提交记录，显示提交的哈希值、提交消息和作者信息
# --oneline 选项的作用是将每个提交的信息压缩到一行中
# <commit_hash> <commit_message> (<author>)
git log --oneline

# 查看每次提交的简略的统计信息
git log --stat

# 查看文件历史记录
git log -- file.c

# 查看文件完整历史记录，包括 文件被重命名或移动 的历史
git log --follow file.c

# 查看暂存文件的改动
git diff

# 自动将所有已跟踪的文件的变化添加到暂存区（stage）
# 创建一个新的提交，并附上提交消息
# 将提交添加到仓库的历史记录中
git commit -a -m "commit message"


# 文件重命名
git mv file1.c file2.c


# git log --pretty=format:

# 提交对象(commit)的完整哈希值
git log --pretty=format:"%H"

# 提交对象(commit)的简短哈希值
git log --pretty=format:"%h"

# 数对象(tree)的完整哈希值
git log --pretty=format:"%T"

# 数对象(tree)的简短哈希值
git log --pretty=format:"%t"

# 父对象(parent)的完整哈希值
git log --pretty=format:"%P"

# 父对象(parent)的简短哈希值
git log --pretty=format:"%p"

# 作者的名字
git log --pretty=format:"%an"

# 作者的邮箱
git log --pretty=format:"%ae"

# 作者修订日期(可以用--date=raw或--date=rfc或--date=iso或--date=local)
git log --pretty=format:"%ad"

# 作者的修订日期，按多久前的格式显示
git log --pretty=format:"%ar"

# 提交者的(committer)名字
git log --pretty=format:"%cn"

# 提交者的(committer)邮箱
git log --pretty=format:"%ce"

# 提交日期
git log --pretty=format:"%cd"

# 提交日期，按多久前的格式显示
git log --pretty=format:"%cr"

# 提交说明
git log --pretty=format:"%s"

# 提交者在某段时间内提交的所有代码行数,包括增加的、删除的和修改的行数
git log --author=<> --since=<YYYY-MM-DD> --until=<YYYY-MM-DD> --numstat --summary
git log --author="提交者姓名或邮箱" --since="起始日期" --until="结束日期" --pretty=tformat: --numstat

# 这个命令适用于支持awk的Linux和macOS
# git log --author="提交者姓名或邮箱" --since="起始日期" --until="结束日期" --pretty=tformat: --numstat | awk '{add+=$1; del+=$2} END {print "新增行数:", add, "删除行数:", del, "总修改行数:", add+del}'


# 提交者在某段时间内提交的所有代码行数,包括增加的、删除的和修改的行数总数
git log --author=<> --since=<YYYY-MM-DD> --until=<YYYY-MM-DD> --shortstat --summary

# 显示每次更新的文件修改统计信息
git log -stat

# 只显示--stat中最后的行数修改添加移除统计
git log -stat -1

# 仅在提交信息后显示已修改的文件清单
git log --pretty=format:"%s" --name-only

# 显示新增、删除和修改的文件清单
git log --pretty=format:"%s" --name-status

# 仅显示 SHA-1 的前几个字符，而非所有的 40 个字符
git log --oneline --abbrev-commit

# 显示 ASCII 图形表示的分支合并历史。
git log --graph

# 用 --author 选项显示指定作者的提交，用 --grep 选项搜索提交说明中的关键字
git log --author="提交者姓名或邮箱" --grep="关键字" --all-match

# 如果想找出添加或移除了某一个特定函数的引用的提交
git log -S"函数名"

# 仅显示指定提交者相关的提交
git log --commiter="提交者姓名或邮箱"

# 查询某段时间内 xx提交的但未合并的测试文件
git log --pretty="%h %s" --author="提交者姓名或邮箱" --since="起始日期" --until="结束日期" --no-merges --t

# 如果漏掉了几个文件或者提交信息写错了
git commit --amend

# 这个命令会将暂存区中的文件提交。 如果自上次提交以来你还未做任何修改（例如，在上次提交后马上执行了此命令），那么快照会保持不变，而你所修改的只是提交信息。

# 文本编辑器启动后，可以看到之前的提交信息。 编辑后保存会覆盖原来的提交信息例如：
# 最终你只会有一个提交 - 第二次提交将代替第一次提交的结果
git commit -m 'initial commit'
git add forgotten_file
git commit --amend

# 查看远程仓库
git remote -v

# 添加远程仓库 git remote add <shortname> <url>
git remote add origin https://github.com/username/repo.git

# 使用字符串 origin 来代替整个 URL，从远程仓库获取数据
git fetch origin

# 推送到远程仓库git push [remote-name] [branch-name]
git push origin master

# 查看远程仓库信息 git remote show [remote-name]
git remote show origin

# 修改远程仓库的名字 git remote rename [old-name] [new-name]
git remote rename origin upstream

# 删除远程仓库 git remote rm [remote-name]
git remote rm upstream

# 打标签 -a：指定创建一个带注释的标签
# v1.0：指定标签名
# -m：指定标签说明
# "Version 1.0"：指定标签的注释内容
git tag -a v1.0 -m "Version 1.0"

# 查看标签
git tag

# 列出所有标签，包括注释
git tag -n

# 列出所有标签，包括注释和日期
git tag -n -l

# 使用特定的模式查找标签
git tag -l "pattern"

# 例如 git tag -l 'v1.8.5*'查出的结果
# v1.8.5.1
# v1.8.5.2
# v1.8.5.3

# 查看标签信息
git show "v1.8.5"


# 如果某个记录忘记打标签了
git log --pretty=oneline

# 9fceb02d0ae598e95dc970b74767f19372d61af8 updated rakefile
# 8a5cbc430f1a9c3d00faaeffd07798508422908a updated readme

# 找到对应的提交记录，打标签
git tag -a v1.8.5 -m "Version 1.8.5" 9fceb02d0ae598e95dc970b74767f19372d61af8

# 打完标签需要显示的将对应的标签推到远端 git push origin [tagname]
git push origin v1.8.5

# 如果需要一次性推送很多标签使用 --tags
git push origin --tags

# 如果需要工作目录与仓库中的特定标签版本完全一致，可以使用git checkout -b [branchname] [tagname]
git checkout -b v1.8.5 v1.8.5

# 创建一个新的分支 git branch [branchname]
git branch new-branch

# 切换分支 git checkout [branchname]
git checkout new-branch

# 删除分支 git branch -d [branchname]
git branch -d new-branch

# 查看当前各个分支所指向的对象
git log --oneline --decorated

# 查看分叉历史，它会输出你的提交历史、各个分支的指向以及项目的分支分叉情况
git log --oneline --decorated --graph --all

# 删除远程分支
git push origin --delete feature-branch

# 将本地的f1分支合并到master分支
git checkout master
git merge f1

# 查看每一个分支最后一次提交
# -v：指定显示分支的详细信息，包括分支的名称、提交哈希值和提交信息
# -v（第二个）：指定显示分支的追踪信息，包括远程分支的名称和提交哈希值
git branch -vv

# 查看所有未合并工作的分支
git branch --no-merged

# b分支合并a分支上的某个提交节点
# 1、在a分支上查看提交历史
git checkout a
git log

# 2、切回到b分支，并合并某次commit
git checkout b
git cherry-pick <commit-id>

# 设置本地分支的远程分支，没有自动跟踪
git branch -u origin/master
git branch --set-upstream-to=origin/master

# 设置本地分支的远程分支，自动跟踪
git branch --track origin/master


# 变基操作
# 原理：
# 1、创建一个新的分支
# 2、在新的分支上执行变基操作
# 3、把新的分支推送到远程仓库
# 4、删除本地分支

# 1、创建一个新的分支
git checkout -b new-branch

# 2、在新的分支上执行变基操作
git rebase master

# 3、把新的分支推送到远程仓库,建议在rebase之后执行 --force-with-lease,防止冲突
git push origin new-branch --force-with-lease

# 如果是第一次推送可以使用 -u
git push -u origin new-branch --force-with-lease

# 4、删除本地分支
git branch -d new-branch