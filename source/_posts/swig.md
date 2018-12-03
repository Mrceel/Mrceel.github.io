---
title: hexo - swig语法及其入门
date: 2018-10-02 12:53:31
tags: [swig]
categories: 模板
---
本文档长期更新...
<!-- more -->
由于在自定义博客的时候难免会遇到.swig 文件 但又不知道其语法及其含义。故很难改动...
在这里本人亲测以及百度记录一下语法及其用法。

## 语法 __('', '') 格式化字符串
```
{{ __('footer.powered', '<a class="theme-link" target="_blank"' + nofollow + ' href="https://hexo.io">Hexo</a>') }}
```
`footer.powered` 在zh-CN.yml 中赋值为 `"由 %s 强力驱动"`
因此猜测此语法很有可能是 格式化字符串 类似Python的 `print('hellow %s' % '二丽')`
亲测：
```
{{ __("我 %s 曹永强", '是') }}
输出
我 是 曹永强
```
## 注释 
```
{# ...注释内容... #}
{# __('footer.powered', '<a class="theme-link" target="_blank"' + nofollow + ' href="https://hexo.io">Hexo</a>')  #}  
```

## 条件判断
```
{% if true %} 显示 {% endif %}
{% if false %} 不显示 {% endif %}
```
标签里面还可以是 for  变量 等.