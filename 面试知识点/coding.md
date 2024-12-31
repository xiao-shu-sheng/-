## 说出[] == []和 [] == ![]的结果，并给出详细分析结果(考的是值比较时的类型转换)
  - [] == []的结果为false
    - 对象比较： 在JavaScript中对象(包括数组)的相等性比较总是基于引用，而不是基于内容，比较的是引用的地址
    - 不同的引用：[] == []创建了两个不同的空数组，它们是两个不同的对象，存储在内存的不同位置
    - 引用比较：两个数组在比较的时候实际上比较的是内存引用，由于两个数组是分别创建的，所以它们有不同的内存引用，所以比较的结果为false
  - [] == ![]的结果为true
    - 1.![]的求值
      - []是一个真值
      - ![]将其转换为布尔值的相反值，所以![]等于false
    - 2.表达式转换为 [] == false
    - 3.当使用==比较数组和布尔值时，JS会进行类型转换
      - 布尔值false会被转换为数组0
      - 表达式就变成了 [] == 0
    - 4.当比较数组和数字的时候，数组会被转换为原始值
      - 空数组[]调用toString()方法会返回一个空字符串""
      - 表达式转换为 ”“ == 0
    - 5.当字符串和数字比较的时候，字符串会转换为数字：
      - 空字符串”“被转换为数字0
      - 表达式变成了 0 == 0
    - 6. 0 == 0 结果为true

## 分析下面的代码并给出打印值(考的是浏览器事件循环)
  ```javascript
    async function a1() {
      console.log("a1 start");
      await a2();
      console.log("a1 end");
    }

    async function a2() {
      console.log("a2");
    }

    console.log("script start");

    setTimeout(() => {
      console.log("setTimeout");
    }, 0);

    Promise.resolve().then(() => {
      console.log("promise1");
    });

    a1();

    let promise2 = new Promise((resolve) => {
      resolve("promise2.then");
      console.log("promise2");
    });

    promise2.then((res) => {
      console.log(res);
      Promise.resolve().then(() => {
          console.log("promise3");
      });
    });

    console.log("script end");
  ```
  - 1.首先执行同步代码
    - 输出”script start“
  - 2.遇到setTimeout，将其回调函数加入宏任务队列
  - 3.遇到第一个Promise.resolve.then(), 将其回调函数加入微任务队列
  - 4.执行a1()函数
    - 输出”a1 start"
    - 执行a2()函数，输出"a2"
    - a2()函数完成，但是由于await，a1函数暂停执行，剩下的(console.log("a1 end"))加入微任务队列
  - 5.执行new Promise的同步部分
    - 输出"promise 2"
    - 将promise2.then的回调函数加入微任务队列
  - 6.输出"script end"
  - 7.同步代码执行完毕，开始执行微任务队列
    - 执行第一个 Promise.then，输出 "promise1"
    - 执行a1函数的剩余部分,输出"a1 end"
    - 执行promise2.then的回调，输出"promise2.then"
    - 遇到新的Promise.resolve().then()，将其回调加入微任务队列
    - 执行新加入的微任务，输出“promise3”
  - 8.微任务队列清空，执行宏任务队列：
    - 执行setTimeout的回调，输出“setTimeout”
  ```javascript
    // 输出结果
    "script start"
    "a1 start"
    "a2"
    "promise2"
    "script end"
    "promise1"
    "a1 end"
    "promise2.then"
    "promise3"
    "setTimeout"
  ```