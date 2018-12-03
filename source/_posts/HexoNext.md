---
title: HexoNext 深度自定义，修改样式及布局
date: 2018-10-16 12:53:31
tags: [Hexo]
categories: Hexo
---
找找找，改改改。想要了解一个东西必须要折腾。折腾的多了就明白他是怎么一回事了！！
<!-- more -->

## 修改导航样式
设置导航图标与文字水平显示, 如下代码第四行最后面
```swig theme/next/layout/_macro/menu/menu-item.swig
<li class="menu-item menu-item-{{ itemName | replace(' ', '-', 'g') }}{{ item_active(itemURL, 'menu-item-active') }}">
    <a href="{{ url_for(itemURL) }}" rel="section">
    {%- if theme.menu_settings.icons %}
      <i class="menu-item-icon fa fa-fw fa-{{ value.split('||')[1] | trim | default('question-circle') }}"></i>  这里的<br />去掉  {#
  #}{% endif %}

    {{- __('menu.' + name ) | replace('menu.', '') -}}

    {%- if theme.menu_settings.badges -%}
      {{- menu_badge.render(name) | trim -}}
    {%- endif -%}

    </a>
  </li>
```
还有一个搜索的需要单独去掉
```swig themes\next6\layout\_partials\header\menu.swig
<li class="menu-item menu-item-search">
    {% if theme.swiftype_key %}
    <a href="javascript:;" class="st-search-show-outputs">
    {% elseif theme.local_search.enable || theme.algolia_search.enable %}
    <a href="javascript:;" class="popup-trigger">
    {% endif %}
    {% if theme.menu_settings.icons %}
        <i class="menu-item-icon fa fa-search fa-fw"></i> {# 直接注释或者删除即可 <br /> #}{#
    #}{% endif %}{#
    #}{{ __('menu.search') }}{#
#}</a>
</li>
```
## 接入网页在线联系功能

** 首先在DaoVoice注册个账号，点击->[邀请码](#http://dashboard.daovoice.io/get-started?invite_code=0f81ff2f)是2e5d695d。 **

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