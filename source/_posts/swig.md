---
title: swig模板引擎语法
date: 2018-10-02 12:53:31
tags: [swig]
categories: 模板
---
本文档长期更新...
<!-- more -->
由于在自定义博客的时候难免会遇到.swig 文件 但又不知道其语法及其含义。故很难改动...
在这里本人亲测以及百度记录一下语法及其用法。

#### 格式化字符串 
```
__('', '') 
{{ __('由 %s 强力驱动', '<a class="theme-link" target="_blank" href="https://hexo.io">Hexo</a>') }}
```
在这里%s 会被替换成 Hexo，最终效果为  由 Hexo 强力驱动

#### 注释 
```
{# ...注释内容... #}
{# __('footer.powered', '<a class="theme-link" target="_blank"' + nofollow + ' href="https://hexo.io">Hexo</a>')  #}  
```

#### 条件判断
```
{% if true %} 显示 {% endif %}

{% if false %} 
不显示 
{% elif 1 > 0 %} // 相当于 else if
hello
{% endif %}

{% 这里可以执行js代码 %}
```
标签里面还可以是 for  变量 等.

#### 内置标签

##### extends
extends：使当前模板继承父模板，必须在文件最前
参数： 
- file: 父模板相对模板 root 的相对路径
##### spaceless
spaceless：尝试移除html标签间的空格
```
{% spaceless %}
    {% for num in foo %}
        <li>{{ loop.index }}</li>
    {% endfor %}
{% endspaceless %}
```
输出
```
<li>1</li><li>2</li><li>3</li>
```
##### import
import：允许引入另一个模板的宏进入当前上下文
参数file：引入模板相对模板 root 的相对路径
参数as：语法标记 var: 分配给宏的可访问上下文对象,与python的类似！

```
{% import 'formmacros.html' as form %}

{# this will run the input macro #}
    {{ form.input("text", "name") }}
    {# this, however, will NOT output anything because the macro is scoped to the "form"     object: #}
{{ input("text", "name") }}
```
##### only
限制模板上下文中用 with x 定义的参数
如果当前上下文中 foo 和 bar 可用，下面的情况中，只有 foo 会被 inc.html 定义
```
{% include "inc.html" with foo only %}
```
only 必须作为最后一个参数，放在其他位置会被忽略
###### include
包含一个模板到当前位置，这个模板将使用当前上下文
```
{% include template_path %}
{% include "path/to/template.js" %}
```
##### macro
macro：创建自定义可复用的代码段
定义
```
{% macro input type name id label value error %}
 <label for="{{ name }}">{{ label }}</label>
 <input type="{{ type }}" name="{{ name }}" id="{{ id }}" value="{{ value }}"{% if error %} class="error"{% endif %}>
{% endmacro %}
```
使用
```
<div>
    {{ input("text", "fname", "fname", "First Name", fname.value, fname.errors) }}
</div>
<div>
    {{ input("text", "lname", "lname", "Last Name", lname.value, lname.errors) }}
</div>
```
结果输出
```
<div>
    <label for="fname">First Name</label>
    <input type="text" name="fname" id="fname" value="Paul">
</div>
<div>
    <label for="lname">Last Name</label>
    <input type="text" name="lname" id="lname" value="" class="error">
</div>
```
##### block 
定义一个块，使之可以被继承的模板重写，或者重写父模板的同名块
参数： `name` 块的名字，必须以字母数字下划线开头
##### parent 
将父模板中同名块注入当前块中
##### include 
包含一个模板到当前位置，这个模板将使用当前上下文
参数： 
- `file`: 包含模板相对模板 root 的相对路径 
- `ignore missing`: 包含模板不存在也不会报错 
- `with x`: 设置 x 至根上下文对象以传递给模板生成。必须是一个键值对 
- `only`: 限制模板上下文中用 with x 定义的参数

##### raw 
停止解析标记中任何内容，所有内容都将输出
参数： 
- file: 父模板相对模板 root 的相对路径
##### 循环for 
遍历对象和数组

参数： 
- x: 当前循环迭代名 
- in: 语法标记 
- y: 可迭代对象。可以使用过滤器修改
```
// arr = [1, 2, 3]
{ % for key, val in arr % }
  <p>{ { key } } -- { { val } }</p>
{ % endfor % }
for循环内置变量：
loop.index：当前循环的索引（1开始）
loop.index0：当前循环的索引（0开始）
loop.revindex：当前循环从结尾开始的索引（1开始）
loop.revindex0：当前循环从结尾开始的索引（0开始）
loop.key：如果迭代是对象，是当前循环的键，否则同 loop.index
loop.first：如果是第一个值返回 true
loop.last：如果是最后一个值返回 true
loop.cycle：一个帮助函数，以指定的参数作为周期
```
在 for 标签里使用 else
```
{% for person in people %}
    {{ person }}
{% else %}
    There are no people yet!
{% endfor %}
```
##### autoescape
改变当前变量的自动转义行为

参数： 
- on: 当前内容是否转义 
- type: 转义类型，js 或者 html，默认 html
假设
```
some_html_output = '<p>Hello "you" & \'them\'</p>';
```
然后
```
{% autoescape false %}
    {{ some_html_output }}
{% endautoescape %}

{% autoescape true %}
    {{ some_html_output }}
{% endautoescape %}

{% autoescape true "js" %}
    {{ some_html_output }}
{% endautoescape %}
```
将会输出
```
<p>Hello "you" & 'them'</p>

&lt;p&gt;Hello &quot;you&quot; &amp; &#39;them&#39; &lt;/p&gt;

\u003Cp\u003EHello \u0022you\u0022 & \u0027them\u0027\u003C\u005Cp\u003E
```
##### set命令
用来设置一个变量，在当前上下文中复用
```
{% set foo = [0, 1, 2, 3, 4, 5] %}
 {% for num in foo %}
    <li>{{ num }}</li>
{% endfor %}
```
##### filter 
对整个块应用过滤器
参数： 
- filter_name: 过滤器名字，若干传给过滤器的参数 父模板相对模板 root 的相对路径
```
{% filter uppercase %}oh hi, {{ name }}{% endfilter %}
{% filter replace "." "!" "g" %}Hi. My name is Paul.{% endfilter %}
```
输出
```
OH HI, PAUL
Hi! My name is Paul!
```
#### 内置过滤器

- `add(value)`：使变量与value相加，可以转换为数值字符串会自动转换为数值。
- `addslashes`：用 \ 转义字符串
- `capitalize`：大写首字母
- `date(format[, tzOffset])`：转换日期为指定格式
- `format`：格式
- `tzOffset`：时区
- `default(value)`：默认值（如果变量为undefined，null，false）
- `escape([type])`：转义字符
- 默认： &, <, >, ", '
- `js`: &, <, >, ", ', =, -, ;
- `first`：返回数组第一个值
- `join(glue)`：同[].join
- `json_encode([indent])`：类似JSON.stringify, indent为缩进空格数
- `last`：返回数组最后一个值
- `length`：返回变量的length，如果是object，返回key的数量
- `lower`：同''.toLowerCase()
- `raw`：指定输入不会被转义
- `replace(search, replace[, flags])`：同''.replace
- `reverse`：翻转数组
- `striptags`：去除html/xml标签
- `title`：大写首字母
- `uniq`：数组去重
- `upper`：同''.toUpperCase
- `url_encode`：同encodeURIComponent
- `url_decode`：同decodeURIComponemt

使用方法：

和Vue的过滤器用法一样，都是一个“ | ”，例如我们要格式化一个时间，
```
{{ birthday|date('Y-m-d') }}

//大写首字母
{{ name|title }}
```
##### 自定义过滤器
创建一个 myfilter.js 然后引入到 Swig 的初始化函数中
```
swig.init({ filters: require('myfilters') });
```
在 myfilter.js 里，每一个 filter 方法都是一个简单的 js 方法，下例是一个翻转字符串的 filter：
```
exports.myfilter = function (input) {
    return input.toString().split('').reverse().join('');
};
```
你的 filter 一旦被引入，你就可以向下面一样使用：
```
{{ name|myfilter }}
     {% filter myfilter %}
    I shall be filtered
{% endfilter %}
```
你也可以像下面一样给 filter 传参数：
```
exports.prefix = function(input, prefix) {
    return prefix.toString() + input.toString();
};
{{ name|prefix('my prefix') }}
{% filter prefix 'my prefix' %I will be prefixed with "my prefix".{% endfilter %}
{% filter prefix foo %}I will be prefixed with the value stored to `foo`.{% endfilter %}
```


参考： http://www.iqianduan.net/blog/how_to_use_swig
