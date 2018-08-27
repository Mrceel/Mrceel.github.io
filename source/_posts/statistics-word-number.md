---
title: Python实现统计文本当中单词的数量
date: 2018-08-17 12:02:29
tags: [ Python ]
categories: Python
---
Python实现统计文本当中单词的数量，
<!-- more -->
```python
import re

fo = open('technology.txt', encoding='gb18030', errors='ignore')
# 把文本变成单个的单词放到list里面
def readFiles(file):
    arr = []
    lines = file.readlines()
    for line in lines:
        # 本文中只有, ; . 三个符号所以直接匹配这三个
        line = re.sub('[\n,;.]', '', line)
        line = line.strip()
        if line.strip() != '':
            arr.extend(line.split(' '))
    return arr
wordList = readFiles(fo)

def statistics(arr):
    json = {}.fromkeys(arr)
    for i in json:
        json[i] = arr.count(i)
    jsn = []
    for key, val in json.items():
        if max(json.values()) == val:
            jsn.append((key, val))
    return json, jsn
print(statistics(wordList))
```