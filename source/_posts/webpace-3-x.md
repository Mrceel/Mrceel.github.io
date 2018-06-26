---
title: webpack 使用/配置
date: 2018-03-25 17:52:03
tags: [Webpack]
categories: Webpack
---
# 入口和输出
<!-- more -->
## 下载 webpack

首先安装 `Node.js`, 自行安装...
cmd 或者 Git Bash Here 输入下面代码后回车.

` cnpm init `也可以是` npm init `

目的是生成 `package.json` 文件.

完成后输入下面代码安装__webpack__
> ```
cnpm install webpack --save-dev 

cnpm install webpack-cli --save-dev
```

*--save-dev* 生成安装的webpack等 版本信息

好了顺利的话已经可以使用了.

## 配置 webapck.config.js

** 首先要知道一些参数 **

>	* entry： 是 页面入口文件配置 （html文件引入唯一的js 文件）
>	* output：对应输出项配置 
>		* path ：入口文件最终要输出到哪里，
>		* filename：输出文件的名称
>		* publicPath：公共资源路径

在package.json同级创建webpack.config.js文件,创建main文件夹用来放html文件等
目录如下:
{% asset_img mulu.jpg %}

app.js中
`console.log('is app.js')`

webapck.config.js
```javascript
const path = require('path'); //没有的话需要 cnpm install path  进行安装...

module.exports = {
    entry: './main/app.js', //这里定义入口文件
    output: {
        filename: 'index.js'  //这里是打包后生成的文件名
        path: path.join(__dirname, 'public'), //生成文件放置点,(没有的话会自动生成).
        // __dirname 返回当前文件的路径
    },
}
```
然后 cmd输入 webpack -p
> -p 是压缩文件
> --watch 在开发环境中，总是要一边改，一边看转化效果吧，webpack --watch能办到.

会发现目录中生成了一个 public 文件夹里面有个index.js.
接下来在index.html中引入 index.js.

` <script src="../public/index.js"></script> `

打开页面你会发现控制台输出了 is app.js.

上面是打包单个文件,下面说下打包多个文件.只需简单改动.

webapck.config.js
```javascript
const path = require('path');

module.exports = {
    entry: {
        index1: './main/app.js'  //这里定义入口文件 1 为了区分刚才的生成的index.js
        dist: './main/app.js'  //这里定义入口文件 2
        //index1 dist  随便起的名字
    },
    output: {
        filename: '[name].js'  
        path: path.join(__dirname, 'public'), 
    },
}
```
cmd输入 webpack -p 在不报错的情况下public下会多出index1.js和dist.js.

# 配置
package.json
```javascript
{
  "name": "webpk",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "dev": "webpack -p" //定义脚本
  },
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "webpack": "^4.8.3",
    "webpack-cli": "^2.1.3"
  }
}

```
使用的时候直接 `cnpm run dev`即可执行`webpack -p`;

> 需要注意的是 使用webpack4.x,必须要配合webpack-cli一起使用;


# 插件

## html-webpack-plugin(打包html)

安装 
`cnpm install html-webpack-plugin --save-dev`

安装完成后`cnpm run dev`一下;

接下来会发现public文件下多了个index.html. 如下:

```html5
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Webpack App</title>
  </head>
  <body>
  <script type="text/javascript" src="test.js"></script></body>
</html>

```

记录一下plugins[new HtmlWebpackPlugin] 参数:
```javascript
 plugins: [new HtmlWebpackPlugin({
    title: "hello world",  //生成index.html的 <title>hello world</title> 里面的内容
    filename : "index.html", //设置生成文件名
    minify: {
    	coolapseWhitespace: true  //去掉文件中所有的内容的没用空格去掉，减少空间
    },
    hash:true //给文件设置一个hash值  
    // 如 ? 后面的: <script type="text/javascript" src="test.js?4b27d28ee8e15700c554"></script>
  })]
```

## 使用 loader 处理 CSS 和 Sass

安装:
```
npm install --save-dev css-loader style-loader
```

在main文件夹下新建app.css,

app.css
```
body{
	background: blue;
}
```
app.js
```
import css from './app.css';

console.log('hello css')
```
webpack.config.js
```javascript
const path = require('path');
const htmlWebpackPlugin = require('html-webpack-plugin');
module.exports = {
    entry: {
        app: './main/app.js'
    },
    output : {
        filename: 'test.js',
        path : path.join(__dirname,'public')
    },
    plugins :[new htmlWebpackPlugin({
        title: 'webHtml',
        filename: "accumulation.html",
        minify : {
            collapseWhitespace: true,
        },
        hash : true
    })],
    module: {
        rules: [
            {
                test: /\.css$/,
                use: ['style-loader', 'css-loader']
            }
        ]
    }
}
```
设置module:...然后运行cnpm run dev;顺利的话页面已经变蓝色了.

### 用 sass-loader 把 SASS 编译成 CSS

把 src/app.css 改名为 src/app.scss

`npm install sass-loader node-sass --save-dev`

src/app.scss
```
body {
  background: pink;
  p {
    color: red;
  }
}
```
src/index.html
```
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Hello World</title>
</head>
<body>
  <p>hello world</p>
</body>
</html>
```
src/app.js
```
import css from './app.scss';

console.log("hello world");
```

webpack.config.js
```
var HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  entry: './src/app.js',
  output: {
    path: __dirname + '/dist',
    filename: 'app.bundle.js'
  },
  plugins: [new HtmlWebpackPlugin({
    template: './src/index.html',
    filename: 'index.html',
    minify: {
      collapseWhitespace: true,
    },
    hash: true,
  })],
  module: {
    rules: [
      {
        test: /\.scss$/,
        use: [ 'style-loader', 'css-loader', 'sass-loader' ]
      }
    ]
  }
};
```
如果有理解错误请指正... 
