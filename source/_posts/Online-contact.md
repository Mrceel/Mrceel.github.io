---
title: Hexo NexT主题内接入网页在线联系功能
date: 2017-04-30 20:10:35
tags: [Hexo]
categories: Hexo
---
<center>

** 首先在DaoVoice注册个账号，点击->[邀请码](#http://dashboard.daovoice.io/get-started?invite_code=0f81ff2f)是2e5d695d。 **
</center>
<!-- more -->

完成后，会得到一个app_id，后面会用到：
![图](/Online-contact/app-id.png)


修改/themes/next/layout/_partials/head.swig文件，添加内容如下：
```
{% if theme.daovoice %}
  <script>
  (function(i,s,o,g,r,a,m){i["DaoVoiceObject"]=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;a.charset="utf-8";m.parentNode.insertBefore(a,m)})(window,document,"script",('https:' == document.location.protocol ? 'https:' : 'http:') + "//widget.daovoice.io/widget/0f81ff2f.js","daovoice")
  daovoice('init', {
      app_id: "{{theme.daovoice_app_id}}"
    });
  daovoice('update');
  </script>
{% endif %}
```
复制以上代码,放到下图俩红框之间
![图](/Online-contact/weizhi.jpg)

在  主题配置`_config.yml`文件中添加内容：
```
# Online contact
daovoice: true
daovoice_app_id:   # 这里填你刚才获得的 app_id
```