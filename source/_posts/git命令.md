---
title: git命令
date: 2018-10-23
tags: [Git]
categories: Git
---
一些命令，用的时候记得牢牢的。过一段时间不用就忘记了，这里记录一下git的命令及其使用
<!-- more -->
## 拉取
把远程分支的代码pull到本地分支：git pull <远程主机名> <远程分支名>:<本地分支名>
## 连接已有仓库
`git remote add origin <https://github.com/OliveKong/poster.git> `
## 删除
删除远程分支： git push oirgin --delete [branch name]
删除本地分支： git branch -d [branch name]
## 恢复
恢复： git reflog  查看版本号
恢复： git reset --hard [版本号]
## 分支
__新建__
在本地新建一个分支： git branch <branch name>
切换到你的新分支: git checkout <branch name>
将新分支发布在github上： git push origin <branch name>
__拉取__
* 情况一：目前本地还没拉代码，直接拉分支代码
    `git clone -b <you branchName> <you git path>`
* 情况二：本地已经拉取了代码，想拉取远程某一分支的代码到本地
`git checkout -b <branch name> origin/<branch name>`   拉取远程分支到本地(方式一)
`git fetch origin <branch name>:<branch name>`   拉取远程分支到本地(方式二)

方式一有可能出现错误提示：

`fatal: 'origin/ac_branch' is not a commit and a branch 'ac_branch' cannot be created from it`

解决方式:

执行命令：`git fetch`    同步一下仓库

__最容易出错的操作__

`git checkout -b ac_branch`        这是在当前分支上创建一个`ac_branch`分支

`git checkout -b ac_branch origin/ac_branch`   这才是拉取远程分支`ac_branch`到本地

__方式一、二的区别__
方式一做了三件事：

1、拉取远程分支到本地

2、在本地创建一个分支与远程分支对应

3、自动切换到刚创建好的分支

方式二做了三件事：

1、同步远程仓库（git fetch origin）

2、拉取远程分支到本地

3、在本地创建一个分支与远程分支对应

## 新建仓库提交代码
正确步骤：
1. git init //初始化仓库

2. git add .(文件name) //添加文件到本地仓库

3. git commit -m "first commit" //添加文件描述信息

4. git remote add origin + 远程仓库地址 //链接远程仓库，创建主分支

5. git pull origin master // 把本地仓库的变化连接到远程仓库主分支

6. git push -u origin master //把本地仓库的文件推送到远程仓库










参考：https://www.jianshu.com/p/16e35060c64e