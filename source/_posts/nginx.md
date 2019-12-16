---
title: Nginx安装使用
date: 2019-06-28 12:53:31
tags: [Nginx]
categories: Nginx
---
说来惭愧，竟不知道Nginx的存在...
Nginx介绍：Nginx 是一个高性能的 Web 和反向代理服务器, 它具有有很多非常优越的特性:
- **作为 Web 服务器**：相比 Apache，Nginx 用更少的资源，支持更多的并发连接，体现更高的效率
- **作为负载均衡服务器**：Nginx 既可以在内部直接支持 Rails 和 PHP，也可以支持作为 HTTP代理服务器 对外进行服务
- **作为邮件代理服务器**: Nginx 同时也是一个非常优秀的邮件代理服务器（最早开发这个产品的目的之一也是作为邮件代理服务器）
- **Nginx 安装非常的简单**，配置文件 非常简洁（还能够支持perl语法），Bugs非常少的服务器: Nginx 启动特别容易，并且几乎可以做到7*24不间断运行，即使运行数个月也不需要重新启动。你还能够在 不间断服务的情况下进行软件版本的升级。
<!-- more -->
## 安装
[下载Nginx](http://nginx.org/en/download.html)
会下载一个Nginx压缩包，找个目录解压出来并打开，里面有一个`nginx.exe`运行该文件即可！
然后访问`127.0.0.1`出现以下页面便是成功安装了~
！[success](/nginx/success.jpg)
## 使用
在`nginx`根目录打开`cmd`
开启`nginx `
直接双击根目录下的 `nginx.exe` 文件，或者使用下面的命令
```
start nginx.exe  
```
停止nginx
```
nginx -s stop   //强制停止nginx服务器，如果有未处理的数据，丢弃

nginx -s quit  //优雅的停止nginx服务器，如果有未处理的数据，等待处理完成之后停止
```
其它命令
```
nginx -s reload ：修改配置后重新加载生效
nginx -s reopen ：重新打开日志文件
nginx -t -c /path/to/nginx.conf 测试nginx配置文件是否正确
```
## 配置
在`nginx`文件夹内有一个`conf`文件夹，其中有好几个文件，其他先不管，打开`nginx.conf`，找到`http`对象里面的`server`属性。
一个server相当于一个代理服务器，可以配置多个。
listen：表示当前的代理服务器监听的端口，默认的是监听80端口。注意，如果我们配置了多个server，这个listen要配置不一样，不然就不能确定转到哪里去了。
- `server_name`：表示监听到之后需要转到哪里去，这时我们直接转到本地，这时是直接到nginx文件夹内。
- `location`：表示匹配的路径，这时配置了/表示所有请求都被匹配到这里
- `root`：里面配置了root这时表示当匹配这个请求的路径时，将会在这个文件夹内寻找相应的文件。
- `index`：当没有指定主页时，默认会选择这个指定的文件，它可以有多个，并按顺序来加载，如果第一个不存在，则找第二个，依此类推。
- `error_page` 是代表错误的页面
