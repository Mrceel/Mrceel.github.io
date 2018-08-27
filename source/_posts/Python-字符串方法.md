---
title: Python-字符串方法
date: 2018-06-23 16:13:23
tags: [Python]
categories: Python
---
为了能方便记忆，想看就看。这里记录一下Python3.x的字符串方法。
<!-- more -->
<style>
table th:first-of-type {
    width: 5%;
}
table th:nth-of-type(2) {
    width: 25%;
}
</style>

### 增：

 序号 | 方法 | 描述 
:-------: | :------ | :----
1 | string.zfill() | 方法返回指定长度的字符串，原字符串右对齐，前面填充0。
2 | string.join() | 方法用于将序列中的元素以指定的字符连接生成一个新的字符串。
3 | string.ljust() | 方法返回一个原字符串左对齐,并使用空格填充至指定长度的新字符串。如果指定的长度小于原字符串的长度则返回原字符串。
4 | string.center(51, '*')  | 返回一个指定的宽度 width 居中的字符串，fillchar 为填充的字符，默认为空格。
5 | string.rjust(width,[, fillchar]) | 返回一个原字符串右对齐,并使用fillchar(默认空格）填充至长度 width 的新字符串

### 删：

 序号 | 方法 | 描述 
:-------: | :------ | :----
1 | string.strip() | 方法用于移除字符串头尾指定的字符（默认为空格）或字符序列。注意：该方法只能删除开头或是结尾的字符，不能删除中间部分的字符。 
2 | string.rstrip() | 删除 string 字符串末尾的指定字符（默认为空格）
3 | string.lstrip() | 方法用于截掉字符串左边的空格或指定字符。

### 改：

 序号 | 方法 | 描述 
:-------: | :------ | :----
1 | string.swapcase() | 方法用于对字符串的大小写字母进行转换。返回大小写字母转换后生成的新字符串。
2 | string.upper() | 转换字符串中的小写字母为大写
3 | string.lower() | 方法转换字符串中所有大写字符为小写。
4 | string.capitalize()  | 字符串的首字母变大写
5 | string.title() | 返回"标题化"的字符串,就是说所有单词的首个字母转化为大写，其余字母均为小写
6 | string.replace(old, new[, max]) | 把字符串中的 old（旧字符串） 替换成 new(新字符串)如果指定第三个参数max，则替换不超过max次
7 | str.split(str="", num=string.count(str)) | 通过指定分隔符对字符串进行切片，如果参数num 有指定值，则仅分隔 num 个子字符串
8 | string.expandtabs(16) | 把字符串 string 中的 tab 符号转为空格，tab 符号默认的空格数是 8 。
9 | str.maketrans() | intab = "aeiou" <br> outtab = "12345"<br> trantab = str.maketrans(intab, outtab)<br> 指定替换 a=>1, e=>2, i=>3, o=>4, u=>5<br> str = "this is string example....wow!!!"<br> str.translate(trantab)<br> translate 开始替换str里面的 a, e, i, o, u 为 1,2,3,4,5
10 | translate() |<br>方法根据参数table给出的表(包含 256 个字符)转换字符串的字符,<br>要过滤掉的字符放到 deletechars 参数中。<br>translate()方法语法：<br>str.translate(table)<br>bytes.translate(table[, delete])    <br>bytearray.translate(table[, delete]) <br><br>table -- 翻译表，翻译表是通过 maketrans() 方法转换而来。<br>deletechars -- 字符串中要过滤的字符列表。
11 | splitlines() | <br>按照行('\r', '\r\n', \n')分隔，返回一个包含各行作为元素的列表，<br>如果参数 keepends 为 False，不包含换行符，如果为 True，则保留换行符。<br>str.splitlines([keepends])<br>keepends -- 在输出结果里是否去掉换行符('\r', '\r\n', \n')，默认为 False，<br>不包含换行符，如果为 True，则保留换行符。

### 查：

 序号 | 方法 | 描述 
:-------: | :------ | :----
1 | string.isdecimal() | 检查字符串是否只包含十进制字符，如果是返回 true，否则返回 false。
2 | string.find('k', 0, 7) | 检测 str 是否包含在字符串中，<br>如果指定范围 beg 和 end ，则检查是否包含在指定范围内，<br>如果包含返回开始的索引值，否则返回-1
3 | index(str, beg=0, end=len(string) | 跟find()方法一样，只不过如果str不在字符串中会报一个异常.
4 | string.rfind(str, beg=0,end=len(string)) | 类似于 find()函数，不过是从右边开始查找.
5 | string.rindex( str, beg=0, end=len(string) | 类似于 index()，不过是从右边开始.
6 | string.isupper() | 检测字符串中所有的字母是否都为大写。
7 | string.islower() | 如果都是小写返回True 否则返回False
8 | string.istitle() | 方法检测字符串中所有的单词拼写首字母是否为大写，且其他字母为小写。
9 | max(string) | 返回字符串 str 中最大的字母。
10 | min(string) | 返回字符串 str 中最小的字母。
11 | string.isnumeric() | 检测字符串是否只由数字组成。这种方法是只针对unicode对象。<br>如果字符串中只包含数字字符，则返回 True，否则返回 False。
12 | string.isalnum() | 如果字符串至少有一个字符并且所有字符都是字母或数字则返 回 True,否则返回 False<br>注：必须是全字母或者全数字，不能有空格等。
13 | string.isalpha() | 如果字符串至少有一个字符并且所有字符都是字母则返回 True, 否则返回 False
14 | string.isdigit() | 如果字符串只包含数字则返回 True 否则返回 False.<br>注：必须是全数字，不能有空格等。
15 | string.isspace() | 如果字符串中只包含空白，则返回 True，否则返回 False.
16 | string.count('l', 0, 3) | 用于统计字符串里某个字符出现的次数。可选参数为在字符串搜索的开始与结束位置。
17 | string.endswith('l', 0, 3) | 检查字符串是否以 obj 结束，<br>如果设置第二个和第三个参数，则判断在指定的范围内是否以 obj 结束<br>如果是，返回 True,否则返回 False.
18 | string.startswith() | 方法用于检查字符串是否是以指定子字符串开头，<br>如果是则返回 True，否则返回 False。<br>如果参数 beg 和 end 指定值，则在指定范围内检查。
19 | len(string) | 方法返回对象（字符、列表、元组等）长度或项目个数。