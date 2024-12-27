## react理解
  - React 是一个用于构建用户界面的 JavaScript 库，由 Facebook 开发并维护
  - 核心概念
    - 组件化：
      - React 应用由组件构建而成
      - 组件可以是函数组件或类组件
      - 组件可以嵌套，形成组件树
    - 虚拟 DOM：
      - React 使用虚拟 DOM 来优化渲染性能
      - 虚拟 DOM 是真实 DOM 的 JavaScript 表示
      - React 通过比较虚拟 DOM 的差异来最小化实际 DOM 操作
    - 单向数据流
      - 数据通常从父组件流向子组件
      - 这种模式使得数据流更可预测，更易于理解和调试
    - JSX：
      - JSX 是一种 JavaScript 的语法扩展，用于描述 UI 组件
      - 它类似于 HTML，但具有 JavaScript 的功能
  - 重要特性
    - 声明式编程：React 采用声明式编程范式，你描述 UI 应该是什么样子，React 负责更新 DOM 以匹配这个描述
    - 组件生命周期(类组件)
      - 挂载：
        - constructor：实例过程中自动调用的方法，在方法内部通过super关键字获取来自父组件的props。在该方法中，通常的操作为初始化state状态或者在this上挂载方法
        - getDerivedStateFromProps
          - 该方法是新增的生命周期方法，是一个静态的方法，因此不能访问到组件的实例，只能访问到props和state
          - 执行时机：组件创建和更新阶段，不论是props变化还是state变化，也会调用
        - render：类组件必须实现的方法，用于渲染DOM结构，可以访问组件state与prop属性
        - componentDidMount：组件挂载到真实DOM节点后执行，其在render方法之后执行
      - 更新阶段：
        - getDerivedStateFromProps
        - shouldComponentUpdate
          - 用于告知组件本身基于当前的props和state是否需要重新渲染组件，默认情况返回true
          - 执行时机：到新的props或者state时都会调用，通过返回true或者false告知组件更新与否
        - render
        - getSnapshotBeforeUpdate
          - 该周期函数在render后执行，执行之时DOM元素还没有被更新
        - componentDidUpdate
      - 卸载阶段
        - componentWillUnmount：此方法用于组件卸载前，清理一些注册是监听事件，或者取消订阅的网络请求等
    - Hooks（函数组件）
      - useState: 用于在函数组件中添加状态
      - useEffect: 用于处理副作用
      - useContext, useReducer, useCallback, useMemo

## useEffect的执行顺序
  - 1.组件渲染
  - 2.屏幕更新
  - 3.执行useEffect中的副作用函数
  - 具体来说是先改变状态，再更新视图，最后执行useEffect中的副作用函数，过程如下
    - 1.改变状态
    - 2.react更新状态
    - 3.组件重新渲染
    - 4.屏幕更新
    - 5.执行useEffect中的副作用函数，useEffect 是在渲染之后异步执行的

## useEffect中的副作用函数是同步的还是异步的
  - useEffect 中的副作用函数本身可以是同步的或异步的，但 useEffect 的执行机制是异步的。

## setState的执行机制
  - 核心功能：setState 用于触发组件状态更新，React 会基于新状态重新渲染组件
  - 触发机制：setState 的调用不会立即更新 this.state，而是将更新请求放入更新队列中，等待 React 的调度机制统一处理
  - 批量更新：React 会将多个 setState 调用批量处理，以提高性能。这意味着多个 setState 调用可能会被合并成一个更新
  ```javascript
    handleClick() {
      this.setState({count: this.state.count + 1});
      this.setState({count: this.state.count + 1});
      this.setState({count: this.state.count + 1});
    }
  ```
  - 异步更新：setState 是异步的。这意味着在调用 setState 后，state 不会立即更新
  - 函数式更新：为了解决批量更新和异步更新可能带来的问题，React 提供了函数式更新
  ```javascript
    handleClick() {
      this.setState(prevState => ({count: prevState.count + 1}));
      this.setState(prevState => ({count: prevState.count + 1}));
      this.setState(prevState => ({count: prevState.count + 1}));
    }

  ```
  - 强制同步setState
    - setState(state, callback)
    - componentDidUpdate(prevProps, prevState, snapshot)
    - flushSync()
      ```javascript
        import { flushSync } from 'react-dom';

        flushSync(() => {
          // 同步更新 state
          this.setState({ count: this.state.count + 1 });
        });

        // 异步更新 state
        this.setState({ count: this.state.count + 1 });
      ```
    - setTimeout
      ```jsx
        changeText() {
          setTimeout(() => {
            this.setState({
              message: "你好啊"
            });
            console.log(this.state.message); // 你好啊
          }, 0);
        }
      ```
## state和props的区别
  - state 是组件内部的状态，用于存储组件的数据。state 的值可以通过 setState 方法来更新。state 的值可以通过 this.state 来访问。state 的值是私有的，只能在组件内部访问。
  - props 是组件外部传入的数据，用于配置组件的属性。props 的值是只读的，只能在组件内部访问。props 的值可以通过 this.props 来访问。props 的值可以通过父组件传递给子组件。
## super()和super(props)的区别
  - 功能差异
    - super() 是构造函数中调用父类构造函数的语法糖，它会自动调用父类的构造函数，并将父类的属性和方法复制到子类中。
    - super(props) 是构造函数中调用父类构造函数的语法糖，它会自动调用父类的构造函数，并将父类的属性和方法复制到子类中，同时将 props 传递给父类构造函数。
  - props的可用性
    - 使用super()
      - 在构造函数中，this.props 将是 undefined。
      - 在rander和其他方法中，this.props 将是可用的。
      ```jsx
        class MyComponent extends React.Component {
          constructor(props) {
            super(); // 不推荐
            console.log(this.props); // undefined
          }

          render() {
            return <div>{this.props.name}</div>; // 这里仍然可以正常工作
          }
        }
      ```
    - 使用super(props)
      - 在构造函数中，this.props 将是可用的。
      - 在rander和其他方法中，this.props 将是可用的。
      ```jsx
        class MyComponent extends React.Component {
          constructor(props) {
            super(props); // 推荐
            console.log(this.props); // { name: "John" }
          }

          render() {
            return <div>{this.props.name}</div>; // 这里仍然可以正常工作
          }
        }
      ```
  - ES6 类的行为：
    - 在 ES6 类中，必须在使用 this 之前调用 super()
    - 传递 props 给 super() 主要是为了 React.Component 构造函数能够初始化 this.props
## react的事件机制
  - React基于浏览器的事件机制自身实现了一套事件机制，包括事件注册、事件的合成、事件冒泡、事件派发。在React中这套事件机制被称之为合成事件
  - 1.合成事件
    ```jsx
      // 原生事件绑定方式
      <button onclick="handleClick()">按钮命名</button>
            
      // React 合成事件绑定方式
      const button = <button onClick={handleClick}>按钮命名</button>
    ```
  - 2.事件委托
    - React 使用事件委托（Event Delegation）来处理大多数事件。它在 document 级别上附加一个事件监听器，而不是直接在 DOM 元素上附加事件监听器
  - 3.事件池
    - 在 React 17 之前，React 使用事件池来重用事件对象，以提高性能。但从 React 17 开始，事件池被移除了
  - 4.跨浏览器一致性
    - React 的事件系统确保了跨浏览器的一致性，抹平了不同浏览器之间的差异
  - 5.命名约定
    - React 事件采用驼峰命名法，而不是全小写
  - 6.阻止默认行为
    - 在 React 中，阻止默认行为通常使用 e.preventDefault() 方法。
    ```jsx
      function handleSubmit(e) {
        e.preventDefault();
        console.log('Form submitted');
      }
    ```
  - 7.事件对象
    - React 的事件对象是一个合成事件，它包装了浏览器的原生事件对象。
    ```jsx
      function handleClick(e) {
        console.log(e); // SyntheticBaseEvent
        console.log(e.nativeEvent); // 原生 DOM 事件对象
      }

    ```
  - 访问异步事件对象
    - 如果需要在异步操作中访问事件对象，应该调用 e.persist()（在 React 17 之前）或 e.getPooled()（在 React 17 之后），以确保事件对象不会被垃圾回收。
    ```jsx
      function handleClick(e) {
        e.persist();
        setTimeout(() => {
          console.log(e); // 合成事件对象
        }, 1000);
      }
    ```
  - 事件冒泡
    - React 的事件冒泡机制与浏览器的原生事件冒泡机制本质上是相同。
    - 相同点：
      - 冒泡原理： React 事件和原生 DOM 事件都遵循从触发元素向上冒泡到根元素的原则
      - 事件传播顺序： 两者都是先捕获，后冒泡
      - 可以停止冒泡： 两种机制都允许在事件处理程序中停止事件冒泡
    - 不同点：
      - 1.事件委托：
        - React 使用事件委托，将大多数事件处理器附加到文档根节点（在 React 17 之前是 document，React 17 及以后是 React 根容器）
        - 原生事件直接绑定在 DOM 元素上
      - 2.事件对象： 
        - React：使用合成事件（SyntheticEvent）对象，它是原生事件的跨浏览器包装器
        - 原生：直接使用浏览器原生的 Event 对象
      - 3.命名约定
        - React：使用驼峰命名法，如 onClick、onChange
        - 原生：使用全小写，如 onclick、onchange
      - 4.事件池
        - React：React 使用事件池来重用事件对象，以提高性能。但从 React 17 开始，事件池被移除了
      - 5.阻止默认行为
        - React：显示调用必须使用 e.preventDefault() 方法
        - 原生：可以通过返回 false 或调用 e.preventDefault()
    - 实际事件冒泡行为
      - 虽然 React 的事件冒泡在逻辑上模仿了原生冒泡，但实际实现有所不同
      - React 事件首先在原生 DOM 中冒泡，然后 React 在自己的系统中模拟了一次冒泡过程
      - 这意味着 React 事件处理程序总是在原生事件处理程序之后被调用

## react事件绑定的方式有哪些？区别？
  - 在构造函数中绑定
    ```jsx
      class MyComponent extends React.Component {
        constructor(props) {
          super(props);
          this.handleClick = this.handleClick.bind(this);
        }

        handleClick() {
          console.log('Clicked');
        }

        render() {
          return <button onClick={this.handleClick}>Click me</button>;
        }
      }
    ```
    - 优点
      - 只绑定一次，性能较好
      - this指向明确
    - 缺点
      - 需要在构造函数中为每个方法手动绑定，代码量增加
  - 使用箭头函数绑定
    ```jsx
      class MyComponent extends React.Component {
        handleClick = () => {
          console.log('Clicked');
        }

        render() {
          return <button onClick={this.handleClick}>Click me</button>;
        }
      }
    ```
    - 优点
      - 简洁，不需要手动绑定
      - this指向明确
    - 缺点
      - 每个实例都会创建一个新的函数，可能影响性能（通常影响很小）
      - 不适用于需要在子组件中使用 ref 调用方法的情况
  - 在render方法中使用箭头函数绑定
    ```jsx
      class MyComponent extends React.Component {
        handleClick() {
          console.log('Clicked');
        }

        render() {
          return <button onClick={() => this.handleClick()}>Click me</button>;
        }
      }
    ```
    - 优点
      - 简单，易于传递参数
    - 缺点
      - 每次渲染都会创建新的函数，可能影响性能，特别是在传递给子组件时
      - 可能导致不必要的重新渲染
  - 使用bind方法绑定
    ```jsx
      class MyComponent extends React.Component {
        handleClick() {
          console.log('Clicked');
        }

        render() {
          return <button onClick={this.handleClick.bind(this)}>Click me</button>;
        }
      }
    ```
    - 优点
      - 简单，易于传递参数
    - 缺点
      - 每次渲染都会创建新的函数，影响性能
      - 代码可读性稍差
  - 在函数组件中的事件绑定
    ```jsx
      function MyComponent() {
        const handleClick = () => {
          console.log('Clicked');
        }

        return <button onClick={handleClick}>Click me</button>;
      }
    ```
    - 优点
      - 简单，不需要考虑 this 绑定问题
  - 使用useCallback函数绑定
    ```jsx
      const MyComponent = () => {
        const handleClick = useCallback(() => {
          console.log('Clicked');
        }, []);

        return <button onClick={handleClick}>Click me</button>;
      }
    ```
    - 优点
      - 可以避免不必要的重新渲染
      - 适用于需要将回调函数传递给子组件的情况
    - 缺点
      - 需要使用 useCallback 钩子来创建回调函数，增加了代码的复杂性

## 组件构建的方式
  - 1.函数式组件
    ```jsx
      function Welcome(props) {
        return <h1>Hello, {props.name}</h1>;
      }

    ```
  - 2.类组件
    ```jsx
      class Welcome extends React.Component {
        render() {
          return <h1>Hello, {this.props.name}</h1>;
        }
      }
    ```
  - 3.高阶函数
    ```jsx
      function withLogging(WrappedComponent) {
        return class extends React.Component {
          componentDidMount() {
            console.log('Component is mounted');
          }
          render() {
            return <WrappedComponent {...this.props} />;
          }
        };
      }

      const EnhancedComponent = withLogging(MyComponent);

    ```
## 高阶组件
  -  高阶组件是一个函数，它接受一个组件作为参数并返回一个新的组件。
  - 工作原理
    - HOC 不修改输入组件，也不使用继承来复制行为
    - 相反，HOC 通过将组件包装在容器组件中来组成新组件
  - 特点
    - 纯函数，没有副作用
    - 可以链式调用，组合多个 HOC
    - 不修改原始组件，而是创建新组件
  - 高阶组件通常用于以下场景：
    - 代码复用 当多个组件需要共享相同的逻辑时，可以使用 HOC 来抽象这些共同的功能。
    ```jsx
      function withLogging(WrappedComponent) {
        return class extends React.Component {
          componentDidMount() {
            console.log(`Component ${WrappedComponent.name} mounted`);
          }
          render() {
            return <WrappedComponent {...this.props} />;
          }
        };
      }

      const EnhancedComponentA = withLogging(ComponentA);
      const EnhancedComponentB = withLogging(ComponentB);

    ```
    - 条件渲染 HOC 可以用来实现条件渲染，比如基于权限控制组件的显示
    ```jsx
      function withAuth(WrappedComponent) {
        return class extends React.Component {
          render() {
            if (this.props.isAuthenticated) {
              return <WrappedComponent {...this.props} />;
            } else {
              return <div>Please log in to view this content.</div>;
            }
          }
        };
      }

      const AuthenticatedComponent = withAuth(SensitiveComponent);
    ```
    - 属性代理 HOC 可以操作 props，添加、修改或删除传递给被包装组件的 props
    ```jsx
      function withExtraProps(WrappedComponent) {
        return class extends React.Component {
          render() {
            const newProps = {
              ...this.props,
              extraProp: 'Extra Prop Value'
            };
            return <WrappedComponent {...newProps} />;
          }
        };
      }

    ```

## refs
  - 基本概念
    - Refs 提供了一种方式，允许我们访问 DOM 节点或在 render 方法中创建的 React 元素
  - 创建方法
    - 1.使用 createRef 方法(16.3+)
      ```jsx
        class MyComponent extends React.Component {
          constructor(props) {
            super(props);
            this.myRef = React.createRef();
          }

          render() {
            return <div ref={this.myRef}>Hello, world</div>;
          }
        }
      ```
    - 2.使用回调 Refs
      ```jsx
        class MyComponent extends React.Component {
          constructor(props) {
            super(props);
            this.myRef = null;
          }

          render() {
            return <div ref={(ref) => this.myRef = ref}>Hello, world</div>;
          }
        }
      ```
    - 3.使用useRef Hook
      ```jsx
        function MyComponent() {
          const myRef = useRef(null);

          return <div ref={myRef}>Hello, world</div>;
        }
      ```
  - 访问refs
    - 对于使用 createRef 创建的 refs，通过 current 属性访问
    ```jsx
      const node = this.myRef.current;
    ```
    - 对于使用回调 Refs 创建的 refs，通过回调函数的参数访问
    ```jsx
      const node = this.myRef;
    ```
    - 对于使用 useRef Hook 创建的 refs，通过 ref 对象的 current 属性访问
    ```jsx
      const node = myRef.current;
    ```
  - refs用途
    - 管理焦点、文本选择、媒体播放
    ```jsx
      class MyComponent extends React.Component {
        constructor(props) {
          super(props);
          this.myRef = React.createRef();
        }

        componentDidMount() {
          this.myRef.current.focus();
        }

        render() {
          return <input type="text" ref={this.myRef} />;
        }
    ```
    - 触发强制动画
    ```jsx
      class AnimatedComponent extends React.Component {
        constructor(props) {
          super(props);
          this.animationRef = React.createRef();
        }
        componentDidMount() {
          this.animationRef.current.play();
        }
        render() {
          return <video ref={this.animationRef} />;
        }
      }
    ```
    - 集成第三方库
    ```jsx
      class ThirdPartyComponent extends React.Component {
        componentDidMount() {
          this.thirdPartyLib = new ThirdPartyLib(this.el);
        }
        componentWillUnmount() {
          this.thirdPartyLib.destroy();
        }
        render() {
          return <div ref={el => this.el = el} />;
        }
      }

    ```

## 类组件和函数组件的理解及区别
  - 类组件：使用 ES6 类语法定义的 React 组件
    ```jsx
      class Welcome extends React.Component {
        render() {
          return <h1>Hello, {this.props.name}</h1>;
        }
      }
    ```
    - 特点
      - 可以使用生命周期方法
      - 可以有自己的状态
      - 可以使用 refs
      - 可以定义和使用类方法
  - 函数组件：函数组件是一个接收 props 并返回 React 元素的 JavaScript 函数
    ```jsx
      const Welcome = (props) => {
        return <h1>Hello, {props.name}</h1>;
      }
    ```
    - 特点
      - 更简洁，易于理解和测试
      - 从 React 16.8 开始，可以使用 Hooks 来管理状态和副作用
      - 没有 this 关键字，避免了 this 绑定的问题
      - 通常性能较好（没有实例化过程）
  - 主要区别
    - 语法
      - 类组件使用 ES6 类语法，函数组件使用函数声明或者箭头函数
      - 状态管理
        - 类组件使用state和setState方法来管理状态
        - 函数组件使用useState Hook来管理状态
      - 生命周期
        - 类组件使用生命周期方法来处理组件的生命周期事件
        - 函数组件使用useEffect Hook来模拟生命周期行为
      - this关键字
        - 函数组件通常性能略好，因为它们不需要实例化
        - 使用 React.memo 可以轻松优化函数组件的重渲染
      - 性能
        - 类组件需要实例化，因此性能较低
        - 函数组件通常性能较好
    - 使用场景
      - 类组件适用于需要使用生命周期方法、状态管理、refs等特性的场景
      - 函数组件适用于不需要使用生命周期方法、状态管理、refs等特性的场景

## 受控组件、非受控组件、静态组件
  - 受控组件：受控组件是由 React 控制其状态的组件。组件的状态完全由 React 的 state 来管理、
    - 特点
      - 组件的值由 React 的 state 来控制
      - 每次状态更新都会触发重新渲染
      - 可以通过 onChange 等事件处理函数来更新组件的状态
    - 示例
      ```jsx
        function ControlledInput() {
          const [value, setValue] = useState('');

          const handleChange = (event) => {
            setValue(event.target.value);
          };

          return <input value={value} onChange={handleChange} />;
        }
      ```
  - 非受控组件：非受控组件的状态由 DOM 自己管理,单元素的值通过 ref 获取，React 不直接控制
    - 特点
      - 数据保存在 DOM 中，而不是 React 的 state
      - 使用 ref 获取当前值，避免通过 React 的 state 更新
    - 示例
      ```jsx
        import React, { useRef } from 'react';

        function UncontrolledComponent() {
          const inputRef = useRef();

          const handleSubmit = () => {
            alert(`Input Value: ${inputRef.current.value}`);
          };

          return (
            <div>
              <input type="text" ref={inputRef} />
              <button onClick={handleSubmit}>Submit</button>
            </div>
          );
        }
      ```
  - 静态组件
    - 静态组件是指不包含任何状态和生命周期方法的组件，通常用于展示数据或布局
## react中hooks
  - React Hooks 是 React 16.8 引入的特性，它允许在函数组件中使用状态和其他 React 特性，而无需编写类组件.主要hooks包括
    - useState：用于在函数组件中添加状态
    - useEffect：用于在函数组件中添加副作用，如数据获取、订阅事件等
    - useContext：用于在函数组件中访问上下文
      ```jsx
        import React, { useContext } from 'react';

        const ThemeContext = React.createContext('light');

        function ThemedButton() {
          const theme = useContext(ThemeContext);
          return <button style={{ background: theme }}>I am styled by theme context!</button>;
        }

      ```
    - useReducer：用于在函数组件中添加状态管理
      ```jsx
        import React, { useReducer } from 'react';

        function reducer(state, action) {
          switch (action.type) {
            case 'increment':
              return {count: state.count + 1};
            case 'decrement':
              return {count: state.count - 1};
            default:
              throw new Error();
          }
        }

        function Counter() {
          const [state, dispatch] = useReducer(reducer, { count: 0 });
          return (
            <>
              Count: {state.count}
              <button onClick={() => dispatch({type: 'increment'})}>+</button>
              <button onClick={() => dispatch({type: 'decrement'})}>-</button>
            </>
          );
        }

      ```
    - useCallback：用于优化性能，返回一个记忆化的回调函数
      ```jsx
        import React, { useState, useCallback } from 'react';

        function ParentComponent() {
          const [count, setCount] = useState(0);

          const incrementCount = useCallback(() => {
            setCount(prevCount => prevCount + 1);
          }, []);

          return (
            <div>
              <ChildComponent onIncrement={incrementCount} />
              <p>Count: {count}</p>
            </div>
          );
        }

      ```
    - useMemo：用于在函数组件中添加缓存,返回一个记忆化的值
      ```jsx
        import React, { useMemo } from 'react';

        function ExpensiveComponent({ a, b }) {
          const result = useMemo(() => {
            // 假设这是一个昂贵的计算
            return a * b;
          }, [a, b]); // 只有当 a 或 b 改变时才重新计算

          return <div>{result}</div>;
        }

      ```
    - useRef:用于创建一个可变的 ref 对象，其 .current 属性被初始化为传入的参数
      ```jsx
        import React, { useRef } from 'react';

        function MyComponent() {
          const inputRef = useRef(null);

          function handleClick() {
            inputRef.current.focus();
          }

          return (
            <div>
              <input type="text" ref={inputRef} />
              <button onClick={handleClick}>Focus</button>
            </div>
          );
        }

      ```
    - useLayoutEffect：用于在函数组件中添加副作用，与 useEffect 类似，但会在所有 DOM 更新之后同步调用
      ```jsx
        import React, { useLayoutEffect, useState } from 'react';

        function MyComponent() {
          const [width, setWidth] = useState(0);

          useLayoutEffect(() => {
            setWidth(document.body.clientWidth);
          }, []);

          return <div>Width: {width}</div>;
        }

      ```
    - useImperativeHandle：用于在函数组件中暴露组件的实例值
      ```jsx
        import React, { useRef, useImperativeHandle } from 'react';

        function FancyInput(props, ref) {
          const inputRef = useRef(null);

          useImperativeHandle(ref, () => ({
            focus: () => {
              inputRef.current.focus();
            },
          }));

          return <input type="text" ref={inputRef} />;
        }

        const FancyInputRef = React.forwardRef(FancyInput);

      ```
    - useDebugValue：用于在 React DevTools 中显示自定义的 Hook 名称
      ```jsx
        import React, { useDebugValue } from 'react';

        function useMyHook(value) {
          useDebugValue(value > 0 ? 'positive' : 'negative');
        }

      ```
    - useDeferredValue：用于在函数组件中延迟渲染，用于优化性能
      ```jsx
        import React, { useDeferredValue, useState } from 'react';

        function MyComponent() {
          const [inputValue, setInputValue] = useState('');
          const deferredValue = useDeferredValue(inputValue);

          return (
            <div>
              <input type="text" value={inputValue} onChange={e => setInputValue(e.target.value)} />
              <p>Deferred Value: {deferredValue}</p>
            </div>
          );
        }

      ```
    - useTransition：用于在函数组件中添加过渡效果，用于优化性能
      ```jsx
        import React, { useTransition, useState } from 'react';

        function MyComponent() {
          const [isPending, startTransition] = useTransition();
          const [inputValue, setInputValue] = useState('');

          function handleChange(e) {
            startTransition(() => {
              setInputValue(e.target.value);
            });
          }

          return (
            <div>
              <input type="text" value={inputValue} onChange={handleChange} />
              {isPending && <p>Loading...</p>}
            </div>
          );
        }

      ```
    - useId：用于生成唯一的 ID，用于优化性能
      ```jsx
        import React, { useId } from 'react';

        function MyComponent() {
          const id = useId();

          return (
            <div>
              <label htmlFor={id}>Enter your name:</label>
              <input id={id} type="text" />
            </div>
          );
        }

      ```
  - 使用hooks的好处
    - 简化代码，使代码更易于维护和理解
    - 使代码更易于测试，因为可以将副作用和状态分离
## 组件通信方式
  - 1.父组件向子组件传递数据（props）
    ```jsx
      function Parent() {
        const data = "Hello from parent";
        return <Child message={data} />;
      }

      function Child({ message }) {
        return <div>{message}</div>;
      }

    ```
  - 2.子组件向父组件传递数据（回调函数）
    ```jsx
      function Parent() {
        const handleChildData = (data) => {
          console.log("Received from child:", data);
        };

        return <Child onDataReceived={handleChildData} />;
      }

      function Child({ onDataReceived }) {
        const sendDataToParent = () => {
          onDataReceived("Data from child");
        };

        return <button onClick={sendDataToParent}>Send Data to Parent</button>;
      }
    ```
  - 3.兄弟组件之间传递数据（Context）
    ```jsx
      const ThemeContext = React.createContext('light');

      function App() {
        return (
          <ThemeContext.Provider value="dark">
            <Toolbar />
          </ThemeContext.Provider>
        );
      }

      function Toolbar() {
        return <ThemedButton />;
      }

      function ThemedButton() {
        const theme = useContext(ThemeContext);
        return <button style={{background: theme}}>Themed Button</button>;
      }
    ```
    - 4.兄弟组件之间传递数据：通过共同的父组件来实现
      ```jsx
        function Parent() {
          const [sharedData, setSharedData] = useState("");

          return (
            <>
              <SiblingA onDataChange={setSharedData} />
              <SiblingB data={sharedData} />
            </>
          );
        }

        function SiblingA({ onDataChange }) {
          return <input onChange={(e) => onDataChange(e.target.value)} />;
        }

        function SiblingB({ data }) {
          return <div>Received: {data}</div>;
        }
      ```
    - 5.全局状态管理(Redux,Mobx等)，redux示例
      ```jsx
        // Action
        const setData = (data) => ({ type: 'SET_DATA', payload: data });

        // Reducer
        const reducer = (state = { data: '' }, action) => {
          switch (action.type) {
            case 'SET_DATA':
              return { ...state, data: action.payload };
            default:
              return state;
          }
        };

        // Component
        function MyComponent({ data, setData }) {
          return (
            <div>
              <input value={data} onChange={(e) => setData(e.target.value)} />
              <p>Data: {data}</p>
            </div>
          );
        }

        // Connect component to Redux
        export default connect(
          state => ({ data: state.data }),
          { setData }
        )(MyComponent);

      ```
    - 6.发布订阅模式，使用三方库
    - 7.URL 参数和查询字符串
      ```jsx
        import { useLocation, useHistory } from 'react-router-dom';

        function Component() {
          const location = useLocation();
          const history = useHistory();
          const queryParams = new URLSearchParams(location.search);
          const data = queryParams.get('data');

          const updateData = (newData) => {
            queryParams.set('data', newData);
            history.push({ search: queryParams.toString() });
          };

          return (
            <div>
              <p>Data: {data}</p>
              <button onClick={() => updateData('New Data')}>Update Data</button>
            </div>
          );
        }

      ```
## 引入css的方法
  - 外部css
    ```jsx
      import './App.css';

      function App() {
        return (
          <div className="App">
            <h1>Hello, World</h1>
          </div>
        );
      }

    ```
  - 内联样式
    ```jsx
      function App() {
        const style = {
          color: 'red',
          fontSize: '24px',
        };

        return (
          <div style={style}>
            <h1>Hello, World</h1>
          </div>
        );
      }

    ```
  - 模块化css: 避免命名冲突和样式重复
    ```jsx
      import styles from './App.module.css';

      function App() {
        return (
          <div className={styles.container}>
            <h1 className={styles.heading}>Hello, World</h1>
          </div>
        );
      }

    ```
  - CSS-in-JS 库：使用 JavaScript 来编写 CSS，popular libraries 包括 styled-components, Emotion 等
    ```jsx
      import styled from 'styled-components';

      const StyledDiv = styled.div`
        color: blue;
        font-size: 20px;
      `;

      function App() {
        return <StyledDiv>Hello, React!</StyledDiv>;
      }
    ```

## redux理解
  - redux是一个状态管理库，用于管理应用程序的状态。它提供了一个全局的状态树，可以通过action来更新状态树，并且可以通过reducer来处理action。
  - 核心概念
    - store：一个全局的状态树，用于存储应用程序的状态。
    - action：一个对象，用于描述要执行的操作。
    - reducer：指定如何更新状态的纯函数。
    - dispatch：用于触发action，并更新状态树。
  - 工作流程
    - 组件通过dispatch触发action
    - store调用reducer，传入当前状态和action
    - reducer返回新的状态
    - store更新状态,并通知订阅了store的组件更新
  - 基本使用示例
    ```jsx
      // 创建 reducer
      const counterReducer = (state = 0, action) => {
        switch (action.type) {
          case 'INCREMENT':
            return state + 1;
          case 'DECREMENT':
            return state - 1;
          default:
            return state;
        }
      };

      // 创建 store
      import { createStore } from 'redux';
      const store = createStore(counterReducer);

      // 定义 action creators
      const increment = () => ({ type: 'INCREMENT' });
      const decrement = () => ({ type: 'DECREMENT' });

      // 在 React 组件中使用
      import React from 'react';
      import { useSelector, useDispatch } from 'react-redux';

      function Counter() {
        const count = useSelector(state => state);
        const dispatch = useDispatch();

        return (
          <div>
            <p>Count: {count}</p>
            <button onClick={() => dispatch(increment())}>+</button>
            <button onClick={() => dispatch(decrement())}>-</button>
          </div>
        );
      }

    ```
  - redux中间件
    - 中间件是redux的扩展功能，用于增强redux的功能。常用的中间件有
      - redux-thunk：用于处理异步操作
      - redux-saga：用于处理更复杂的异步操作
      - redux-logger：日志记录，用于记录redux的action和state变化
      ```jsx
        import { createStore, applyMiddleware } from 'redux';
        import thunk from 'redux-thunk';

        const store = createStore(rootReducer, applyMiddleware(thunk));

        // 异步 action creator
        const fetchUser = (id) => {
          return async (dispatch) => {
            dispatch({ type: 'FETCH_USER_REQUEST' });
            try {
              const response = await fetch(`/api/users/${id}`);
              const user = await response.json();
              dispatch({ type: 'FETCH_USER_SUCCESS', payload: user });
            } catch (error) {
              dispatch({ type: 'FETCH_USER_FAILURE', error });
            }
          };
        };

      ```

## redux实现长时间存储
  - 使用localStorage
    ```jsx
      // 保存状态到 localStorage
      const saveState = (state) => {
        try {
          const serializedState = JSON.stringify(state);
          localStorage.setItem('reduxState', serializedState);
        } catch (err) {
          // 处理错误
        }
      };

      // 从 localStorage 加载状态
      const loadState = () => {
        try {
          const serializedState = localStorage.getItem('reduxState');
          if (serializedState === null) {
            return undefined;
          }
          return JSON.parse(serializedState);
        } catch (err) {
          return undefined;
        }
      };

      // 创建 store 时使用
      const persistedState = loadState();
      const store = createStore(rootReducer, persistedState);

      // 订阅 store 变化，保存状态
      store.subscribe(() => {
        saveState(store.getState());
      });

    ```
  - 使用redux-persist
    ```jsx
      import { createStore } from 'redux';
      import { persistStore, persistReducer } from 'redux-persist';
      import storage from 'redux-persist/lib/storage'; // 使用 localStorage 作为存储

      const persistConfig = {
        key: 'root',
        storage,
      };
      // 创建持久化 reducer
      const persistedReducer = persistReducer(persistConfig, rootReducer);

      // 创建 store
      const store = createStore(persistedReducer);
      // 创建持久化 store
      const persistor = persistStore(store);

      // 在 React 组件中使用
      import { PersistGate } from 'redux-persist/integration/react';

      function App() {
        return (
          <Provider store={store}>
            <PersistGate loading={null} persistor={persistor}>
              <RootComponent />
            </PersistGate>
          </Provider>
        );
      }
    ```
  - 长时间存储的注意事项
    - 选择性持久化 不是所有状态都需要持久化，可以选择只保存重要的状态：
    ```javascript
      const persistConfig = {
        key: 'root',
        storage,
        whitelist: ['user', 'preferences'] // 只持久化这些 reducer，如果全部持久化，可以不使用 whitelist
      };

    ```
    - 版本控制：当应用更新时，持久化的数据可能需要迁移
    ```javascript
      import { createMigrate } from 'redux-persist';

      const migrations = {
        0: (state) => {
          // 迁移 state 版本 0 到版本 1
          return { ...state, newField: 'default value' };
        },
        1: (state) => {
          // 迁移 state 版本 1 到版本 2
          return { ...state, updatedField: state.oldField };
        }
      };

      const persistConfig = {
        // ... 其他配置
        version: 2,
        migrate: createMigrate(migrations, { debug: false })
      };

    ```
    - 性能考虑 频繁的存储操作可能影响性能，考虑节流（throttle）存储操作
    ```javascript
      import { configureStore } from '@reduxjs/toolkit';
      import { persistStore, persistReducer } from 'redux-persist';
      import storage from 'redux-persist/lib/storage';
      import { throttle } from 'lodash';
      import rootReducer from './reducers';

      // Persist 配置
      const persistConfig = {
        key: 'root',
        storage,
      };

      const persistedReducer = persistReducer(persistConfig, rootReducer);

      const store = configureStore({
        reducer: persistedReducer,
      });

      const persistor = persistStore(store);

      // 使用 throttle 对 store 的状态变化进行节流
      store.subscribe(
        throttle(() => {
          persistor.flush(); // 持久化数据
        }, 1000) // 每秒调用一次
      );

      export { store, persistor };

    ```

## immutable(不可变性)
  - 基本概念
    - Immutable 数据一旦创建，就不能被更改。对 Immutable 对象的任何修改都会返回一个新的对象，而原对象保持不变
  - 为什么使用immutable
    - 不可变数据更容易推理和调试
    - 并发安全：在多线程环境中，不可变数据不需要锁机制
    - 更容易进行变化检测：通过简单的引用比较就可以知道对象是否变化
    - 有助于实现撤销/重做功能：每次修改都产生新的对象，易于保存历史状态
  - 应用
    - redux：使用 immutable 数据结构来存储状态，避免直接修改状态
      ```javascript
        function todoReducer(state = [], action) {
          switch (action.type) {
            case 'ADD_TODO':
              return [...state, action.payload];
            case 'TOGGLE_TODO':
              return state.map(todo =>
                todo.id === action.id ? { ...todo, completed: !todo.completed } : todo
              );
            default:
              return state;
          }
        }

      ```
    - 状态更新
      ```jsx
        class MyComponent extends React.Component {
          shouldComponentUpdate(nextProps) {
            return this.props.data !== nextProps.data;
          }

          render() {
            // 渲染逻辑
          }
        }

      ```

## render方法的原理及触发时机
  - render方法的原理
    - 1 返回描述UI的虚拟DOM：render 方法返回一个轻量级的 JavaScript 对象（虚拟 DOM），描述组件应该渲染的内容
    - 2 纯函数： render 应该是一个纯函数，意味着对于相同的 state 和 props，它应该总是返回相同的结果
    - 3  不直接操作 DOM： render 方法不应该直接修改浏览器的 DOM，而是返回一个虚拟 DOM 结构
    - 声明式渲染： 开发者通过 render 方法声明组件在不同状态下应该呈现的样子，而不是命令式地指定 DOM 更新

  - 触发render的时机
    - 首次挂载：当组件第一次被挂载到 DOM 中时，会触发 render 方法
    - 更新：当组件的 state 或 props 发生变化时，会触发 render 方法
    - 强制更新：当组件需要被强制更新时，可以调用 forceUpdate 方法来触发 render 方法
    - 父组件重新渲染：当父组件重新渲染时，会触发子组件的 render 方法

## React中避免不必要的render
  - 1.使用 React.memo 包装函数组件
    - React.memo 是一个高阶组件，它对函数组件的 props 进行浅比较，如果 props 没有变化，就不会重新渲染
  - 2.对于类组件，使用 PureComponent 或实现 shouldComponentUpdate
    - PureComponent 自动实现了浅比较的 shouldComponentUpdate

## react native减少首屏加载时间
  - 代码分割和懒加载
    - 使用动态 import() 和 React.lazy() 来分割代码，只在需要时加载组件
    ```jsx
      const HeavyComponent = React.lazy(() => import('./HeavyComponent'));

      function App() {
        return (
          <React.Suspense fallback={<LoadingSpinner />}>
            <HeavyComponent />
          </React.Suspense>
        );
      }
    ```
  - 优化图片资源
    - 使用适当大小的图片，避免过大的图片文件
    - 考虑使用 WebP 格式的图片，它通常比 PNG 或 JPEG 更小
    - 使用图片缓存库，如 react-native-fast-image
  - 使用性能优化的列表组件
    - 对于长列表，使用 FlatList 或 SectionList 代替 ScrollView
  - 实现占位符和骨架屏
    - 在内容加载时显示占位符或骨架屏，提供更好的用户体验
  - 实现渐进式加载
    - 首先加载关键内容，然后逐步加载次要内容
    ```jsx
      function ProgressiveLoadingComponent() {
        const [isFullyLoaded, setIsFullyLoaded] = useState(false);

        useEffect(() => {
          // 模拟异步加载
          setTimeout(() => setIsFullyLoaded(true), 2000);
        }, []);

        return (
          <View>
            <CriticalContent />
            {isFullyLoaded && <NonCriticalContent />}
          </View>
        );
      }
    ```
  - 使用内存缓存
  - 优化网络请求

## react如何统计用户在每一页停留的时间
  - 使用 React Router 和 Hooks
  ```jsx
    import React, { useEffect, useState } from 'react';
    import { useLocation } from 'react-router-dom';

    function PageTimeTracker() {
      const location = useLocation();
      const [startTime, setStartTime] = useState(Date.now());

      useEffect(() => {
        // 当路由变化时，计算停留时间并发送数据
        const endTime = Date.now();
        const timeSpent = endTime - startTime;
        
        // 发送数据到分析服务
        sendAnalytics(location.pathname, timeSpent);

        // 重置开始时间
        setStartTime(Date.now());

        // 组件卸载时也要计算时间
        return () => {
          const unmountTime = Date.now();
          const finalTimeSpent = unmountTime - startTime;
          sendAnalytics(location.pathname, finalTimeSpent);
        };
      }, [location]);

      return null; // 这个组件不渲染任何内容
    }

    function sendAnalytics(page, time) {
      // 实现发送数据到你的分析服务的逻辑
      console.log(`User spent ${time}ms on ${page}`);
    }

    // 在你的主 App 组件中使用
    function App() {
      return (
        <Router>
          <PageTimeTracker />
          {/* 其他路由组件 */}
        </Router>
      );
    }

  ```
  - 自定义hooks
  ```jsx
    import { useEffect, useState } from 'react';

    function usePageTimeTracking(pageName) {
      const [startTime] = useState(Date.now());

      useEffect(() => {
        return () => {
          const endTime = Date.now();
          const timeSpent = endTime - startTime;
          sendAnalytics(pageName, timeSpent);
        };
      }, [pageName]);
    }

    // 在组件中使用
    function HomePage() {
      usePageTimeTracking('HomePage');
      return <div>Home Page Content</div>;
    }
  ```

## fiber架构
  - React Fiber 是 React 16 中引入的新的协调引擎或重新实现核心算法。它的主要目标是提高 React 在动画、布局和手势等领域的适用性
  - Fiber 解决的主要问题
    - 中断和恢复长时间运行的任务
    - 为不同类型的更新分配优先级
    - 新的并发模式
    - 错误边界的改进
  - 工作原理
    - Fiber 引入了两个主要阶段
      - 渲染/协调阶段（可中断）
      - 提交阶段（不可中断）
      ```javascript
        function workLoop(deadline) {
          let shouldYield = false;
          while (nextUnitOfWork && !shouldYield) {
            nextUnitOfWork = performUnitOfWork(nextUnitOfWork);
            shouldYield = deadline.timeRemaining() < 1;
          }
          requestIdleCallback(workLoop);
        }

        requestIdleCallback(workLoop);

      ```
  - 优先级调度
    - Fiber 允许 React 为更新分配优先级
    ```javascript
      // 高优先级更新
      ReactDOM.flushSync(() => {
        this.setState({high: true});
      });

      // 低优先级更新
      this.setState({low: true});

    ```


## react优化手段
  - 避免不必要的render
    - 使用 React.memo 包装函数组件
    - shouldComponentUpdate 生命周期方法
    - React.PureComponent
  - 其他常规手段
    - 避免使用内联函数比如下面的
    ```jsx
      function MyComponent({ data, setData }) {
        return (
          <div>
            <input value={data} onChange={(e) => setData(e.target.value)} />
            <p>Data: {data}</p>
          </div>
        );
      }
      // 优化方案
      import React, { useCallback } from 'react';

      function MyComponent({ data, setData }) {
        const handleChange = useCallback((e) => {
          setData(e.target.value);
        }, [setData]);

        return (
          <div>
            <input value={data} onChange={handleChange} />
            <p>Data: {data}</p>
          </div>
        );
      }

      export default React.memo(MyComponent);

    ```
    - 使用 React Fragments 避免额外标记
    ```jsx
      function MyComponent() {
        return (
          <>
            <div>Hello</div>
            <div>World</div>
          </>
        );
      }
    ```  
    - 懒加载组件
    - 服务端渲染
    - 事件绑定方式推荐
    ```jsx
      import React, { useCallback } from 'react';

      function MyComponent() {
        const handleClick = useCallback((e) => {
          console.log('Button clicked');
        }, []); // 依赖数组为空，函数只会创建一次

        return <button onClick={handleClick}>Click me</button>;
      }
    ```

## react中如何捕获错误
  - 错误边界
  ```jsx
    class ErrorBoundary extends React.Component {
      constructor(props) {
        super(props);
        this.state = { hasError: false };
      }

      static getDerivedStateFromError(error) {
        // 更新 state 使下一次渲染能够显示降级后的 UI
        return { hasError: true };
      }

      componentDidCatch(error, errorInfo) {
        // 你同样可以将错误日志上报给服务器
        console.log('Error:', error, errorInfo);
      }

      render() {
        if (this.state.hasError) {
          // 你可以自定义降级后的 UI 并渲染
          return <h1>Something went wrong.</h1>;
        }

        return this.props.children; 
      }
    }

    // 使用方法
    <ErrorBoundary>
      <MyComponent />
    </ErrorBoundary>

  ```
  - try catch
  - window.onerror或者window.addEventListener('error', callback)
  ```jsx
    window.onerror = function(message, source, lineno, colno, error) {
      console.error('Uncaught error:', error);
      // 返回 true 表示该错误已经被处理
      return true;
    }

    // 或者
    window.addEventListener('error', (event) => {
      console.error('Uncaught error:', event.error);
    });

  ```
  - useErrorBoundary
  ```jsx
    import { useErrorBoundary } from 'use-error-boundary';

    function MyComponent() {
      const { ErrorBoundary, didCatch, error } = useErrorBoundary();

      if (didCatch) {
        return <div>An error occurred: {error.message}</div>;
      }

      return (
        <ErrorBoundary>
          {/* 你的组件内容 */}
        </ErrorBoundary>
      );
    }

  ```
  - 使用sentry
  ```jsx 
    import * as Sentry from "@sentry/react";

    Sentry.init({
      dsn: "YOUR_SENTRY_DSN",
      integrations: [new Sentry.BrowserTracing()],
      tracesSampleRate: 1.0,
    });

    // 在你的 React 应用中
    function App() {
      return (
        <Sentry.ErrorBoundary fallback={<ErrorFallback />}>
          <YourApp />
        </Sentry.ErrorBoundary>
      );
    }

  ```

## react router
  - 基本概念
    - BrowserRouter：用于创建一个路由器，它会监听 URL 的变化并将 URL 映射到组件
    - Route：用于定义路由规则，它会匹配 URL 并渲染相应的组件
    - Link：用于创建一个链接，点击该链接会跳转到指定的路由
    - Switch：用于将多个 Route 组合在一起，它会匹配第一个匹配的 Route 并渲染其组件
    ```jsx
      import { BrowserRouter as Router, Route, Link, Switch } from 'react-router-dom';

      function App() {
        return (
          <Router>
            <nav>
              <Link to="/">Home</Link>
              <Link to="/about">About</Link>
            </nav>

            <Switch>
              <Route exact path="/" component={Home} />
              <Route path="/about" component={About} />
            </Switch>
          </Router>
        );
      }

    ```
  - 路由传参
    ```jsx
      <Route path="/user/:id" component={User} />

      // 在 User 组件中
      function User({ match }) {
        return <div>User ID: {match.params.id}</div>;
      }

    ```
  - 路由嵌套
    ```jsx
      function User({ match }) {
        return (
          <div>
            <h2>User Profile</h2>
            <Route path={`${match.path}/posts`} component={UserPosts} />
            <Route path={`${match.path}/settings`} component={UserSettings} />
          </div>
        );
      }

    ```
  - 路由守卫
    ```jsx
      function PrivateRoute({ component: Component, ...rest }) {
        return (
          <Route
            {...rest}
            render={props =>
              isAuthenticated() ? (
                <Component {...props} />
              ) : (
                <Redirect to="/login" />
              )
            }
          />
        );
      }

      // 使用
      <PrivateRoute path="/dashboard" component={Dashboard} />

    ```
  - 路由配置
    ```jsx
      const routes = [
        { path: '/', exact: true, component: Home },
        { path: '/about', component: About },
        { path: '/users', component: Users, routes: [
          { path: '/users/:id', component: User }
        ]}
      ];

      function renderRoutes(routes) {
        return (
          <Switch>
            {routes.map((route, i) => (
              <Route
                key={i}
                path={route.path}
                exact={route.exact}
                render={props => (
                  <route.component {...props} routes={route.routes} />
                )}
              />
            ))}
          </Switch>
        );
      }

    ```
  - 路由钩子
    - useParams：用于获取路由参数
    - useLocation：用于获取当前路由信息
    - useHistory：用于操作历史记录
    - useRouteMatch：用于获取当前路由信息
  - 路由过渡动画
    ```jsx
      import { TransitionGroup, CSSTransition } from 'react-transition-group';

      function AnimatedSwitch({ location }) {
        return (
          <TransitionGroup>
            <CSSTransition key={location.key} classNames="fade" timeout={300}>
              <Switch location={location}>
                {/* 路由定义 */}
              </Switch>
            </CSSTransition>
          </TransitionGroup>
        );
      }

    ```
  - 代码分割:结合 React.lazy 和 Suspense 实现路由级别的代码分割
    ```jsx
      import React, { Suspense, lazy } from 'react';
      import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';

      const Home = lazy(() => import('./routes/Home'));
      const About = lazy(() => import('./routes/About'));

      function App() {
        return (
          <Router>
            <Suspense fallback={<div>Loading...</div>}>
              <Switch>
                <Route exact path="/" component={Home}/>
                <Route path="/about" component={About}/>
              </Switch>
            </Suspense>
          </Router>
        );
      }

    ```