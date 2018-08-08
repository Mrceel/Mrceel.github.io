---
title: python-dict
date: 2018-07-18 17:52:03
tags: [Python]
categories: Python
---
python数据类型之dict
<!-- more -->
1、clear:删除所有元素
```
#D.clear() -> None.  Remove all items from D
dic_a  ={1:'kong',2:'zha',3:'gen'}
dic_a.clear()
print(dic_a)
结果：{}
```

2、fromkeys():从序列键和值生成字典的key,value来构建一个新字典
```
#dict.fromkeys(seq[, value]))
seq:是为字典的键准备的
value:是字典的默认值

seq = ('Name','Age','Sex')
new_dic = dict.fromkeys(seq,10)
print(new_dic)
结果：{'Age': 10, 'Sex': 10, 'Name': 10}
```
3、get:获取字典值
```
#get(self, k, d=None)
如果字典中没有1键，则值返回默认值10，如果不返回默认值，则返回None
dic = {1:'kong',2:'zha'}
print(dic.get(1,10))
结果：'kong'
```
4、items:返回一个类集合对象
```
dic = {1:'kong',2:'zha'}
print(dic.items())
结果：dict_items([(1, 'kong'), (2, 'zha')])
```
5、keys:返回一个类集合对象
```
dic = {1:'kong',2:'zha'}
new_dic = dic.keys()
print(new_dic)
for x in new_dic:
    print(x)
结果：
dict_keys([1, 2])
1
2
```
6、pop:删除字典指定的键值，返回一个value值，必须指定键删除
```
#D.pop(k[,d]) -> v, remove specified key and return the corresponding value
dic = {1:'kong',2:'zha'}
print(dic.pop(1))
print(dic)
结果：
kong
{2: 'zha'}
```
7、popitem:随机移除字典的键值对，返回一个元组，如果字典为空则报错
```
#D.popitem() -> (k, v), remove and return some (key, value) pair as a
        2-tuple; but raise KeyError if D is empty.
dic = {1:'kong',2:'zha',3:'gen'}
print(dic.popitem())
print(dic)
结果：
(1, 'kong')
{2: 'zha', 3: 'gen'}
```
8、setdefault:如果键在字典中，返回键对应的值，如果键不在字典中，向字典中插入这个键值
```
#D.setdefault(k[,d]) -> D.get(k,d), also set D[k]=d if k not in D
dic = {1:'kong',2:'zha',3:'gen',4:'ff',5:'pp'}
pp = dic.setdefault(6,'ppp')
print(dic)
print(pp)
结果：
{1: 'kong', 2: 'zha', 3: 'gen', 4: 'ff', 5: 'pp', 6: 'ppp'}
ppp
```
9、update:用dic2更新dic1:如果dic2的键在dic1中不存在，则dic2插入到dic1,否则更用dic2的键值，更新dic1
```
dic1 = {'Name':'kong','Age':33}
dic2 = {'Name':'Hucli','Sex':'M'}
print(dic1,dic2)
dic1.update(dic2)
print(dic1)
结果：
{'Age': 33, 'Name': 'kong'} {'Name': 'Hucli', 'Sex': 'M'}
{'Age': 33, 'Name': 'Hucli', 'Sex': 'M'}
```
10、values:返回字典的所有值
```
#D.values() -> an object providing a view on D's values
dic1 = {'Name':'kong','Age':33}
print(dic1.values())
结果：dict_values([33, 'kong'])
```
