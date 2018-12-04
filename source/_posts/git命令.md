---
title: git命令
date: 2018-12-03
tags: [Git]
categories: Git
---
一些命令，用的时候记得牢牢的。过一段时间不用就忘记了，这里记录一下git的命令及其使用
<!-- more -->
## 拉取
把远程分支的代码pull到本地分支：git pull <远程主机名> <远程分支名>:<本地分支名>
## 删除
删除远程分支： git push oirgin --delete [branch name]
删除本地分支： git branch -d [branch name]
## 恢复
恢复： git reflog  查看版本号
恢复： git reset --hard [版本号]
## 分支
在本地新建一个分支： git branch <branch name>
切换到你的新分支: git checkout <branch name>
将新分支发布在github上： git push origin <branch name>

## 新建仓库提交代码
正确步骤：
1. git init //初始化仓库

2. git add .(文件name) //添加文件到本地仓库

3. git commit -m "first commit" //添加文件描述信息

4. git remote add origin + 远程仓库地址 //链接远程仓库，创建主分支

5. git pull origin master // 把本地仓库的变化连接到远程仓库主分支

6. git push -u origin master //把本地仓库的文件推送到远程仓库