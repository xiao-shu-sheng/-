## nodejs理解
  - Node.js 是一个开源的、跨平台的 JavaScript 运行环境。它基于 Chrome V8 引擎，使开发者能够使用 JavaScript 在服务器端编写代码。Node.js 可以被描述为一个服务器端的、非阻塞式 I/O 的、事件驱动的 JavaScript 运行时环境。
  - 非阻塞 I/O 和异步编程
    - 非阻塞：指的是在执行一个函数时，不会阻塞后续代码的执行，而是继续执行后续代码，直到函数执行完毕，再返回结果。
    - 异步：支持多种异步编程模式
      - 回调函数：在异步操作完成后调用回调函数
      - Promise：提供更结构化的异步编程方式
      - Async/Await：基于 Promise 的更直观的异步语法
  - 事件驱动
    - 基于事件循环（Event Loop）实现
    - 当新请求到达时，它会被添加到事件队列
    - 事件循环持续监控队列，检测事件状态的变化
    - 当检测到状态变化的事件时，执行相应的处理程序（通常是回调函数）
  - 单线程模型
    - Node.js 主要在单线程上运行，通过事件循环处理并发
    - 对于 CPU 密集型任务，可以使用 Worker Threads 来利用多核处理器
  - 跨平台
    - 可以在多种操作系统上运行，包括 Windows、macOS 和 Linux

## 处理多线程
  - worker threads模块允许在 Node.js 中使用轻量级的线程。这是处理 CPU 密集型任务的理想选择
  ```javascript
    const { Worker, isMainThread, parentPort } = require('worker_threads');

    if (isMainThread) {
      // 这部分代码运行在主线程

      const worker = new Worker(__filename);
      worker.on('message', (message) => {
        console.log('从 worker 收到:', message);
      });
      worker.postMessage('Hello, Worker!');

    } else {
      // 这部分代码运行在 Worker 线程

      parentPort.on('message', (message) => {
        console.log('从主线程收到:', message);
        parentPort.postMessage('Hello, Main Thread!');
      });
    }

  ```
  - Child Processes: 模块允许你创建子进程，这些进程可以并行运行。这对于执行系统命令或运行独立的 Node.js 脚本特别有用
  ```javascript
    // 子进程child_script.js
    const { exec, spawn } = require('child_process');

    // 使用 exec
    exec('ls -l', (error, stdout, stderr) => {
      if (error) {
        console.error(`执行错误: ${error}`);
        return;
      }
      console.log(`stdout: ${stdout}`);
      console.error(`stderr: ${stderr}`);
    });

    // 使用 spawn
    const ls = spawn('ls', ['-l', '-a']);

    ls.stdout.on('data', (data) => {
      console.log(`输出：${data}`);
    });

    ls.stderr.on('data', (data) => {
      console.error(`错误：${data}`);
    });

    ls.on('close', (code) => {
      console.log(`子进程退出，退出码 ${code}`);
    });
    // 主进程
    const { fork } = require('child_process');

    const child = fork('child_script.js');

    child.on('message', (message) => {
      console.log('从子进程收到:', message);
    });

    child.send({ hello: 'world' });

    // 在 child_script.js 中
    process.on('message', (message) => {
      console.log('从父进程收到:', message);
      process.send({ foo: 'bar' });
    });
  ```
  - Cluster: 模块允许你在多个子进程中运行 Node.js 应用程序。这对于处理大量并发请求特别有用。
  ```javascript
    const cluster = require('cluster');
    const http = require('http');
    const numCPUs = require('os').cpus().length;

    if (cluster.isMaster) {
      console.log(`主进程 ${process.pid} 正在运行`);

      // 衍生工作进程。
      for (let i = 0; i < numCPUs; i++) {
        cluster.fork();
      }

      cluster.on('exit', (worker, code, signal) => {
        console.log(`工作进程 ${worker.process.pid} 已退出`);
      });
    } else {
      // 工作进程可以共享任何 TCP 连接
      // 在本例中，它是一个 HTTP 服务器
      http.createServer((req, res) => {
        res.writeHead(200);
        res.end('你好世界\n');
      }).listen(8000);

      console.log(`工作进程 ${process.pid} 已启动`);
    }
  ```

## nodejs有哪些全局对象？
  - global
    - 全局命名空间对象，类似于浏览器中的 window
    - 在模块中定义的变量不会自动成为 global 对象的属性
  - process
    - 提供有关当前 Node.js 进程的信息和控制
    - 包含属性如 process.env（环境变量）、process.argv（命令行参数）等
    - 方法如 process.exit()、process.cwd() 等
  - console
    - 用于打印到 stdout 和 stderr
    - 包含方法如 console.log()、console.error() 等
  - Buffer
    - 用于处理二进制数据
    - 在处理文件和网络操作时经常使用
  - __dirname
    - 当前模块的目录名
    - 注意：在 ES 模块中不可用
  - __filename
    - 当前模块的文件名（绝对路径）
    - 注意：在 ES 模块中不可用
  - require()
    - 用于导入模块
    - 注意：在 ES 模块中不可用，使用 import 代替
  - module
    - 对当前模块的引用
    - module.exports 用于导出模块内容
    - 注意：在 ES 模块中不可用，使用 export 代替
  - exports
    - module.exports 的简写引用
  - setTimeout(), clearTimeout(), setInterval(), clearInterval()
    - 用于设置定时器
  - setImmediate(), clearImmediate()
    - 用于在当前事件循环结束时执行代码
  - queueMicrotask()
    - 用于将微任务加入队列
  - URL
    - 用于 URL 解析和处理
  - URLSearchParams
    - 用于处理 URL 查询字符串
  - TextEncoder, TextDecoder
    - 用于处理文本编码和解码
  - performance
    - 用于获取性能信息
  - AbortController, AbortSignal
    - 用于中止异步操作

## EventEmitter
  - Node.js 中的 EventEmitter 是一个核心模块，它是 Node.js 事件驱动架构的基础。EventEmitter 允许对象发射和监听事件，是实现观察者模式的一种方式
  - 主要方法
    - on(eventName, listener)：为指定事件添加监听器
    - addListener(eventName, listener)：为指定事件添加监听器
    - emit(eventName, [arg1], [arg2], [...])：触发指定事件，并传递参数
    - once(eventName, listener)：为指定事件添加一次性监听器
    - removeListener(eventName, listener)：移除指定事件的监听器
    - removeAllListeners([eventName])：移除所有事件的监听器
    - listeners(eventName)：返回指定事件的监听器数组
    - eventNames()：返回所有事件的名称数组
  - 使用示例
    ```javascript
      const EventEmitter = require('events');

      class MyEmitter extends EventEmitter {}

      const myEmitter = new MyEmitter();

      // 添加监听器
      myEmitter.on('event', function(a, b) {
        console.log(a, b, this);
      });

      // 触发事件
      myEmitter.emit('event', 'a', 'b');
    ```
## JWT
  - JSON Web Token（JWT）是一种用于在网络应用之间安全传输信息的开放标准（RFC 7519）。它由三部分组成：头部（header）、负载（payload）和签名（signature）。其中头部和载荷都是以JSON格式存放数据，只是进行了编码.
  - header
    - 包含了令牌的类型（JWT）和签名算法（HS256）
  - payload
    - 载荷即消息体，这里会存放实际的内容，也就是Token的数据声明，例如用户的id和name，默认情况下也会携带令牌的签发时间iat，通过还可以设置过期时间
  - Signature
    - 签名是对头部和载荷内容进行签名，一般情况，设置一个secretKey，对前两个的结果进行HMACSHA25算法