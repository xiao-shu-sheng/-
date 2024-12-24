# JavaScript 变量声明和数组方法

## var、let、const 的区别

### 1. 作用域

- var：
  - 函数作用域或全局作用域
  - 不存在块级作用域
- let 和 const：
  - 块级作用域
  - 包括 if 语句、for 循环等

### 2. 变量提升 (Hoisting)

- var：
  - 变量声明会被提升到其作用域的顶部
  - 初始化不会被提升
- let 和 const：
  - 声明不会被提升
  - 存在"暂时性死区"(Temporal Dead Zone, TDZ)

### 3. 重复声明

- var：允许在同一作用域内重复声明
- let 和 const：禁止在同一块级作用域内重复声明

### 4. 初始化

- var 和 let：
  - 可以声明时不初始化
  - 未初始化时，值为 undefined
- const：
  - 必须在声明时初始化
  - 不能被重新赋值

### 5. 全局对象属性

- var：在全局作用域中声明的变量会成为全局对象（如浏览器中的 window）的属性
- let 和 const：不会成为全局对象的属性

### 6. const 的特殊性

- 对于基本类型，const 声明的变量的值不能被修改
- 对于引用类型（如对象、数组），const 声明的变量指向的内存地址不能改变，但其内容可以被修改
- 可以使用 Object.freeze() 来创建不可变对象

## 数组常用方法

### 改变原数组的方法

1. push()：在数组末尾添加一个或多个元素，返回新的长度
2. pop()：删除数组的最后一个元素，返回被删除的元素
3. shift()：删除数组的第一个元素，返回被删除的元素
4. unshift()：在数组开头添加一个或多个元素，返回新的长度
5. splice()：删除/添加/替换数组的元素，返回被删除的元素
6. reverse()：反转数组，返回反转后的数组
7. sort()：对数组进行排序，返回排序后的数组
8. length：减少 length 属性会删除元素

### 不改变原数组的方法

1. concat()：连接两个或多个数组，返回新数组
2. slice()：从数组中返回指定元素，返回新的数组
3. map()：遍历数组，返回新数组，每个元素为回调函数的结果
4. indexOf()：返回数组中指定元素的索引，如果不存在则返回-1
5. forEach()：遍历数组
6. filter()：过滤数组，返回符合条件的元素组成的新数组
7. reduce()：将数组元素计算为一个值（从左到右）
8. every()：判断数组中的元素是否都满足条件，如果都满足则返回true，否则返回false
9. some()：判断数组中的元素是否满足条件，如果有一个满足则返回true，否则返回false

## ES6+ 新增的数组方法

### 不改变原数组的方法

1. Array.from()：将类数组对象或可迭代对象转换为数组
2. Array.of()：将一组参数转换为数组
3. find()：查找数组中满足条件的第一个元素，返回该元素或undefined
4. findIndex()：查找数组中满足条件的第一个元素的索引，返回该索引或-1
5. entries()：返回数组的键值对数组
6. keys()：返回一个包含数组中每个索引键的 Array Iterator 对象
7. values()：返回一个包含数组中每个值的 Array Iterator 对象

### 改变原数组的方法

1. copyWithin()：将数组的一部分复制到同一数组中的另一个位置，返回修改后的数组
2. fill()：用一个固定值填充一个数组中从起始索引到终止索引内的全部元素，返回修改后的数组

### 其他新方法（不改变原数组）

1. includes()：判断数组中是否包含某个值，返回布尔值（ES7新增）
2. flat()：将多维数组转换为一维数组，返回新的数组（ES2019新增）
3. flatMap()：首先使用映射函数映射每个元素，然后将结果压缩成一个新数组（ES2019新增）

## js对象有那些方法，es6+对象新增了哪些方法

### js对象传统方法
  - 1、Object.create(proto,[propertiesObject])
    - 创建一个新对象，使用现有的对象来提供新创建的对象的__proto__
  - 2、Object.keys(obj)
    - 返回一个由一个给定对象的自身可枚举属性组成的数组，数组中属性名的排列顺序和使用for...in循环遍历该对象时返回的顺序一致 （非IE）
  - 3、Object.getOwnPropertyNames(obj)
    - 返回一个由指定对象的所有自身属性的属性名（包括不可枚举属性但不包括Symbol值作为名称的属性）组成的数组
  - 4、Object.getOwnPropertySymbols(obj)
    - 返回一个给定对象自身的所有 Symbol 属性的数组
  - 5、Object.getPrototypeOf(obj)
    - 返回指定对象的原型
  - 6、Object.defineProperty(obj, prop, descriptor)
    - 定义一个新属性，或者修改一个对象的现有属性，并返回这个对象
  - 7、Object.defineProperties(obj, props)
    - 定义一个新属性，或者修改一个对象的现有属性，并返回这个对象
  - 8、Object.seal(obj)
    - 封闭一个对象，阻止添加新属性并将所有现有属性标记为不可配置
  - 9、Object.freeze(obj)
    - 冻结一个对象，阻止添加新属性、删除现有属性、修改属性的可写性，并将所有现有属性标记为不可配置
  - 10、Object.isSealed(obj)
    - 判断一个对象是否被密封
  - 11、Object.isFrozen(obj)
    - 判断一个对象是否被冻结
  - 12、Object.isExtensible(obj)
    - 判断一个对象是否可扩展

### ES6+新增方法
  - 1、Object.assign(target, ...sources)
    - 将所有可枚举属性的值从一个或多个源对象分配到目标对象。它将返回目标对象。
    ```javascript
      const target = { a: 1, b: 2 };
      const source = { b: 4, c: 5 };
      const returnedTarget = Object.assign(target, source);
      console.log(target); // { a: 1, b: 4, c: 5 }
    ```
  - 2、Object.is(value1, value2)
    - 判断两个值是否严格相等，与===类似，不同之处在于+0不等于-0，NaN等于自身
  - 3、Object.setPrototypeOf(obj, proto)
    - 设置一个指定的对象的原型（即，内部[[Prototype]]属性）到另一个对象或 null。
  - 4、Object.getOwnPropertySymbols(obj)
    - 返回一个给定对象自身的所有 Symbol 属性的数组
  - 5、Object.entries(obj)
    - 返回一个给定对象自身可枚举属性的键值对数组，其排列与使用 for...in 循环遍历该对象时返回的顺序一致（非IE）
    ```javascript
      const obj = { foo: 'bar', baz: 42 };
      console.log(Object.entries(obj)); // [ ['foo', 'bar'], ['baz', 42] ]
    ```
  - 6、Object.fromEntries(iterable)
    - 从一个键值对数组中创建一个新对象
    ```javascript
      const entries = new Map([
        ['foo', 'bar'],
        ['baz', 42]
      ]);
      const obj = Object.fromEntries(entries);
      console.log(obj); // { foo: "bar", baz: 42 }
    ```
  - 7、Object.values(obj)
    - 返回一个给定对象自身的所有可枚举属性值的数组，值的排列顺序与使用 for...in 循环遍历该对象时返回的顺序一致（非IE）
    ```javascript
      const obj = { foo: 'bar', baz: 42 };
      console.log(Object.values(obj)); // [ "bar", 42 ]
    ```
  - 8、Object.getOwnPropertyDescriptors(obj)
    - 返回指定对象所有自身属性（非继承属性）的描述符
  - 9、Object.hasOwn(obj, prop)
    - 判断对象是否包含特定的自身属性(es2022新增)
  - 10、对象方法的简写语法
    ```javascript
      // 简写语法不能用作构造函数
      const obj = {
        method() {
          console.log('Hello, world');
        }
      }
      // 等同于
      const obj = {
        method: function() {
          console.log('Hello, world');
        }
      }
    ```
  - 11、计算属性名
    ```javascript
      const key = 'foo';
      const obj = {
        [key]: 'bar'
      }
      // 等同于
      const obj = {};
      obj[key] = 'bar';
    ```
  - 12、对象结构赋值
    ```javascript
      const obj = { foo: 'bar', baz: 42 };
      const { foo, baz } = obj;
      console.log(foo, baz); // bar 42
    ```
  - 13、对象属性简写
    ```javascript
      const foo = 'bar';
      const baz = 42;
      const obj = { foo, baz };
      // 等同于
      const obj = { foo: foo, baz: baz };
    ```
  - 14、super 关键字
    - 指向当前对象的原型对象
    ```javascript
      const obj = {
        method() {
          console.log(super.method());
        }
      }
    ```

### 对象属性的遍历
  - 1、for...in
    - 遍历对象自身的和继承的可枚举属性（不含Symbol属性）
  - 2、Object.keys(obj)
    - 返回一个由一个给定对象的自身(不含继承的)可枚举(不含Symbol)属性组成的数组，数组中属性名的排列顺序和使用for...in循环遍历该对象时返回的顺序一致 （非IE）
  - 3、Object.getOwnPropertyNames(obj)
    - 返回一个由指定对象的所有自身属性的属性名（包括不可枚举属性但不包括Symbol值作为名称的属性）组成的数组
  - 4、Object.getOwnPropertySymbols(obj)
    - 返回一个给定对象自身的所有 Symbol 属性的数组
  - 5、Reflect.ownKeys(obj)
    - 返回一个由目标对象自身的(不含继承的)属性键组成的数组，其排列与使用 for...in 循环遍历该对象时返回的顺序一致
  - 6、Object.getOwnPropertySymbols(obj)
    - 返回一个给定对象自身的所有 Symbol 属性的数组

### 判断对象是否含有某个属性
  - 1、in
    - 判断对象是否含有某个属性，无论属性是否是原型链上的
    ```javascript
      const obj = { foo: 'bar' };
      console.log('foo' in obj); // true
    ```
  - 2、hasOwnProperty(prop)
    - 判断对象是否含有某个属性，只在对象自身上查找，不查找原型链
    ```javascript
      const obj = { foo: 'bar' };
      console.log(obj.hasOwnProperty('foo')); // true
    ```
  - 3、Object.prototype.hasOwnProperty.call(obj, prop)
    - 判断对象是否含有某个属性，只在对象自身上查找，不查找原型链，避免对象重写hasOwnProperty方法
    ```javascript
      const obj = { foo: 'bar' };
      console.log(Object.prototype.hasOwnProperty.call(obj, 'foo')); // true
    ```
  - 4、Object.hasOwn(obj, prop)(es2022新增)
    - 判断对象是否含有某个属性，只在对象自身上查找，不查找原型链，
    ```javascript
      const obj = { foo: 'bar' };
      console.log(Object.hasOwn(obj, 'foo')); // true
    ```
  - 5、Object.prototype.propertyIsEnumerable(prop)
    - 检查属性是否是对象自身的可枚举属性
    ```javascript
      const obj = { foo: 'bar' };
      console.log(obj.propertyIsEnumerable('foo')); // true
    ```
  - 6、Reflect.has(obj, prop)
    - 判断对象是否含有某个属性，无论属性是否是原型链上的
    - 如果只是检查对象自身的属性而不考虑原型链上的属性，可以使用Object.prototype.hasOwnProperty.call(obj, prop)和Object.hasOwn(obj, prop)
  
### 判断对象类型
  - typeof运算符
    - 只能判断基本类型，判断对象类型有线，返回一个字符串，如'object'、'number'、'string'、'boolean'、'undefined'、'function'、'symbol'、'bigint'
    ```javascript
      console.log(typeof {});           // "object"
      console.log(typeof []);           // "object"
      console.log(typeof null);         // "object"（这是一个历史遗留的错误）
      console.log(typeof function(){}); // "function"
      console.log(typeof 42);           // "number"
      console.log(typeof "hello");      // "string"
      console.log(typeof true);         // "boolean"
      console.log(typeof undefined);    // "undefined"
      console.log(typeof Symbol());     // "symbol"
    ```
  - instanceof运算符
    - 判断对象是否是某个构造函数的实例，返回一个布尔值
    ```javascript
      console.log([] instanceof Array);       // true
      console.log([] instanceof Object);      // true
      console.log({} instanceof Object);      // true
      console.log(function(){} instanceof Function); // true
      console.log(42 instanceof Number);      // false
      console.log("hello" instanceof String); // false
    ```
  - Object.prototype.toString.call(obj)
    - 判断对象的类型，返回一个字符串，如'[object Object]'、'[object Array]'、'[object Null]'、'[object Function]'、'[object Number]'、'[object String]'、'[object Boolean]'、'[object Undefined]'、'[object Symbol]'、'[object BigInt]' 
    ```javascript
      const toString = Object.prototype.toString;

      console.log(toString.call({}));              // "[object Object]"
      console.log(toString.call([]));              // "[object Array]"
      console.log(toString.call(new Date()));      // "[object Date]"
      console.log(toString.call(null));            // "[object Null]"
      console.log(toString.call(undefined));       // "[object Undefined]"
      console.log(toString.call(42));              // "[object Number]"
      console.log(toString.call("hello"));         // "[object String]"
      console.log(toString.call(true));            // "[object Boolean]"
      console.log(toString.call(function(){}));    // "[object Function]"
      console.log(toString.call(/regex/));         // "[object RegExp]"
    ```
  - Array.isArray(obj)
    - 判断对象是否是数组，返回一个布尔值
  
## ES6函数新增了哪些扩展
  - 1、参数默认值
    ```javascript
      function foo(x = 1) {
        console.log(x);
      }
      foo(); // 1
      foo(2); // 2
    ```
  - 2、箭头函数
    ```javascript
      const foo = (x) => x * x;
      console.log(foo(2)); // 4
    ```
  - 3、rest参数
    ```javascript
      function foo(x, ...args) {
        console.log(x);
        console.log(args);
      }
      foo(1, 2, 3, 4); // 1 [ 2, 3, 4 ]
    ```
  - 4、参数解构
    ```javascript
      function foo({ x, y }) {
        console.log(x);
        console.log(y);
      }
      foo({ x: 1, y: 2 }); // 1 2
    ```
  - 5、函数名推断
    ```javascript
      const foo = () => {};
      console.log(foo.name); // foo
    ```
  - 6、尾调用优化
    ```javascript
      function foo() {
        return bar();
      }
      function bar() {
        return baz();
      }
      function baz() {
        return 42;
      }
      console.log(foo()); // 42
    ```
  - 7、函数绑定运算符
    ```javascript
      const foo = function() {
        console.log(this);
      }.bind(this);
      foo(); // this
    ```
  - 8、新的 Function.prototype 方法
    - 1. Function.prototype[Symbol.hasInstance](obj) 用于判断一个对象是否为某个构造函数的实例

    ```javascript
      function Foo() {}
      console.log(Foo[Symbol.hasInstance](new Foo())); // true
    ```
  - 9、只要函数参数使用了默认值、解构赋值、或者扩展运算符，那么函数内部就不能显式设定为严格模式，否则会报错


ES6新增的Set、Map如何理解
  - Set
    - 类似于数组，但是成员的值都是唯一的，包括原始值或者对象引用
    - 当 Set 中的引用类型对象不再被引用且符合垃圾回收条件时，垃圾回收机制会自动清除该对象，Set 中也会失去对应的元素
    - 主要特点
      - 唯一性：Set 内部的元素是唯一的，重复的值会被自动过滤掉
      - 值的集合：Set只存储值，没有键
      - 迭代顺序：Set会记住插入的顺序，所以可以按照插入顺序进行遍历
      - 操作方法：
        - add: 添加元素 
        - delete: 删除元素
        - clear: 清空集合
        - has: 检查元素是否存在
        - size: 返回集合的大小
        - forEach: 遍历集合, 也可以使用for...of循环
  - Map
    - 类似于对象，但是键可以是任意值，包括原始值或者对象引用
    - 主要特点
      - 键的唯一性：每个键只能出现一次，重复的键会被自动过滤掉
      - 任意类型的键：Map的键可以是任意类型，包括原始值或者对象引用
      - 迭代顺序：Map 会记住键的原始插入顺序
      - 大小属性：可以轻松获取 Map 的大小
      - 操作方法
        - set: 添加元素
        - get: 获取元素
        - delete: 删除元素
        - clear: 清空集合
        - has: 检查元素是否存在
        - size: 返回集合的大小
        - forEach: 遍历集合, 也可以使用for...of循环
        - keys: 返回一个包含所有键的迭代器
        - value: 返回一个包含所有值的迭代器
  - WeakSet
    - 类似于Set, 但是成员只能是引用类型而不能是其他类型
    - 主要特点
      - 只能存储对象引用
      - 对对象的引用是弱引用
      - 垃圾回收机制会自动清除该对象
      - 不可迭代
      - 没有size属性
      - 不支持清除操作
      - 操作方法
        - add: 添加元素
        - delete: 删除元素
        - has: 检查元素是否存在
  - WeakMap
    - 类似于Map, 但是键只能是对象引用而不能是其他类型
    - 主要特点
      - 键只能是对象引用
      - 对对象的引用是弱引用
      - 不可迭代
      - 没有size属性
      - 不支持清除操作
      - 操作方法
        - set: 添加元素
        - get: 获取元素
        - delete: 删除元素
        - has: 检查元素是否存在
  - WeakSet和WeakMap的应用场景
    - 主要用于需要将额外数据附加到对象，但不希望影响对象生命周期的场景，比如DOM添加节点，或者其他需要在对象销毁时自动清理的场景

## Promise的理解
  - Promise是一个构造函数，用于创建一个异步操作的代理对象
  - Promise的状态不可逆转，一旦状态改变，就不能再改变
    - pending(进行中): 初始状态，既不是成功，也不是失败
    - fulfilled(已成功): 成功状态，表示操作成功完成
    - rejected(已失败): 失败状态，表示操作失败

  - Promise的基本用法
    - 创建Promise对象
      ```javascript
        const promise = new Promise((resolve, reject) => {
          // 异步操作
          if (/* 操作成功 */) {
            resolve(value);
          } else {
            reject(error);
          }
        });
      ```
    - 使用Promise对象
      ```javascript
        promise.then(
          (value) => {
            // 操作成功
          },
          (error) => {
            // 操作失败
          }
        );
      ```
    - Promise.all
      - 用于将多个Promise对象组合成一个新的Promise对象，只有所有Promise对象都成功时，新的Promise对象才会成功
      ```javascript
        const promise1 = new Promise((resolve, reject) => {
          setTimeout(() => {
            resolve(1);
          }, 1000);
        });

        const promise2 = new Promise((resolve, reject) => {
          setTimeout(() => {
            resolve(2);
          }, 2000);
        });

        const promise3 = new Promise((resolve, reject) => {
          setTimeout(() => {
            resolve(3);
          }, 3000);
        });
        // promise1, promise2, promise3是并发执行的，但是Promise.all会等待所有Promise对象都成功后再执行then方法
        // 并发请求：所有的 fetchUser()、fetchPosts() 和 fetchComments() 它们的请求并不会互相等待, 而是同时发起请求
        Promise.all([promise1, promise2, promise3]).then((values) => {
          console.log(values); // [1, 2, 3]
        });
      ```
    - Promise.race
      - 用于将多个Promise对象组合成一个新的Promise对象，只要有一个Promise对象成功或失败，新的Promise对象就会成功或失败
      ```javascript
        const promise1 = new Promise((resolve, reject) => {
          setTimeout(() => {
            resolve(1);
          }, 1000);
        });

        const promise2 = new Promise((resolve, reject) => {
          setTimeout(() => {
            resolve(2);
          }, 2000);
        });

        const promise3 = new Promise((resolve, reject) => {
          setTimeout(() => {
            resolve(3);
          }, 3000);
        });
        // promise1, promise2, promise3是并发执行的，但是Promise.race会等待返回最先完成的Promise对象成功或失败后再执行then方法
        // 并发请求：所有的 fetchUser()、fetchPosts() 和 fetchComments() 它们的请求并不会互相等待, 而是同时发起请求
        Promise.race([promise1, promise2, promise3]).then((value) => {
          console.log(value); // 1
        });
      ```
    - Promise.resolve
      - 用于将一个值转换为Promise对象
      ```javascript
        const promise = Promise.resolve(1);
        promise.then((value) => {
          console.log(value); // 1
        });
      ```
    - Promise.reject
      - 用于将一个错误转换为Promise对象
      ```javascript
        const promise = Promise.reject(new Error('error'));
        promise.catch((error) => {
          console.log(error); // Error: error
        });
      ```
    - Promise.allSettled
      - 用于将多个Promise对象组合成一个新的Promise对象，只有所有Promise对象都成功或失败后，新的Promise对象才会成功或失败
      ```javascript
        const promise1 = new Promise((resolve, reject) => {
          setTimeout(() => {
            resolve(1);
          }, 1000);
        });

        const promise2 = new Promise((resolve, reject) => {
          setTimeout(() => {
            reject(new Error('error'));
          }, 2000);
        });

        const promise3 = new Promise((resolve, reject) => {
          setTimeout(() => {
            resolve(3);
          }, 3000);
        });
        // promise1, promise2, promise3是并发执行的，但是Promise.allSettled会等待所有Promise对象都成功或失败后再执行then方法
        // 并发请求：所有的 fetchUser()、fetchPosts() 和 fetchComments() 它们的请求并不会互相等待, 而是同时发起请求
        Promise.allSettled([promise1, promise2, promise3]).then((results) => {
          console.log(results); // [{status: 'fulfilled', value: 1}, {status: 'rejected', reason: Error: error}, {status: 'fulfilled', value: 3}]
        });
      ```
    - Promise.any
      - 用于将多个Promise对象组合成一个新的Promise对象，只要有一个Promise对象成功，新的Promise对象就会成功
      ```javascript
        const promise1 = new Promise((resolve, reject) => {
          setTimeout(() => {
            resolve(1);
          }, 1000);
        });

        const promise2 = new Promise((resolve, reject) => {
          setTimeout(() => {
            reject(new Error('error'));
          }, 2000);
        });

        const promise3 = new Promise((resolve, reject) => {
          setTimeout(() => {
            resolve(3);
          }, 3000);
        });
        // promise1, promise2, promise3是并发执行的，但是Promise.any会等待返回第一个成功或失败的Promise对象后再执行then方法
        // 并发请求：所有的 fetchUser()、fetchPosts() 和 fetchComments() 它们的请求并不会互相等待, 而是同时发起请求
        Promise.any([promise1, promise2, promise3]).then((value) => {
          console.log(value); // 1
        });
      ```
    - async/await
      - async/await 是基于 Promise 的语法糖，使异步代码看起来像同步代码
      ```javascript
        async function fetchData() {
          const data = await fetch('URL_ADDRESS');
          return data;
        }
        fetchData().then((data) => {
          console.log(data);
        });
      ```
    - 实现异步的方式
      - 回调函数
      - Promise
      - async/await
      - 生成器函数(Generator)
        ```javascript
          function* generator() {
            yield 1;
            yield 2;
            yield 3;
          }
          const gen = generator();
          console.log(gen.next()); // {value: 1, done: false}
          console.log(gen.next()); // {value: 2, done: false}
          console.log(gen.next()); // {value: 3, done: false}
          console.log(gen.next()); // {value: undefined, done: true}
        ```
      - 观察者模式(Observer)
        ```javascript
          const observer = new MutationObserver((mutations) => {
            console.log(mutations);
          });
          observer.observe(document.body, {
            attributes: true,
            childList: true,
            subtree: true
          });
        ```
      - web worker
        ```javascript
        // main.js
          const worker = new Worker('worker.js');
          worker.onmessage = function(event) {
            console.log('Received from worker:', event.data);
          };
          worker.postMessage('Start working');

          // worker.js
          self.onmessage = function(event) {
            console.log('Received from main:', event.data);
            // 执行耗时操作
            self.postMessage('Work completed');
          };
        ```
      - 定时器

## Generator函数
  - Generator函数是ES6提供的一种异步编程解决方案，可以通过yield关键字暂停函数的执行，并在需要时恢复执行
  - Generator函数的执行过程
    - 调用Generator函数，返回一个Iterator对象
    - 调用Iterator对象的next方法，返回一个对象，对象的value属性是yield关键字后面的表达式的值，done属性是false
  - Generator函数的语法
    - 函数名前加*
    - yield关键字
    - yield*关键字
  - Generator函数的应用 
    - 异步操作
    - 数据流
    - 状态机
    - 协程
    - 迭代器

## ES6中Module的理解
  - js模块化的实现方式
  - 基本概念
    - 模块是独立的代码单元，可以导出（export）功能，也可以导入（import）其他模块的功能。
    - 每个模块都有自己的作用域，不会污染全局命名空间
  - 导出 (export)
    - 可以导出变量、函数、类等
    - 有命名导出和默认导出两种方式
      ```javascript
        // 命名导出
        export const name = 'John';
        export function sayHello() {
          console.log('Hello');
        }

        // 默认导出
        export default class Person {
          // ...
        }
      ```
  - 导入 (import)
    - 可以导入模块中的变量、函数、类等
    - 有命名导入和默认导入两种方式
      ```javascript
        // 命名导入
        import { name, sayHello } from './module.js';

        // 默认导入
        import Person from './module.js';

        // 混合导入
        import Person, { name, sayHello } from './module.js';
      ```
  - 特点
    - 静态结构：import和export语句必须位于模块的顶层。
    - 单例：无论一个模块被导入多少次，它都只会被执行一次
    - 严格模式：模块自动运行在严格模式下
  - 动态导入
    - 使用import()函数可以实现动态导入
    ```javascript
      import('./module.js').then(module => {
        // 使用module中的功能
      });
    ```
## Decorator的理解与使用场景
  - 基本概念
    - Decorator是一个函数，用于修改类和类成员的行为
    - 它可以用于类、方法、访问器、属性和参数
    - 使用@符号作为语法糖，放置在被装饰的声明之前
  - 主要类型
    - 类装饰器
    - 方法装饰器
    - 访问器装饰器
    - 属性装饰器
    - 参数装饰器
    ```javascript
      // 类装饰器
      @classDecorator
      class MyClass {
        // ...
      }

      // 方法装饰器
      class MyClass {
        @methodDecorator
        method() {
          // ...
        }
      }

      // 访问器装饰器
      class MyClass {
        @accessorDecorator
        get name() {
          // ...
        }
      }

      // 属性装饰器
      class MyClass {
        @propertyDecorator
        name: string;
      }

      // 参数装饰器
      class MyClass {
        method(@paramDecorator name: string) {
          // ...
        }
      }
    ```
  - 装饰器的应用场景
    - 日志记录
    - 性能监控
  
## js中的数据类型？存储上的差别
  - 类型
    - 基本类型：string、number、boolean、null、undefined
    - 引用类型：object、array、function、date、regexp
  - 存储
    - 基本类型：存储在栈中
    - 引用类型：存储在堆中
  - 区别

## 字符串常用方法
  - concat: 连接两个或多个字符串，返回一个新的字符串
  - fromCharCode: 根据Unicode编码创建一个字符串
  - raw: 返回一个字符串的原始字符串值
  - includes: 判断一个字符串是否包含另一个字符串，返回一个布尔值
  - indexOf: 返回一个字符串中指定字符第一次出现的位置，如果没有找到则返回-1
  - match: 返回一个字符串中指定正则表达式的匹配结果，如果没有找到则返回null
  - replace: 返回一个字符串中指定字符串或正则表达式的匹配结果被替换后的新字符串
  - repeat: 返回一个字符串重复指定次数后的新字符串
  - replace: 返回一个字符串中指定字符串或正则表达式的匹配结果被替换后的新字符串
  - search: 返回一个字符串中指定字符串或正则表达式的第一次出现的位置，如果没有找到则返回-1
  - slice: 返回一个字符串中指定位置开始到结束位置之间的子字符串
  - trim: 返回一个字符串去掉前后空格后的新字符串
  - toString: 返回一个字符串的原始字符串值

## js转换机制
  - 强制类型转换(显式)
    - String(): 转换为字符串
    - Number(): 转换为数字
    - Boolean(): 转换为布尔值
    - parseInt(): 转换为整数
    - parseFloat(): 转换为浮点数

  - 自动转换(隐式)
    - 运算符
      '5' + 1 // '51'
      '5' - '10' // -5
      true - 1 // 0
      true + true // 2
      '5' * '10' // 50
      '5' * [] // 0

        
## 深拷贝、浅拷贝
  - 浅拷贝
    - 只复制对象的第一层属性
    - 如果对象的属性是基本类型，则直接复制
    - 如果对象的属性是引用类型，则复制的是引用地址
    - 实现方法
      - Object.assign()
      - 扩展运算符{...obj}
      - Array.prototype.slice()
      - Array.prototype.concat()
  - 深拷贝
    - 递归复制对象的所有属性
    - 实现方法
      - JSON.parse(JSON.stringify(obj))
      - 递归复制
      - 使用lodash库的_.cloneDeep()方法
  - 区别
    - 复制深度
      - 浅拷贝只复制一层
      - 深拷贝复制所有层级
    - 引用关系
      - 浅拷贝中，原对象和新对象共享嵌套的引用类型数据，属性为对象时，两个对象指向同一个地址
      - 深拷贝中，原对象和新对象完全独立，属性为对象时，两个对象指向不同的地址
    - 性能：
      - 浅拷贝通常比较快，占用资源少
      - 深拷贝可能比较慢，占用资源多

## 闭包的理解
  - 闭包是指一个函数及其词法环境的组合，这个函数包含了这个闭包可以访问的所有局部变量
  - 基本原理
    - 在js中函数可以访问它们创建时的词法作用域
    - 当函数在其定义的词法作用域以外执行时，它们仍然可以访问这个词法作用域
    ```javascript
      function outerFn(x) {
        var y = 10;
        return function innerFn(z) {
          console.log(x + y + z);
        }
      }
      const closure = outerFn(5);
      closure(); // 12
    ```
  - 闭包的特点
    - 可以访问外部函数的变量和参数
    - 可以记住并访问所在的词法作用域
    - 可以通过返回函数来实现函数的柯里化
    - 可以实现函数的私有变量和方法

  - 使用场景
    - 数据私有化
    ```javascript
      function counter() {
        let count = 0
        return {
          increment: function() {
            count++
          },
          getCount: function() {
            return count
          }
        }
      }
      const counterObj = counter()
      counterObj.increment()
      counterObj.getCount() // 1
    ```
    - 模块化
    ```javascript
      function module(id) {
        var privateVariable = 'private'
        function privateFunction() {
          console.log(privateVariable)
        }
        return {
          publicFunction: function() {
            // 可以访问privateVariable和privateFunction
          }
        }
      }
    ```
    - 定时器和异步操作，控制执行任务的顺序
    ```javascript
      function task(name) {
        setTimeout(function() {
          console.log('Task ' + name + ' is done')
        }, 1000)
      }
      task('A')
      task('B')
      task('C')
      // 输出结果：Task A is done
      // Task B is done
      // Task C is done
    ```
    
  - 闭包的优点
    - 数据封装和隐藏
    - 实现函数记忆
    - 实现函数柯里化
    - 在异步编程中保持状态

  - 注意事项
    - 内存使用：闭包会保留对外部变量的引用，可能导致内存不被及时释放
    - 性能：闭包会导致函数的执行速度变慢
    - 变量污染：闭包会导致变量污染，可能会导致命名冲突

  - 循环与闭包
    ```javascript
      for (var i = 0; i < 5; i++) {
        setTimeout(function() {
          console.log(i)
        }, 1000)
      }
      // 输出结果：5 5 5 5 5

      // 修复方法：
      for (let i = 0; i < 5; i++) {
        setTimeout(function() {
          console.log(i)
        }, 1000)
      }
      // 输出结果：0 1 2 3 4
    ```
  - 闭包与this: 闭包中的this指向可能会导致混乱
    ```javascript
      const obj = {
        name: '小明',
        sayLater: function() {
          setTimeout(function() {
            console.log(this.name)
          }, 1000)
        }
      }
      obj.sayLater() // 输出结果：undefined

      // 修复方法：
      const obj = {
        name: '小明',
        sayLater: function() {
          const that = this
          setTimeout(function() {
            console.log(that.name)
          }, 1000)
        }
      }
      obj.sayLater() // 输出结果：小明
    ``` 
  - 函数柯里化
    - 函数柯里化是一种在函数编程中常用的技术，它涉及将一个接受多个参数的函数转换为一系列使用一个参数的函数。
    ```javascript
      function add(x, y) {
        return x + y
      }
      // 柯里化
      function add(x) {
        return function(y) {
          return x + y
        }
      }
      console.log(add(1, 3))  // 4
      console.log(add(1)(3))  // 4
    ```
    - 实现通用柯里化函数
    ```javascript
      function curry(fn) {
        return function curried(...args) {
          if (args.length >= fn.length) {
            return fn.apply(this, args)
          } else {
            return function(...args2) {
              return curried.apply(this, args.concat(args2))
            }
          }
        }
      }
    ```
      - 使用场景
        - 函数组合
          ```javascript
            const compose = (f, g) => x => f(g(x));
            const toUpperCase = str => str.toUpperCase();
            const exclaim = str => str + '!';
            const shout = compose(exclaim, toUpperCase);

            console.log(shout('hello'));  // HELLO!
          ```
        - 事件处理
          ```javascript
          const handleChange = curry((fieldName, event) => {
            console.log(`${fieldName} changed to ${event.target.value}`);
          });

          input.addEventListener('change', handleChange('username'));

          ```
        - 数据验证
          ```javascript
            const validate = curry((validator, value) => {
              return validator(value);
            });

            const isNotEmpty = v => v.trim().length > 0;
            const isNumber = v => !isNaN(Number(v));

            const validateNotEmpty = validate(isNotEmpty);
            const validateNumber = validate(isNumber);

            console.log(validateNotEmpty("hello"));  // true
            console.log(validateNumber("123"));      // true
          ```
## 作用域链
  - 作用域是指变量（变量作用域又称上下文）和函数生效（能被访问）的区域或集合 
  - 1.基本概念 
    - 作用域链是一系列变量对象的列表或链接
    - 它定义了代码对变量和函数的访问权限
    - 作用域链的创建和变量的查找与函数的定义位置有关，而不是调用位置
  - 2.作用域链的形成
    - 当一个函数被创建时，它的作用域链就被创建并保存在函数的内部属性 [[Scope]] 中
    - 当函数被调用时，会创建一个新的执行上下文
    - 这个执行上下文包含自己的变量对象（包含局部变量、函数参数等）
    - 执行上下文的作用域链由当前的变量对象和函数的 [[Scope]] 属性组成
  - 3.变量查找过程
    - 当一个变量被访问时，会从当前执行上下文的变量对象开始查找
    - 如果找不到，就会沿着作用域链向上查找，直到找到为止
    - 如果在全局执行上下文中都找不到，就会抛出 ReferenceError 错误

## EventLoop理解
  - 事件循环是JavaScript中处理异步操作的核心机制，它解释了javascript如何在单线程中处理多个异步操作。
  - 基本概念
    - JavaScript是单线程运行的
    - EventLoop允许JavaScript执行非阻塞的I/O操作
  - EventLoop的组成
    - 调用栈
      - 记录程序执行的位置
      - 调用函数时被压入调用栈
      - 函数执行完毕后被弹出调用栈
    - 堆
      - 对象被分配的内存地址
    - 任务队列
      - 存放待执行的异步任务
      - 异步任务分为宏任务和微任务
      - 宏任务包括：script、setTimeout、setInterval、UI交互、postMessage、I/O
      - 微任务包括：Promise、MutationObserver

    - 事件循环
      - 持续检查调用栈和队列

    - 重要概念
      - 宏任务
        - 包括： script、setTimeout、setInterval、UI交互、postMessage、I/O
        - 每次事件循环只处理一个宏任务
      - 微任务
        - 包括：Promise、MutationObserver
        - 当前任务结束后立即执行
        - 微任务队列被清空之后才会执行下一个宏任务

    - 事件循环步骤
      - 1、执行同步代码，这属于宏任务
      - 2、执行栈为空，查看是否有微任务需要执行
      - 3、执行所有微任务
      - 4、如有必要会渲染UI
      - 5、然后开始下一轮事件循环，执行宏任务中的其中一个
      
## 原型与原型链
  - 原型：
    - 每个JavaScript对象(null、undefined除外)都有一个属性__proto__，指向该对象的原型对象
    - 对象以其原型为模板，从原型继承方法和属性
  - 原型链
    - 原型链是JavaScript实现继承的方式
    - 当访问一个对象的属性是，如果这个对象本身没有这个属性，那么会去它的原型对象中找
    - 如果原型对象也没有这个属性，那么会去它的原型的原型对象中找，以此类推，直到找到属性或原型为null为止
  - 关键概念
    - __proto__: 每个对象都有一个隐式属性__proto__，指向该对象的原型对象
    - prototype: 函数对象特有的属性，当一个函数被用作构造函数时，它的实例对象的__proto__会指向这个prototype
    - constructor: 每个函数对象都有一个constructor属性，指向构造函数
  - 注意事项
    - 避免直接修改__proto__，它可能影响新能
    - 使用Object.create()或者Object.setPrototypeOf()来创建对象
    ```javascript
      const obj = Object.create(null);
      obj.name = 'John';
      console.log(obj.name); // John
    ```
## 继承的实现
  - 原型链继承
    ```javascript
      function Parent() {
        this.name = 'parent';
      }
      Parent.prototype.say = function() {
        console.log(this.name);
        return 'parent say';
      }
      function Child() {
        this.name = 'child';
      }
      Child.prototype = new Parent();
      const child = new Child();
      console.log(child.name); // child
      console.log(child.say()); // parent say
    ```
  - 构造函数继承(call)
    ```javascript
      function Parent() {
        this.name = 'parent';
      }
      Parent.prototype.say = function() {
        console.log(this.name + ' parent say');
        return 1
      }
      function Child() {
        Parent.call(this);
        this.name = 'child';
      }
      Child.prototype = Object.create(Parent.prototype);
      Child.prototype.constructor = Child;
      const child = new Child();
      console.log(child.name, '1'); `
      console.log(child.say(), '2'); 
    ```
  - 组合继承
    ```javascript
      function Parent() {
        this.name = 'parent';
      }
      Parent.prototype.say = function() {
        console.log(this.name);
        return 'parent say';
      }
      function Child() {
        Parent.call(this);
        this.name = 'child';
      }
      Child.prototype = new Parent();
      const child = new Child();
      console.log(child.name); // child
      console.log(child.say()); // parent say
    ```
 
## this的理解
  - this是JavaScript中一个非常重要的概念，它的值取决于函数的调用方式
  - 基本概念
    - this是一个关键字，他在执行时绑定，指向当前执行上下文的对象
    - this的值是在运行时确定的，而不是在编写时确定的
  - this的绑定规则
    - 默认绑定
      - 在非严格模式下，this指向全局对象(浏览器中是window，Node中是global)
      - 在严格模式下，this指向undefined
    - 隐式绑定
      - 当函数作为对象的方法被调用时，this指向该对象
    - 显示绑定
      - 使用call、apply、bind方法可以显式地指定this的值
      ```javascript
        function greet() {
          console.log(`Hello, ${this.name}`);
        }
        const person = { name: 'John' };
        greet.call(person); // 输出 'Hello, John'
        greet.apply(person); // 输出 'Hello, John'
        const boundGreet = greet.bind(person);
        boundGreet(); // 输出 'Hello, John'

      ```
    - new绑定
      - 使用new关键字调用函数时，会创建一个新的对象，并将this绑定到该对象上
      ```javascript
        function Person(name) {
          this.name = name;
        }
        const john = new Person('John');
        console.log(john.name); // 输出 'John'
      ```
    - 箭头函数
      - 箭头函数没有自己的this，它的this值取决于外部作用域的this值
      ```javascript
        const obj = {
          name: 'MyObject',
          regularFunc: function() {
            console.log(this.name);
          },
          arrowFunc: () => {
            console.log(this.name);
          }
        };
        obj.regularFunc(); // 输出 'MyObject'
        obj.arrowFunc(); // 输出 undefined（在浏览器中）
      ```
  - 优先级
    - new绑定 > 显式绑定 > 隐式绑定 > 默认绑定
## 执行上下文和执行栈
  - 执行上下文
    - 执行上下文是JavaScript代码执行环境的抽象概念，它包含了当前执行代码的变量、函数和对象等信息
    - 类型
      - 全局执行上下文：只有一个，在浏览器中是window对象，在Node中是global对象
      - 函数执行上下文： 每个函数都有自己的执行上下文，当函数被调用时，会创建一个新的执行上下文
      - eval执行上下文： 当eval函数被调用时，会创建一个新的执行上下文
    - 组成部分
      - 变量对象： 包含了当前执行上下文中的变量、函数和对象等信息
      - 作用域链： 包含了当前执行上下文中的作用域链信息
      - this： 指向当前执行的对象
    - 创建过程
      - 创建阶段
        - 创建变量对象
        - 创建作用域链
        - 确定this指向
      - 执行阶段
        - 变量赋值
        - 函数调用
        - 代码执行
  - 执行栈
    - 执行栈也被成为调用栈，它是一个后进先出的数据结构，用于存储代码执行时的上下文信息
    - 工作原理
      - 当JavaScript程序开始执行时，会创建一个全局执行上下文并将其压入执行栈中
      - 每当一个函数被调用，就会为该函数创建一个新的执行上下文并将其压入执行栈中
      - 当函数执行完毕后，会将该函数的执行上下文从执行栈中弹出
      - 程序结束时，全局执行上下文也会被弹出

## JavaScript中的事件模型
  - 基本概念
    - 事件：在浏览器或页面中发生的动作，如：点击、加载、滚动等
    - 事件处理程序：响应事件的函数
    - 事件监听器：将事件处理程序附加到特定元素的方法
  - 事件流
    - 事件流是指事件在DOM中传播的顺序
    - 一般事件流都会有三个阶段：
      - 捕获阶段：事件从不具体的节点开始，自上而下传播到具体的节点
      - 目标阶段：事件到达目标节点
      - 冒泡阶段：事件从具体的节点开始，自下而上传播到不具体的节点
  - 事件模型
    - 原始事件模型(DOM0)：事件绑定监听函数比较简单，分为两种
      ```html
        <input type="button" onclick="fn()">
      ```
      ```javascript
        var btn = document.getElementById('btn');
        btn.onclick = function() {
          console.log('clicked');
        }
      ```
      - 特性：
        - 绑定速度快
        - 一个类型的事件只能绑定一次
        - 只支持冒泡，不支持捕获

    - 标准事件模型(DOM2)：该事件模型中，一次时间共有三个阶段
      - 事件捕获阶段：事件从document对象开始，自上而下传播到目标元素
      - 事件目标阶段：事件到达目标元素
      - 事件冒泡阶段：事件从目标元素开始，自下而上传播到document对象
      - 事件绑定及移除方式：
        ```javascript
          // eventType: 事件类型, handler: 事件处理程序, useCapture: 是否在捕获阶段触发事件
          addEventListener(eventType, handler, useCapture)
          removeEventListener(eventType, handler, useCapture)
        ```

## 事件代理
  - 事件代理：将事件绑定到父元素上，而不是直接绑定到子元素上。当事件冒泡到父元素时，父元素可以通过事件对象获取到子元素的信息，从而实现事件代理
  - 应用场景
    - 当页面中有大量元素需要绑定事件时，可以使用事件代理来提高性能
## new操作符做了什么
  - new操作符的作用是创建一个新的对象，并将该对象的原型指向构造函数的prototype属性
  ```javascript
    function Person(name) {
      this.name = name;
    }
    Person.prototype.sayName = function() {
      console.log(this.name);
    }
    var person = new Person('John');
    person.sayName(); // 输出 'John'
  ```
  - 实现new操作符
  ```javascript
    function myNew(fn, ...args) {
      // 创建一个空对象，并将该对象的原型指向构造函数的prototype属性
      let obj = Object.create(fn.prototype);
      // 将构造函数的this指向obj，并执行构造函数
      let result = fn.apply(obj, args);
      // 如果构造函数返回的是一个对象，则返回该对象，否则返回obj
      return result instanceof Object ? result : obj;
    }
    let person = myNew(Person, 'John');
    person.sayName(); // 输出 'John'
  ```
## ajax的理解
  - Ajax（Asynchronous JavaScript and XML）是一种在无需重新加载整个页面的情况下，与服务器交换数据，更新部分网页的技术。
  - ajax原理：通过XMLHttpRequest对象来向服务器发送异步请求，从服务器获得数据后，通过JavaScript来更新页面。
  - 实现过程
    - 创建XMLHttpRequest对象
    - 通过XMLHttpRequest对象的open方法与服务器建立链接
    - 构建请求所需的数据内容，并通过XMLHttpRequest对象的send方法发送给服务器
    - 通过XMLHttpRequest对象的onreadystatechange方法监听服务器的响应状态，当状态变为4时，表示服务器响应完成，可以通过XMLHttpRequest对象的responseText属性获取服务器响应的数据
    - 通过JavaScript来更新页面
  - 优点
    - 无需重新加载整个页面
    - 可以更新部分页面
    - 可以实现动态交互
  - 缺点
    - 需要浏览器支持
    - 需要服务器支持
    - 需要JavaScript支持

## bind、call、apply的区别,如何实现bind
  - bind、call、apply都是JavaScript中的内置函数，它们的作用是改变函数的this指向，并调用该函数
  - apply接受两个参数，第一个参数是this的指向，第二个参数是函数的参数列表，改变this指向后原函数会立即执行，且此方法只是临时改变this指向一次，执行完后会恢复原来的this指向
  ```javascript
    function fn(...args) {
      console.log(this, args);
    }
    let obj = {
      name: 'obj'
    }
    fn.apply(obj, [1, 2, 3]); // this会变成传入的obj, 输出 obj [1, 2, 3]
    fn(1, 2, 3); // 输出 window [1, 2, 3]
  ```
  - call接受两个参数，第一个参数是this的指向，第二个参数是函数的参数列表，跟apply一样，改变this指向后原函数会立即执行，且 此方法只是临时改变this指向，执行完后会恢复原来的this指向
  ```javascript
    function fn(...args) {
      console.log(this, args);
    }
    let obj = {
      name: 'obj'
    }
    fn.call(obj, 1, 2, 3); // this会变成传入的obj, 输出 obj [1, 2, 3]
    fn(1, 2, 3); // 输出 window [1, 2, 3]
  ```
  - bind接受两个参数，第一个参数是this的指向，后面传入的也是一个参数列表(但是这个参数列表可以分多次传入),改变this指向后不会立即执行，而是返回一个永久改变this指向的函数
  ```javascript
    function fn(...args) {
      console.log(this, args);
    }
    let obj = {
      name: 'obj'
    }
    let fn2 = fn.bind(obj, 1, 2, 3);
    fn2(); // this会变成传入的obj, 输出 obj [1, 2, 3]
    fn(1, 2, 3); // 输出 window [1, 2, 3]
  ```
  - 实现bind
  ```javascript
    Function.prototype.myBind = function (context) {
      // 判断调用对象是否为函数
      if (typeof this !== "function") {
        throw new TypeError("Error");
      }

      // 获取参数
      const args = [...arguments].slice(1),
        fn = this;

      return function Fn() {
        // 根据调用方式，传入不同绑定值
        return fn.apply(this instanceof Fn ? new fn(...arguments) : context, args.concat(...arguments)); 
      }
    }
  ```
## 防抖和节流
  - 防抖原理：在事件被触发n秒后再执行回调,如果在这n秒内又被触发,则重新计时
  ```javascript
    function debounce(fn, delay) {
      let timer = null;
      return function (...args) {
        if (timer) clearTimeout(timer);
        timer = setTimeout(() => {
          fn.apply(this, args);
        }, delay);
      }
    }

    // 使用示例
    const debouncedFn = debounce(() => console.log('Debounced'), 1000);
    window.addEventListener('scroll', debouncedFn);
  ```
  - 节流原理：在一定时间内,只执行一次函数
  ```javascript
    function throttle(fn, delay) {
      let lastTime = 0;
      return function (...args) {
        const now = Date.now();
        if (now - lastTime >= delay) {
          fn.apply(this, args);
          lastTime = now;
        }
      }
    }

    // 使用示例
    const throttledFn = throttle(() => console.log('Throttled'), 1000);
    window.addEventListener('scroll', throttledFn);
  ```
## 如何判断一个对象是否为空对象
  - 判断一个对象是否为空对象，可以使用Object.keys()方法，如果该方法返回一个空数组，则说明该对象为空对象
  ```javascript
    function isEmptyObject(obj) {
      return Object.keys(obj).length === 0;
    }
  ```
## DOM常见操作
  - 创建节点
   ```javascript
    // 创建一个文本节点
    const textNode = document.createTextNode('Hello, World');

    // 创建一个元素节点
    const div = document.createElement('div');

    // 创建一个属性节点
    const attr = document.createAttribute('class');
    attr.value = 'container';
    div.setAttributeNode(attr);
   ```  
  - 查询节点
    ```javascript
      // 通过id查询节点
      const div = document.getElementById('container');

      // 通过类名查询节点
      const divs = document.getElementsByClassName('container');

      // 通过标签名查询节点
      const divs = document.getElementsByTagName('div');

      // 通过选择器查询节点
      document.querySelector('.element')
    ```
  - 更新节点
  - 新增节点
    ```javascript
      // 添加一个文本节点作为子节点
      div.appendChild(textNode);

      // 添加一个元素节点作为子节点
      div.appendChild(div);
    ```
  - 删除节点
    ```javascript
      // 删除一个子节点
      div.removeChild(div);
    ```
## BOMl理解
  - 常见BOM对象
    - 1.window：window对象有双重角色，即是浏览器窗口的一个接口，又是全局对象
    - 2.location：location对象用于获取当前页面的URL信息，可以通过location对象的属性来获取URL的各个部分，如：protocol、host、pathname、search、hash等
    - 3.navigator：navigator对象用于获取浏览器的信息，如：userAgent、language等
    - 4.screen：screen对象用于获取屏幕的信息，如：width、height等
    - 5.history：history对象用于获取浏览器的历史记录，可以通过history对象的pushState和replaceState方法来添加和修改历史记录，也可以通过history对象的back、forward、go方法来实现浏览器的前进、后退和跳转
## 浏览器存储
  - 浏览器存储分为两种：
    - 1.Cookie：Cookie 是最早的本地存储方式，主要用于客户端和服务器之间的通信
      ```javascript
        // 设置Cookie
        document.cookie = "username=John; expires=Thu, 18 Dec 2023 12:00:00 GMT; path=/";

        // 获取Cookie
        const cookie = document.cookie;

        // 删除Cookie
        document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/";
      ```
      - 特点:
        - 容量限制：通常不超过 4KB
        - 随 HTTP 请求发送到服务器
        - 可以设置过期时间
          ```javascript
            // 设置Cookie的过期时间
            document.cookie = "username=John; expires=Thu, 18 Dec 2023 12:00:00 GMT; path=/";
          ```
        - 只能存储字符串
        - 可被用户禁用
        - 被同源策略限制
    - 2.localStorage：提供了一种持久化的存储方式，数据存储在本地，不会随请求发送到服务器
      ```javascript
        // 设置localStorage
        localStorage.setItem("username", "John");

        // 获取localStorage
        const username = localStorage.getItem("username");

        // 删除localStorage
        localStorage.removeItem("username");

        // 清空所有数据
        localStorage.clear();
      ```
      - 特点:
        - 容量限制：通常不超过 5MB
        - 数据永久保存，除非手动清除
        - 仅在客户端使用，不与服务器通信
    - 3.sessionStorage：sessionStorage 类似于 localStorage，但数据只在当前会话中有效
      ```javascript
        // 设置sessionStorage
        sessionStorage.setItem("username", "John");

        // 获取sessionStorage
        const username = sessionStorage.getItem("username");

        // 删除sessionStorage
        sessionStorage.removeItem("username");

        // 清空所有数据
        sessionStorage.clear();
      ```
      - 特点:
        - 容量与 localStorage 相同
        - 数据只在当前会话中有效
        - 仅在客户端使用，不与服务器通信
    - 4.IndexedDB：一种低级 API，用于客户端存储大量结构化数据。
      ```javascript
        // 打开数据库
        let request = indexedDB.open("MyDatabase", 1);

        request.onerror = function(event) {
          console.log("数据库打开失败");
        };

        request.onsuccess = function(event) {
          let db = event.target.result;
          console.log("数据库打开成功");
        };

        // 在 onupgradeneeded 中创建对象仓库
        request.onupgradeneeded = function(event) {
          let db = event.target.result;
          let objectStore = db.createObjectStore("customers", { keyPath: "id" });
        };
      ```
      - 特点:
        - 可存储大量数据
        - 支持索引和事务
        - 异步 API，不会阻塞主线程

## 浏览器缓存
  - 浏览器缓存分为两种：
    - 1.强缓存：强缓存是通过设置 HTTP 响应头中的 Expires 或 Cache-Control 来实现的
      - Expires：指定一个绝对时间，表示资源的过期时间，如果在过期时间之前，浏览器将直接从缓存中读取资源，而不会发送请求到服务器
      ```javascript
        // 设置强缓存
        response.setHeader("Expires", new Date(Date.now() + 3600 * 1000).toUTCString());
      ```
      - Cache-Control：指定一个相对时间，表示资源的过期时间，如果在过期时间之前，浏览器将直接从缓存中读取资源，而不会发送请求到服务器
      ```javascript
        // 设置强缓存
        response.setHeader("Cache-Control", "max-age=3600");
      ```
  - 2.协商缓存是在强缓存失效后，浏览器携带缓存标识向服务器发起请求，由服务器根据缓存标识决定是否使用缓存的机制
    - Last-Modified/ If-Modified-Since：
      - Last-Modified：服务器在响应请求时，通过 Last-Modified 响应头指定资源的最后修改时间
      - If-Modified-Since：客户端再次请求时，在请求头中携带上次收到的最后修改时间
      ```javascript
        // 设置协商缓存
        response.setHeader("Last-Modified", new Date(Date.now()).toUTCString());
        response.setHeader("If-Modified-Since", new Date(Date.now()).toUTCString());
      ```
    - ETag / If-None-Match：ETag 是服务器响应请求时，返回当前资源的唯一标识符
      ```javascript
        // 设置协商缓存
        response.setHeader("ETag", "123456");
        response.setHeader("If-None-Match", "123456");
      ```
  - 缓存流程：
    1.浏览器第一次请求资源时，服务器返回资源的同时，在响应头中设置缓存相关的字段

    2.浏览器再次请求资源时，浏览器判断是否命中强缓存
      - 如果命中，直接使用缓存数据
      - 如果未命中，则进行协商缓存

    3.协商缓存时，浏览器发送带有缓存标识的请求
     - 如果服务器认为缓存仍然有效，返回 304 状态码
     - 如果服务器认为缓存已失效，返回 200 状态码和新的资源
  - 缓存策略
    - 频繁变动的资源：使用 Cache-Control: no-cache，每次都需要向服务器验证缓存是否有效
    - 不常变化的资源：使用 Cache-Control: max-age=31536000 等长期缓存策略
## 尾递归
  - 尾递归是指函数的最后一步是调用自身，而不是返回值，这样可以避免使用额外的栈空间来保存中间结果
  ```javascript
    function factorial(n, total = 1) {
      if (n === 0) {
        return total;
      }
      return factorial(n - 1, n * total);
    }
  ```
  - 应用场景：数组求和、斐波那契数列、阶乘、数组扁平化

## 内存泄漏
  - 内存泄漏是指程序中已动态分配的堆内存由于某种原因程序未释放或无法释放，造成系统内存的浪费，导致程序运行速度减慢甚至系统崩溃等严重后果
  - 常见的内存泄漏
    - 1.全局变量：未及时清除的全局变量会一直占用内存，直到页面关闭
      ```javascript
        function leakGlobal() {
          leakedVariable = 'I am leaked';
        }
        // 未使用 var、let 或 const 声明的变量会成为全局变量，可能导致内存泄漏
      ```
    - 2.定时器和回调函数
      ```javascript
        function setCallback() {
          const largeData = new Array(1000000);
          setInterval(() => {
            console.log(largeData.length);
          }, 1000);
        }

        // 定时器和回调函数未及时清除，会导致内存泄漏
      ```
    - 3.闭包
      ```javascript
        function createClosure() {
          const largeData = new Array(1000000);
          return function() {
            console.log(largeData.length);
          }
        }

        const closure = createClosure();

        // 闭包未及时清除，会导致内存泄漏
      ```
    - 4.事件监听
      ```javascript
        function addListener() {
          const element = document.getElementById('element');
          element.addEventListener('click', () => {
            // 处理点击事件
          });
        }
        // 事件监听未及时清除，会导致内存泄漏
      ```
    - 5.DOM 元素引用
      ```javascript
        const elements = {
          button: document.getElementById('button'),
          image: document.getElementById('image'),
          text: document.getElementById('text')
        };

        function removeButton() {
          document.body.removeChild(document.getElementById('button'));
          // 这里 elements.button 仍然引用着 DOM 元素
        }
      ```
## 函数式编程的理解
  - 函数式编程是一种"编程范式"（programming paradigm），一种编写程序的方法论
  - 主要的编程范式有三种：命令式编程，声明式编程和函数式编程
  - 相比命令式编程，函数式编程更加强调程序执行的结果而非执行的过程，倡导利用若干简单的执行单元让计算结果不断渐进，逐层推导复杂的运算，而非设计一个复杂的执行过程
  - 核心概念
    - 纯函数：纯函数是函数式编程的基础，它具有以下特征：
      - 给定相同的输入，总是返回相同的输出
      - 不产生副作用（不修改外部状态）
      ```javascript
        // 纯函数示例
        function add(a, b) {
          return a + b;
        }

        // 非纯函数示例（有副作用）
        let count = 0;
        function incrementCount() {
          count++;
        }
      ```
    - 高阶函数：高阶函数是指可以接受函数作为参数和/或返回函数的函数
      ```javascript
        // 高阶函数示例
        function map(arr, fn) {
          return arr.map(fn);
        }

        const double = x => x * 2;
        console.log(map([1, 2, 3], double)); // [2, 4, 6]
      ```
    - 函数组合：函数组合是函数式编程的核心概念之一，它指的是将多个函数组合在一起形成一个新的函数，从而实现复杂的功能
      ```javascript
        // 函数组合示例
        const compose = (f, g) => x => f(g(x));

        const addOne = x => x + 1;
        const double = x => x * 2;

        const addOneThenDouble = compose(double, addOne);
        console.log(addOneThenDouble(3)); // 8
      ```
    - 柯里化：柯里化是函数式编程的核心概念之一，它指的是将一个多参数函数转换成多个单参数函数的组合，从而实现参数复用和函数组合
      ```javascript
        // 柯里化示例
        const curry = (fn) => { 
          return function curried(...args) {
            if (args.length >= fn.length) {
              return fn(...args);
            } else {
              return (...args2) => curried(...args, ...args2);
            }
          };
        };

        const add = (a, b, c) => a + b + c;
        const curriedAdd = curry(add);

        console.log(curriedAdd(1)(2)(3)); // 6
        console.log(curriedAdd(1, 2)(3)); // 6
        console.log(curriedAdd(1, 2, 3)); // 6
      ```
  - 优缺点
    - 优点：
      - 可读性高：函数式编程的代码通常更简洁、易读、易于理解
      - 可维护性高：函数式编程的代码通常更容易测试和调试，因为可以将复杂的逻辑分解成更小的、更易于理解的函数
      - 可扩展性高：函数式编程的代码通常更容易扩展和重用，因为可以将复杂的逻辑分解成更小的、更易于理解的函数
    - 缺点：
      - 学习成本高：函数式编程的概念和语法相对较难理解和掌握
      - 性能问题：函数式编程的代码通常会比命令式编程的代码更慢，因为需要更多的计算和内存开销
      - 不适用于所有场景：函数式编程并不是万能的，它并不适用于所有场景，在某些情况下，命令式编程可能更适合

## 函数缓存
  - 函数缓存，就是将函数运算过的结果进行缓存
  - 实现： 闭包、函数柯里化、高阶函数
## JavaScript 中的数字精度丢失
  - 原因
    - JavaScript 使用 IEEE 754 标准来表示数字，该标准使用 64 位来表示数字，其中 52 位用于表示数字的值，剩余 11 位用于表示数字的指数部分
    ```javascript
      0.1 + 0.2 === 0.3  // false
      0.1 + 0.2  // 0.30000000000000004

      1.0 - 0.9 // 0.09999999999999998

      0.3 / 0.1 // 2.9999999999999996

    ```
  - 解决方案
    - 1.将小数转换为整数，然后再转换为小数
    - 2.使用第三方库，如 decimal.js
    - 3.使用toFixed()方法
    - 4.使用Math.round()方法

## 如何判断一个元素是否在可视范围内
  - 1.使用 IntersectionObserver API
    ```javascript
      const observer = new IntersectionObserver((entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            // 元素在可视范围内
          }
        });
      });

      observer.observe(element);
    ```
## 大文件断点续传
  - 原理
    - 文件切片：将大文件分割成多个小块
    ```javascript
      function createFileChunk(file, size = 5 * 1024 * 1024) {
        const chunks = [];
        let cur = 0;
        while (cur < file.size) {
          chunks.push({ file: file.slice(cur, cur + size) });
          cur += size;
        }
        return chunks;
      }

    ```
    - 分片上传：逐个上传这些小块
      ```javascript
        async function uploadChunks(chunks) {
          const requests = chunks.map(({ file }, index) => {
            const formData = new FormData();
            formData.append('chunk', file);
            formData.append('index', index);
            return axios.post('/upload', formData);
          });
          await Promise.all(requests);
        }

      ```
    - 断点记录：记录已上传的切片信息
    - 续传：从上次中断的地方继续上传
    ```javascript
      // 断点续传
      async function resumableUpload(file) {
        const chunks = createFileChunk(file);
        const uploadedChunks = await getUploadedChunks(file.name);
        
        const remainingChunks = chunks.filter((chunk, index) => 
          !uploadedChunks.includes(index)
        );

        await uploadChunks(remainingChunks);
        await mergeRequest(file.name);
      }

      async function getUploadedChunks(fileName) {
        const response = await axios.get(`/uploaded-chunks?fileName=${fileName}`);
        return response.data.uploadedChunks;
      }

      async function mergeRequest(fileName) {
        await axios.post('/merge', { fileName });
      }

    ```

    使用 Web Workers 优化性能

    ```javascript
      // main.js
      const worker = new Worker('worker.js');

      worker.onmessage = function(e) {
        console.log('Worker said: ', e.data);
      };

      worker.postMessage({ file: file, chunkSize: 5 * 1024 * 1024 });

      // worker.js
      self.onmessage = function(e) {
        const { file, chunkSize } = e.data;
        const chunks = createFileChunk(file, chunkSize);
        self.postMessage(chunks);
      };

    ```
    - 合并文件：服务器端接收到所有切片后，将它们合并成完整文件
      ```javascript
      // 后端实现
        const express = require('express');
        const multer = require('multer');
        const fs = require('fs');
        const path = require('path');

        const app = express();
        const upload = multer({ dest: 'uploads/' });

        app.post('/upload', upload.single('chunk'), (req, res) => {
          const { index } = req.body;
          const fileName = req.file.originalname;
          
          // 保存切片
          fs.renameSync(
            req.file.path,
            path.join('uploads', `${fileName}-${index}`)
          );
          
          res.send('Chunk uploaded');
        });

        app.get('/uploaded-chunks', (req, res) => {
          const { fileName } = req.query;
          const uploadedChunks = fs.readdirSync('uploads')
            .filter(file => file.startsWith(fileName))
            .map(file => parseInt(file.split('-')[1]));
          
          res.json({ uploadedChunks });
        });

        app.post('/merge', (req, res) => {
          const { fileName } = req.body;
          const chunkDir = 'uploads';
          const filePath = path.join('uploads', fileName);
          
          const chunks = fs.readdirSync(chunkDir)
            .filter(file => file.startsWith(fileName))
            .sort((a, b) => a.split('-')[1] - b.split('-')[1]);
          
          chunks.forEach(chunk => {
            fs.appendFileSync(filePath, fs.readFileSync(path.join(chunkDir, chunk)));
            fs.unlinkSync(path.join(chunkDir, chunk));
          });
          
          res.send('File merged');
        });

        app.listen(3000, () => console.log('Server running on port 3000'));
        ```

## 单点登录
  - 单点登录（Single Sign On），简称为 SSO，是目前比较流行的企业业务整合的解决方案之一
  - SO的定义是在多个应用系统中，用户只需要登录一次就可以访问所有相互信任的应用系统
  - 如何实现
    - 同域名下的单点登录
      - cookie的domain属性设置为当前域的父域，并且父域的cookie会被子域所共享。path属性默认为web应用的上下文路径
      - 利用 Cookie 的这个特点，只需要将Cookie的domain属性设置为父域的域名（主域名），同时将 Cookie的path属性设置为根路径，将 Session ID（或 Token）保存到父域中。这样所有的子域应用就都可以访问到这个Cookie
      
    - 不同域名下的单点登录
      - 如果是不同域的情况下，Cookie是不共享的，这里我们可以部署一个认证中心，用于专门处理登录请求的独立的 Web服务

## web常见的攻击
  - XSS攻击(跨站脚本攻击)：
    - 跨站脚本攻击，允许攻击者将恶意代码植入到提供给其它用户使用的页面中
    - 涉及到三方，即攻击者、客户端与Web应用
    - 的攻击目标是为了盗取存储在客户端的cookie或者其他网站用于识别客户端身份的敏感信息。一旦获取到合法用户的信息后，攻击者甚至可以假冒合法用户与网站进行交互
  - CSRF攻击(跨站请求伪造)：攻击者诱导受害者进入第三方网站，在第三方网站中，向被攻击网站发送跨站请求
    - 利用受害者在被攻击网站已经获取的注册凭证，绕过后台的用户验证，达到冒充用户对被攻击的网站执行某项操作的目
  - SQL注入：Sql 注入攻击，是通过将恶意的 Sql查询或添加语句插入到应用的输入参数中，再在后台 Sql服务器上解析执行进行的攻击

## websocket理解与使用
  - 基本概念
    - 全双工通信：允许数据同时在两个方向上传输
    - 持久连接：一旦建立连接，就可以保持开放状态，无需重复建立
    - 实时性：可以实现近乎实时的数据传输
    - 跨域支持：原生支持跨域通信
    - 协议标识：使用 ws:// 或 wss://（加密）作为协议标识
  - 工作原理
    - 1.握手阶段
      - 客户端发送 HTTP 请求，请求升级到 WebSocket 协议
      - 服务器同意升级，返回响应
    - 2.数据传输阶段
      - 建立 WebSocket 连接后，双方可以自由发送消息
      - 消息以帧（frames）的形式传输
    - 3.关闭连接
      - 任何一方都可以发送关闭帧来终止连接
  - 使用
    - 1.创建 WebSocket 对象
      ```javascript
        const socket = new WebSocket('ws://example.com/ws');
      ```
    - 2.事件处理
      ```javascript
        // 连接建立时触发
        socket.onopen = function(event) {
            console.log("WebSocket连接已建立");
        };

        // 接收消息时触发
        socket.onmessage = function(event) {
            console.log("收到消息: " + event.data);
        };

        // 连接关闭时触发
        socket.onclose = function(event) {
            console.log("WebSocket连接已关闭");
        };

        // 发生错误时触发
        socket.onerror = function(error) {
            console.error("WebSocket错误: ", error);
        };

      ```
    - 3.发送消息
      ```javascript
        socket.send("Hello, Server!");
      ```

## 时间切片和任务切片
  - 时间切片：时间切片是将长时间运行的任务分割成小块，并在多个事件循环周期中执行这些小块，从而提高应用程序的响应性
    - 原理
      - 将大任务分割成多个小任务
      - 每个小任务在一个短时间内执行
      - 在小任务之间让出控制权，允许浏览器处理其他事件
    - 实现方法
      - 使用 setTimeout 或 requestAnimationFrame
      ```javascript
        function timeSlice(items, process, callback) {
          const TODO = items.concat();
          
          setTimeout(function() {
            const start = Date.now();
            do {
              process(TODO.shift());
            } while (TODO.length > 0 && Date.now() - start < 50);
            
            if (TODO.length > 0) {
              setTimeout(arguments.callee, 25);
            } else {
              callback(items);
            }
          }, 25);
        }

      ```
      - 使用 requestIdleCallback
      ```javascript
        function timeSlice(items, process, callback) {
          const TODO = items.concat();
          
          requestIdleCallback(function(deadline) {
            while (deadline.timeRemaining() > 0 && TODO.length > 0) {
              process(TODO.shift());
            }
            
            if (TODO.length > 0) {
              requestIdleCallback(arguments.callee);
            } else {
              callback(items);
            }
          });
        }
      ```
  - 任务切片：任务切片是将大型任务分解成更小的、可管理的部分的过程。这与时间切片类似，但更侧重于任务的逻辑分割
    - 原理
      - 将大任务分割成多个小任务
      - 每个小任务可以独立执行和管理
      - 可以根据需要调度和优先处理这些小任务
    - 实现方法
      - 使用生成器函数
      ```javascript
        function* taskSlice(items) {
          for (let item of items) {
            yield item;
          }
        }

        function processTask(generator) {
          const iterator = generator.next();
          if (!iterator.done) {
            // 处理当前项
            processItem(iterator.value);
            // 安排下一个任务
            requestIdleCallback(() => processTask(generator));
          }
        }

        const items = [/* 大量数据 */];
        processTask(taskSlice(items));

      ```
      - 使用数组方法和异步函数
      ```javascript
        async function taskSlice(items, batchSize = 100) {
          for (let i = 0; i < items.length; i += batchSize) {
            const batch = items.slice(i, i + batchSize);
            await processBatch(batch);
            await new Promise(resolve => setTimeout(resolve, 0)); // 让出控制权
          }
        }

        async function processBatch(batch) {
          // 处理批次
        }
      ```
  - 时间切片 vs 任务切片
    - 时间切片更关注执行时间的控制，确保每个时间片段内不会占用太长时间
    - 任务切片更关注任务本身的逻辑分割，将大任务分解成更小的、独立的部分
  - 使用场景
    - 大数据处理：处理大型数组或复杂对象时
    - UI 渲染：在渲染大量 DOM 元素时
    - 复杂计算：执行耗时的算法或数学运算时
    - 动画：创建流畅的动画效果时
  - vue中一次要处理10万条数据并将数据放到列表中
    - 使用虚拟列表：只渲染可视区域内的数据
    - 时间切片：分批处理数据
    - 任务切片： 将数据处理任务分解
    ```vue
      <template>
        <RecycleScroller
          class="scroller"
          :items="visibleData"
          :item-size="32"
          key-field="id"
          v-slot="{ item }"
        >
          <div class="user-item">
            {{ item.name }}
          </div>
        </RecycleScroller>
      </template>

      <script>
      import { RecycleScroller } from 'vue-virtual-scroller'
      import 'vue-virtual-scroller/dist/vue-virtual-scroller.css'

      export default {
        components: { RecycleScroller },
        data() {
          return {
            allData: [], // 存储所有 10 万条数据
            visibleData: [], // 存储当前可见的数据
          }
        },

        methods: {
          // 实现时间切片和任务切片
          async loadData() {
            // 模拟从 API 获取大量数据
            const rawData = await fetchLargeDataSet();
            this.processData(rawData);
          },

          processData(rawData) {
            const batchSize = 1000; // 每批处理的数据量
            const totalItems = rawData.length;
            let processedCount = 0;

            const processChunk = (startIndex) => {
              return new Promise(resolve => {
                setTimeout(() => {
                  const endIndex = Math.min(startIndex + batchSize, totalItems);
                  for (let i = startIndex; i < endIndex; i++) {
                    // 处理每条数据，例如添加额外的属性
                    const processedItem = {
                      id: rawData[i].id,
                      name: rawData[i].name,
                      // ... 其他处理逻辑
                    };
                    this.allData.push(processedItem);
                  }
                  processedCount += (endIndex - startIndex);
                  this.updateVisibleData();
                  resolve();
                }, 0);
              });
            };

            const runChunks = async () => {
              for (let i = 0; i < totalItems; i += batchSize) {
                await processChunk(i);
                // 更新进度或状态
                this.progress = Math.floor((processedCount / totalItems) * 100);
              }
            };

            runChunks();
          },

          updateVisibleData() {
            // 根据滚动位置更新可见数据
            // 这里的逻辑取决于你的虚拟滚动实现
            // 例如：
            this.visibleData = this.allData.slice(0, 100); // 初始显示前 100 条
          }
        },

        mounted() {
          this.loadData();
        }
      }
      </script>

    ```
    - 性能优化
      - 如果10万条数据不需要一次性全部加载，可以使用懒加载和无限滚动
      ```javascript
        export default {
          // ...
          data() {
            return {
              allData: [],
              visibleData: [],
              page: 1,
              pageSize: 1000,
            }
          },
          methods: {
            async loadMoreData() {
              const newData = await fetchData(this.page, this.pageSize);
              this.allData = [...this.allData, ...newData];
              this.updateVisibleData();
              this.page++;
            },
            onScroll({ target: { scrollTop, clientHeight, scrollHeight } }) {
              if (scrollTop + clientHeight >= scrollHeight - 100) {
                this.loadMoreData();
              }
            }
          }
        }

      ```
      - 使用web worker: Web Worker 是一种允许在 Web 应用程序中运行脚本的技术，它可以在后台线程中运行，不会干扰主线程的性能
      ```javascript
        // worker.js
        self.onmessage = function(e) {
          const { rawData } = e.data;
          const processedData = rawData.map(item => ({
            id: item.id,
            name: item.name,
            // ... 其他处理逻辑
          }));
          self.postMessage(processedData);
        };

        // 在 Vue 组件中
        const worker = new Worker('worker.js');
        worker.onmessage = (e) => {
          this.allData = e.data;
          this.updateVisibleData();
        };
        worker.postMessage({ rawData: fetchedData });
      ```
## 终止异步
  - 使用 AbortController：AbortController 是一个较新的 API，可用于取消 fetch 请求和其他支持的异步操作
  ```javascript
    const controller = new AbortController();
    const signal = controller.signal;

    fetch('https://api.example.com/data', { signal })
      .then(response => response.json())
      .then(data => console.log(data))
      .catch(err => {
        if (err.name === 'AbortError') {
          console.log('Fetch aborted');
        } else {
          console.error('Fetch error:', err);
        }
      });

    // 在某个时刻取消请求
    controller.abort();

  ```
  - Promise 包装和外部标志
  ```javascript
    let isCancelled = false;

    const cancelableAsyncOperation = new Promise((resolve, reject) => {
      const asyncOperation = () => {
        if (isCancelled) {
          reject(new Error('Operation cancelled'));
          return;
        }
        // 模拟异步操作
        setTimeout(() => {
          resolve('Operation completed');
        }, 5000);
      };

      asyncOperation();
    });

    const cancel = () => {
      isCancelled = true;
    };

    cancelableAsyncOperation
      .then(result => console.log(result))
      .catch(err => console.error(err));

    // 在某个时刻取消操作
    cancel();
  ```
  - 使用 clearTimeout 或 clearInterval
  ```javascript
    const timeoutId = setTimeout(() => {
      console.log('This may not be printed');
    }, 5000);

    // 取消定时器
    clearTimeout(timeoutId);

  ```
  - 取消 XMLHttpRequest
  ```javascript
    const xhr = new XMLHttpRequest();
    xhr.open('GET', 'https://api.example.com/data', true);

    xhr.onload = function() {
      if (xhr.status === 200) {
        console.log(xhr.responseText);
      }
    };

    xhr.onerror = function() {
      console.error('Request failed');
    };

    xhr.send();

    // 在某个时刻取消请求
    xhr.abort();

  ```

## import和require的区别
  - 意义
    - import: import 是 ES6 模块语法，用于导入其他模块的成员
    - require: require 是 CommonJS 模块语法，用于导入其他模块的成员
  - 加载时机
    - import: 静态加载，在编译时执行
    - require: 动态加载，在运行时执行
  - 异步加载
    - import: 可以使用 async/await 进行异步加载
    - require: 本身是同步的，但是可以通过 require.async 或 require.ensure 进行异步加载(webpack)



