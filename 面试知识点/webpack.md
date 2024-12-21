## webpack构建流程
  - 具体流程
    - 1.初始化参数：从配置文件(webpack.config.js)和shell文件中读取与合并参数，得出最终的参数
    - 2.开始编译：用上一步的得到的参数初始化Compiler对象，加载所有配置的插件，执行对象的run方法开始执行编译
    - 3.确定入口：根据配置中的entry找出所有的入口文件
    - 4.编译模块：从入口文件触发，调用所有配置的loader对模块进行翻译，再找出该模块所依赖的模块，递归本步骤，直到所有的入口依赖的文件都经过本步骤处理。
    - 5.完成模块编译：在经过第四步使用loader翻译完所有模块后，得到了每个模块被翻译后的最终内容以及它们之间的依赖关系
    - 6.输出资源：根据入口和模块之间的依赖关系，组装成一个个包含多个模块的Chunk，在把每个Chunk转换为一个单独的文件加到输出列表
    - 7.输出完成：在确定好输出内容后，根据配置确定输出的路径和文件名，把文件内容写入到文件系统中
  - 关键概念解释
    - entry: 入口，webpack执行构建的第一步将从Entry开始，可以理解成webpack从Entry开始找出所有依赖的模块
    - Module: 模块，在webpack中一切皆模块，一个模块对应着一个文件。webpack会从配置的Entry开始递归找出所有依赖的模块
    - Chunk: 代码块，一个chunk由多个模块组合而成，用于代码合并与分割
    - loader: 模块转换器，根据需求将模块原内容转换为所需的新内容
    - plugin: 扩展插件，在webpack构建流程中的特定时机注入插件，扩展了webpack的功能
    - output: 输出结果，在webpack的配置中指定输出路径和文件名，以及如何清理旧文件等选项

## webpack中常见的loader
  - loader：用于对模块的源码进行转换，在inport或着加载时预处理文件
  - 常见的loader：
    - style-loader：将css添加到DOM的内联样式标签style里
    - css-loader: 允许将css文件通过require的方式引入，并返回css代码
    - less-loader：将less文件编译成css文件
    - sass-loader：将sass文件编译成css文件
    - postcss-loader：postcss是一个css的编译工具，可以对css代码进行优化和压缩，例如添加浏览器前缀等
    - file-loader：分发文件到output目录并返回相对路径
    - url-loader：和file-loader类似，但是当文件小于设定的limit时可以返回一个Data Url
    - babel-loader：将es6+代码转换为es5代码

## webpack中Plugin
  - Plugin: 是webpack生态系统中重要的组成部分，它和主应用程序互相交互，以提供特定的功能。是一种遵循一定规范的应用程序接口编写出来的程序，只能运行在程序规定的系统下，因为其需要调用原纯净系统提供的函数库或者数据
  - 插件的作用
    - 打包优化
    - 资源管理
    - 注入环境变量
    - 实现特定功能
  - 配置方式
    ```javascript
      const HtmlWebpackPlugin = require('html-webpack-plugin'); // 通过 npm 安装
      const webpack = require('webpack'); // 访问内置的插件
      module.exports = {
        ...
        plugins: [
          new webpack.ProgressPlugin(),
          new HtmlWebpackPlugin({ template: './src/index.html' }),
        ],
      };
    ```
  - 常用的插件
    - HtmlWebpackPlugin：在打包结束后，⾃动生成⼀个 html ⽂文件，并把打包生成的js 模块引⼊到该 html 中
    - mini-css-extract-plugin：提取 CSS 到一个单独的文件中

## loader与plugin的区别
  - loader 用于转换某些类型的模块，它是一个转换器
    - 编写loader
      1.创建模块： 创建一个 Node.js 模块
      2.导出函数： 导出一个函数作为模块的默认导出
      3.处理输入： 函数接收源文件的内容作为参数
      4.转换内容： 在函数内部对内容进行必要的转换
      5.返回结果： 返回转换后的内容
      ```javascript
        module.exports = function(source) {
          return source.replace(/hello/g, '你好');
        };

      ```
      
  - Plugin 用于执行范围更广的任务，从打包优化和压缩，到重新定义环境中的变量
    - 编写plugin
      1.创建一个类： 定义一个 JavaScript 类
      2.定义 apply 方法： 在类的原型上定义一个 apply 方法
      3.访问 compiler 对象： apply 方法接收 compiler 对象作为参数
      4.注册钩子： 使用 compiler 对象注册到 Webpack 的各种钩子上
      5.实现插件逻辑： 在钩子回调中实现你的插件逻辑
      ```javascript
        class LogPlugin {
          apply(compiler) {
            compiler.hooks.run.tap('LogPlugin', (compilation) => {
              console.log('Webpack 构建过程开始！');
            });

            compiler.hooks.done.tap('LogPlugin', (stats) => {
              console.log('Webpack 构建过程结束！');
            });
          }
        }

        module.exports = LogPlugin;

      ```

## webpack热更新是如何做到的，原理是什么
  - webpack热更新（hot module replacement）基本原理

    1.构建bundle：webpack编译器构建初始的bundle文件
    2.监听变化：webpack监听源文件变化
    3.重新构建：当文件发生变化是，webpack重新构建修改的模块
    4.生成更新：webpack生成一个包含更新内容的update文件
    5.推送更新：通过websocket将update文件推送到浏览器
    6.更新模块：浏览器接收到update文件后，将update文件中的内容注入到页面中

  - 详细工作流程
    1.webpack compiler：
      监视文件系统：当发现源文件发生变化是，重新编译
      生成新的模块和文件
    2.HMR Runtime（浏览器端）
      在应用程序初始化时注入
      建立与webpack dev server的websocket连接
    3.webpack dev server：
      作为中间件运行，提供静态文件服务
      建立websocket服务器，用于与客户端通信
    4.更新过程
      当源文件变化时，Webpack 重新编译，生成新的 hash
      Dev Server 通过 WebSocket 通知客户端有更新可用
      客户端请求更新的 manifest 和 chunk
      HMR Runtime 应用更新，如果更新失败，则刷新整个页面
## webpack跨域解决：
  - webpack-dev-server 配置 proxy
    ```javascript
      module.exports = {
        devServer: {
          contentBase: path.join(__dirname, 'dist'), // 指定静态文件目录
          prot: 9427, // 指定端口号
          compress: true, // 是否启用 gzip 压缩
          proxy: {
            '/api': {
              target: 'URL_ADDRESS', // 代理目标地址
              changeOrigin: true, // 是否改变请求头中的host
              pathRewrite: { '^/api': '' }, // 重写请求路径
            },
          },
        },
      };
    ```

## webpack5新增
  - 1.持久缓存
    - 改进了长期缓存，通过更好的算法生成内容哈希
    - 引入了contenthash，用于生成内容哈希
    ```javascript
      output: {
        filename: '[name].[contenthash].js'
      }
    ```
  - 2.模块联邦
    - 模块联邦（Module Federation）是 Webpack 5 的新特性，它允许你将应用程序分割成多个独立的模块，每个模块都可以独立地进行开发和部署。
  - 3.tree shaking
    - tree shaking 是 Webpack 5 的新特性，它可以帮助你删除未使用的代码，从而减少打包后的代码体积。
    ```javascript
      module.exports = {
        optimization: {
          usedExports: true,
        },
      };
    ```
  - 4.静态资源内联
    - 静态资源内联是 Webpack 5 的新特性，它可以将小于指定大小的资源文件内联到代码中，从而减少 HTTP 请求的数量。
    ```javascript
      module.exports = {
        module: {
          rules: [
            {
              test: /\.(png|jpg|gif)$/,
              type: 'asset',
              parser: {
                dataUrlCondition: {
                  maxSize: 8 * 1024, // 8kb
                },
              },
            },
          ],
        },
      };
    ```
 
