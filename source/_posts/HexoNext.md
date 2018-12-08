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
![图](/_posts/Online-contact/app-id.png)


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

## 自定义about页面（完完全全的自定义）
首先要创建about页面（使用官方方式）
```
hexo new page "about"
```
这个时候在`博客目录/source/` 下就会出现 `about` 文件夹，编辑里面的 `index.md` 文件，添加：
```
---
title: 关于
date: 2018-03-12 17:44:53
type: "about"
comments: false # 此处为禁用评论功能， 如果你想有评论 设置为true或者去掉该行代码即可。
---
```
接下来说下实现自定义具体步骤：
1. 打开主题目录 在 `layout` 文件夹下新建 `about.swig` wen 
1. 打开主题目录下的 `layout/page.swig`  大概10多行
```
  {% block title %}{#
    #}{% set page_title_suffix = ' | ' + title %}{#
    #}{% if page.type === "categories" and not page.title %}{#
      #}{{ __('title.category') + page_title_suffix }}{#
    #}{% elif page.type === "tags" and not page.title %}{#
      #}{{ __('title.tag') + page_title_suffix }}{#

    {# 添加下面两行代码 #}
    #}{% elif page.type === "about" and not page.title %}{#
      #}{{ __('title.about') + page_title_suffix }}{#



    #}{% else %}{#
      #}{{ page.title + page_title_suffix }}{#
    #}{% endif %}{#
  #}{% endblock %}
```
1. 接下来往下大概50行左右的位置添加：
```
<div class="post-body{% if theme.han %} han-init-context{% endif %}{% if page.direction && page.direction.toLowerCase() === 'rtl' %} rtl{% endif %}">
  {# tagcloud page support #}
  {% if page.type === "tags" %}
    <div class="tag-cloud">
      <div class="tag-cloud-title">
          {% set visibleTags = 0 %}
          {% for tag in site.tags %}
            {% if tag.length %}
              {% set visibleTags += 1 %}
            {% endif %}
          {% endfor %}
          {{ _p('counter.tag_cloud', visibleTags) }}
      </div>
      <div class="tag-cloud-tags">
        {{ tagcloud({min_font: 12, max_font: 30, amount: 300, color: true, start_color: '#ccc', end_color: '#111'}) }}
      </div>
    </div>
  {% elif page.type === 'categories' %}
    <div class="category-all-page">
      <div class="category-all-title">
          {% set visibleCategories = 0 %}
          {% for cat in site.categories %}
            {% if cat.length %}
              {% set visibleCategories += 1 %}
            {% endif %}
          {% endfor %}
          {{ _p('counter.categories', visibleCategories) }}
      </div>
      <div class="category-all">
        {{ list_categories() }}
      </div>
    </div>

  {# 此处添加判断是否为about #}
  {% elif page.type === 'about' %}
    <div class="about-page">
    
      这里放你的代码
      我是曹二丽
    </div>






  {% else %}
    {{ page.content }}
  {% endif %}
</div>
```
自此，你已经可以自定义about页面的布局等等了。
问题（可能你没有，如果有的话来瞅瞅）：
1. 页面的title  例如标签页面是 `标签|八小时之外` 所添加的about页面的title可能是 ` |八小时之外`
问题解决： 打开主题目录的 `languages/zh-CN.yml`, 
在 `title` 下添加:
```
---
title:
  archive: 归档
  category: 分类
  tag: 标签
  about: 关于  # 这里添加一下即可！
  schedule: 日程表
menu:
  home: 首页
  archives: 归档
  categories: 分类
  tags: 标签
  about: 关于
```
2. 如果你觉得在里面写感觉太混乱不够清晰，可以在主题目录 `layout` 下新建一个 `about.swig`
在刚才的位置引入此模板, 这样你就可以在模板里面你的代码了。
```
 {% elif page.type === 'categories' %}
    <div class="category-all-page">
      <div class="category-all-title">
          {% set visibleCategories = 0 %}
          {% for cat in site.categories %}
            {% if cat.length %}
              {% set visibleCategories += 1 %}
            {% endif %}
          {% endfor %}
          {{ _p('counter.categories', visibleCategories) }}
      </div>
      <div class="category-all">
        {{ list_categories() }}
      </div>
    </div>

  {# 此处添加判断是否为about #}
  {% elif page.type === 'about' %}
    <div class="about-page">
    
      这里放你的代码
      我是曹二丽
    </div>
    {# 引入模板 #}
    {% include 'about.swig' %}





  {% else %}
    {{ page.content }}
  {% endif %}
</div>
```
如果你想在`about.swig`里面使用`page.swig`里面的变量。只需引入的时候这样：
```swig /page.swig
{% set foo = { bar: "baz" } %} {# 这里在上下文定义一个对象 #}
{% include 'about.swig' with foo%}
```
这样在`about.swig`文件就可以拿到传过去的数据了。
```swig /about.swig
{{ foo.bar }}
```