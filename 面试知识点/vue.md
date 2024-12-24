## 对vue的理解：
  - vue是一个渐进式JavaScript框架，用于构建用户界面的MVVM框架
  - 核心特征：
    - 数据驱动
    - 组件化
    - 声明式渲染
    - 虚拟DOM
    - 双向数据流

## 单页面应用与多页面应用：

  | 特性           | 单页面应用(SPA)          |多页面应用(MPA) |
  | ----------------|------------------------| ------------|
  | 组成         | 一个主页面和多个页面片段   | 多个主页面| 
  | 刷新方式     | 局部刷新                 | 整个页面刷新| 
  | URL模式     | 一般采用哈希模式           | 历史模式| 
  | SEO优化     | 比较难，使用SSR改善        | 容易实现| 
  | 数据传递     | 容易                     | 通过URL、cookie、localStorage、sessionStorage等| 
  | 页面切换     | 速度快，用户体验好         | 切换加载资源、速度慢| 
  | 维护成本     | 容易                     | 难| 

  - 实现单页应用：
    - 1、路由管理：
    - 2、动态内容渲染
    - 3、状态管理
    - 4、组件化

## Hash模式和History模式：
  - 1、URL格式：
    - Hash模式：http://example.com/#/user/id
    - History模式：http://example.com/user/id
  - 2、实现原理：
    - Hash模式：
      - 利用URL的hash值来模拟一个完整的URL，当hash改变时，页面不会重新加载
      - 通过监听hashchange事件从而实现页面的切换
    - History模式：
      - 利用HTML5新增的history.pushState()和history.replaceState()方法来实现- URL的变化，
  - 4、服务器配置：
    - Hash模式：
      - 不需要特殊的服务器配置
    - History模式：
      - 服务器需要配置
  - 5、SEO友好性：
    - Hash模式：
      - 不利于SEO
    - History模式：
      - 利于SEO
  - 6、页面刷新：
    - Hash模式：
      - 页面刷新时不会向服务器发送请求
    - History模式：
      - 页面刷新会向服务器发送请求，需要服务器正确响应

## v-if和v-show
  - 控制手段： v-show隐藏是通过display:none来隐藏元素，v-if是通过删除元素来实现的
  - 编译过程： v-if有局部编译/卸载的过程，切换过程中会销毁和重建内部的事件监听和子组件，v-show没有局部编译/卸载的过程，只是简单的切换元素的display属性
  - 性能消耗： v-if有更高的切换开销，v-show有更高的初始渲染开销

## vue实例挂载过程中发生了什么：
  1、初始化事件和生命周期
    设置内部事件监听器
    初始化生命周期钩子函数
  2、初始化注入和校验
    处理provide和reject选项
    校验props选项
  3、初始化状态
    初始化data选项
    初始化computed选项
    初始化methods选项
    初始化watch侦听器
  4、初始化渲染
    解析模板或者编译渲染函数
    生成虚拟DOM
  5、调用beforeMount钩子函数
  6、创建vue实例的$el属性
    如果有el选项，则将el选项的值作为模板的根元素，否则创建一个空的div元素作为模板的根元素
  7、将模板渲染为虚拟DOM
  8、将虚拟DOM渲染为真实DOM
  9、用生成的DOM替换el选项的值
  10、调用mounted钩子函数

## vue生命周期：
  初始化阶段：
    beforeCreate：在实例创建之后数据观测配置之前被调用
    created：在实例创建之后调用
  挂载阶段：
    beforeMount：在挂载之前调用
    mounted：在挂载之后调用
  更新阶段：
    beforeUpdate：在更新之前调用
    updated：在更新之后调用
  销毁阶段：
    vue2
      beforeDestroy：在销毁之前调用
      destroyed：在销毁之后调用
    vue3
      beforeUnmount: 在卸载之前调用
      unmounted: 在卸载之后调用
  错误捕捉阶段：
    errorCaptured：捕获一个来自子孙组件的错误时被调用
  调试阶段：
    renderTracked：跟踪虚拟 DOM 重新渲染时调用
    renderTriggered：当虚拟 DOM 重新渲染时调用
  组件缓存阶段：
    activated：被keep-alive缓存的组件激活时调用
    deactivated：被keep-alive缓存的组件停用时调用

## v-if和v-for不建议一起使用：
  同时使用 v-if 和 v-for 是不推荐的，因为这样二者的优先级不明显
  vue3: 当 v-if 和 v-for 同时存在于一个元素上的时候，v-if 会首先被执行
  Vue2: 当 v-if 和 v-for 同时存在于一个元素上的时候, v-for 的优先级高于 v-if


## 首屏加载慢的原因：
  - 首屏加载慢的原因：
    - 1、网络问题：
      网络延迟
      网络拥塞
      网络带宽
    - 2、服务器问题：
      服务器负载
      服务器配置
      服务器硬件
    - 3、客户端问题：
      客户端渲染
      客户端缓存
      客户端资源
    - 4、代码问题：
      代码复杂度
      代码冗余
      代码耦合
    - 5、其他问题：
      服务器配置
      服务器负载
  - 解决方案：
    - 1、路由懒加载
      ```vue
        const Home = () => import('./components/Home.vue')
        const About = () => import('./components/About.vue')

        const routes = [
          { path: '/', component: Home },
          { path: '/about', component: About }
        ]
      ```
    - 2、开启gzip压缩

      vite: 
      ```vue
        import viteCompression from 'vite-plugin-compression'
        export default defineConfig({
          plugins: [
            vue(),
            viteCompression({
              verbose: true,
              disable: false,
              threshold: 10240,
              algorithm: 'gzip',
              ext: '.gz',
            })
          ],
        })
        ```
      webpack:
      ```vue
        const CompressionPlugin = require('compression-webpack-plugin')
        module.exports = {
          plugins: [
            new CompressionPlugin({
              algorithm: 'gzip',
              test: /\.js$|\.html$|\.css$|\.map$/,
              threshold: 10240,
              minRatio: 0.8
            })
          ]
        }
        ```
    - 3、静态资源本地缓存
    - 4、图片优化
    - 5、服务端渲染 (SSR) 使用 Nuxt.js (Vue) 或 Next.js (React) 等框架实现服务端渲染
    - 6、代码分割、按需加载
    - 7、利用浏览器缓存、service worker 等技术
      // 注册 Service Worker
      if ('serviceWorker' in navigator) {
        window.addEventListener('load', () => {
          navigator.serviceWorker.register('/service-worker.js')
        })
      }

## data为什么是一个函数而不是一个对象：
  - 因为vue组件是可以复用的，如果data是一个对象，那么所有的组件都会共享这个对象，这样会导致数据不一致
  - 如果data是一个函数，那么每个组件都会有一个独立的data对象，这样就不会出现数据不一致的问题

## vue2和vue3数据劫持：
  - vue2
    通过Object.defineProperty()方法来实现数据劫持
    缺点：
      无法监听数组的变化
      无法监听对象的属性添加和删除
  - vue3
    通过Proxy()方法来实现数据劫持




## vue内置指令：
  v-bind
  v-for
  v-if
  v-on
  v-html
  v-show
  v-text
  v-model
  v-slot
  v-pre: 跳过该元素及其所有子元素的编译
  v-once

  v-memo: 缓存一个模板的子树


## vue3修饰符
  - input修饰符
    .number
    .trim
    .lazy
  - 事件修饰符
    .prevent: 阻止默认事preventDefault()
    .stop: 阻止冒泡事件stopPropagation()
    .self: 只当事件目标是元素本身时触发事件处理函数
    .once: 只触发一次
    .capture: 事件捕获模式
    .passive：事件监听以被动模式触发
  - 键盘修饰符：
    .enter：回车键
    .tab：Tab键
    .delete：Delete键
    .esc：Esc
    .space：空格
    .up：上箭头
    .down：下箭头
    .left：左箭头
    .right：右箭头
  - 鼠标修饰符：
    .left：左键
    .right：右键
    .middle：中键    

## watchEffect和watch：
  - 1、定义方式：
    - watch：(source, callback, options)
    - watchEffect：(callback, options)
  - 2、区别：
    - 数据源指定：
     -  watch: 需要明确指定要监听的数据源
      - watchEffect: 不需要明确指定要监听的数据源，会自动监听所有响应式数据
    - 回调触发机制：
      - watch: 在数据源发生变化时触发回调
      - watchEffect: 在组件初始化时会立即执行一次，之后在数据源发生变化时触发回调
    - 回调参数：
      - watch: 回调函数接受两个参数，分别是新值和旧值
      - watchEffect: 回调函数接受一个参数，即新值
    - 停止监听：
      - 两者都返回一个停止函数，可以用来停止监听
      ```vue
      `const stop = watchEffect(() => {
        // ...
      })
      // 停止监听：
      stop()
    ````

## watch和watchEffect默认是异步执行的，但是可以通过flush选项来指定同步执行
  - watchEffect(callback, { flush: 'sync' })
  - watch(source, callback, { flush: 'sync' })
  - 或者使用watchSyncEffect(callback),在响应时同步执行回调


## 动态组件
  ```vue
    <template>
      <component :is="currentComponent"></component>
    </template>

    <script setup>
    import ViewComponent from './ViewComponent.vue'; // 导入目标组件

    const currentComponent = 'ViewComponent'; // 动态设置组件名，必须与注册名一致
    </script>
  ```

## 组件与插件的区别：

  - 组件是vue应用的基本构建块，插件是vue应用的扩展
  - 组件通过vue.component()注册，插件通过vue.use()注册
  - 组件可以在多个地方重复使用，插件通常只需要注册一次
  - 组件可以有自己的生命周期钩子函数，插件通常没有生命周期钩子函数

  ```javascript
    Myplugin.install = function (Vue, options) {
      // 添加全局方法或属性
      Vue.prototype.$myPluginMethod = function () {
        // ...
      }

      // 添加全局指令
      Vue.directive('my-directive', {
        bind: function () {
          // ...
        },
        update: function () {

        }
      })

      // 添加全局过滤器
      Vue.filter('my-filter', function (value) {
        // ...
      })
      // 注入组件选项
      Vue.mixin({
        created: function () {
          // ...
        }
      })
    }
  ```
## vue组件之间的通信
  - 父子组件通信：
    - 父组件通过props向子组件传递数据
    - 子组件通过$emit向父组件传递数据
  - Provide/Inject(夸多级组件通信)使用原型链实现的：

    - 父组件
      ```vue
        export default {
          setup() {
            const sharedValue = ref('Shared data')
            provide('sharedKey', sharedValue)
          }
        }
      ```

    - 子组件
      ```vue
        export default {
          setup() {
            const sharedValue = inject('sharedKey')
            return { sharedValue }
          }
        }
      ```
  - 使用pinia管理状态：

    - 安装pinia
    ```shell
      npm install pinia
    ```
    - 创建store
    ```vue
      import { defineStore } from 'pinia'

      export const useCounterStore = defineStore('counter', {
        state: () => ({
          count: 0
        }),
        getters: {
          doubleCount: (state) => state.count * 2
        },
        actions: {
          increment() {
            this.count++
          }
        }
      })
    ```
    - 使用store
    ```vue
      import { useCounterStore } from '@/stores/counter'

      export default {
        setup() { 
          const counterStore = useCounterStore()
          return {
            count: counterStore.count,
            doubleCount: counterStore.doubleCount,
            increment: counterStore.increment
          }
        }
      } 
    ```
  - vue2中使用vuex：

    - 安装vuex
    ```shell
      npm install vuex
    ```
    - 创建store
    ```vue
      import Vue from 'vue'
      import Vuex from 'vuex'

      Vue.use(Vuex)

      const store = new Vuex.Store({
        state: {
          count: 0
        },
        getters: {
          doubleCount: state => state.count * 2
        },
        mutations: {
          increment(state) {
            state.count++
          }
        }
      })
    ```
    - 使用store
      ```vue
        import { mapState } from 'vuex'

        export default {
          computed: {
            ...mapState(['count', 'doubleCount'])
          },
          methods: {
            increment() {
              this.$store.commit('increment')
            }
          }
        }
      ```

  - vue2中使用event bus, event bus是基于发布订阅模式的，event bus可以实现任意组件之间的通信



## vue3双向绑定原理：
  - vue3的响应式系统是基于Proxy和Reflect实现的，Proxy可以拦截对象的读取、设置、删除等操作，Reflect可以实现对Proxy的反射操作
  在vue3中，当一个响应式对象被创建时，会调用reactive()函数，该函数会返回一个Proxy对象，该对象会拦截对象的读取、设置、删除等操作，当对象的属性被读取时，会触发getter函数，当对象的属性被设置时，会触发setter函数，当对象的属性被删除时，会触发deleter函数

  - 依赖收集：当访问一个响应式对象的属性时，vue会跟踪谁在使用这个属性，这个过程叫做依赖收集

  - 触发更新：当响应式对象的属性被设置或删除时，vue会通知所有依赖这个属性的组件，这个过程叫做触发更新

  - 副作用函数(effect)：effect函数用于包装那些依赖响应式状态的函数，当响应式状态发生变化时，effect函数会重新执行

## vue3事件原理：
  - vue3中会使用@click来绑定事件，然后使用虚拟DOM来管理和更新真实的DOM，在虚拟DOM中事件监听器会被表示为VNode的一个属性
  - vue创建了一个统一的事件处理器，这个处理器会被添加到DOM上的，这个处理器使用了事件委托
  - vue不是为每个元素单独添加事件监听器的，而是在父元素上添加一个事件监听器，然后根据事件的目标元素来调用相应的函数
  - 在底层，vue使用addEventListener来添加事件监听器，然后使用removeEventListener来移除事件监听器
    
## vue3中的常用的一些宏
  - setup：
    - defineProps：定义组件的props, 用于声明组件可以接受的props
    - defineEmits：定义组件的emits, 用于声明组件可以触发的事件
    - defineExpose：定义组件的expose, 用于显式地暴露组件的属性和方法
    - withDefaults：定义组件的props的默认值
    - defineOptions：定义组件的选项, 比如name, inheritAttrs
      ```vue
        <script setup>
        defineOptions({
          name: 'MyComponent',
          inheritAttrs: false
        })
        </script>
      ```
  - defineAsyncComponent: 虽然不是 <script setup> 的一部分，但它是一个用于定义异步组件的宏。

## Mixins与Hooks
  - 都是代码复用的技术
  - Mixins：
    - 优点：
      - 可以将多个组件的相同逻辑提取到一个单独的文件中，方便维护
    - 缺点：
      - 命名冲突：当多个mixin中有相同的属性或方法时，会导致命名冲突
      - 隐式依赖：当mixin中包含了其他mixin时，会导致隐式依赖，导致代码难以理解和维护
      - 复杂性：当mixin中包含了多个mixin时，会导致代码更加复杂，难以理解和维护
  - Hooks：
    - 优点：
      - 更好的代码组织方式：将逻辑按照功能进行划分，每个功能对应一个hook，方便理解和维护
      - 更好的代码复用方式：可以将逻辑提取到一个单独的文件中，方便复用
      - 没有命名冲突：每个hook都有一个唯一的名字，不会导致命名冲突
    - 缺点：
      学习曲线：需要学习新的语法和概念，比如hooks，需要花费一些时间来学习和掌握

## solt是什么
  - 在html中，slot元素作为web components的占位符，用于在组件中插入内容,在vue中也是如此
  - slot分类
    - 默认插槽：没有name属性的slot
      - <SubmitButton>组件
      ```vue
        <button type="submit">
          <slot></slot>
        </button>
      ```
      - 父组件使用
      ```vue
        <SubmitButton>Save</SubmitButton>
      ```
    - 具名插槽：有name属性的slot

      - <SubmitButton>组件
        ```vue
          <button type="submit">
            <slot name="button"></slot>
          </button>
        ```
      - 父组件使用
        ```vue
          <SubmitButton>
            <template v-slot:button>
              <span>Save</span>
            </template>
          </SubmitButton>
        ```

    作用域插槽：插槽的值是从父组件传递过来的，而不是从子组件传递过来的

      <SubmitButton>组件
        <button type="submit">
          <slot name="button" :user="user"></slot>
        </button>

      父组件使用

        <SubmitButton>
          <template v-slot:button="slotProps">
            <span>{{ slotProps.user.name }}</span>
          </template>
        </SubmitButton>


## Vue.observable是什么
  - Vue.observable 将一个普通的 JavaScript 对象转换为一个响应式对象。这意味着对该对象的任何属性的更改都会触发视图的更新

## vue中的key
  - key是给每一个vnode的唯一id，也是diff的一种优化策略，可以根据key，更准确， 更快的找到对应的vnode节点

## keep-alive如何缓存组件，缓存后如何更新
  - 使用keep-alive组件包裹需要缓存的组件
  - 使用include和exclude属性来指定需要缓存的组件
  - 使用max属性来指定缓存组件的最大数量

  ```vue
  <!-- 缓存组件a和b -->
  <keep-alive include="['a', 'b']" exclude="c" max="10">
    <component :is="view"></component>
  </keep-alive>
  ```

  - 缓存组件：
    - 当组件第一次渲染时，会被缓存，当再次渲染时，会从缓存中取出，而不是重新渲染
  - 缓存组件的更新：
    - beforeRouteEnter和activated钩子函数
    - 服务端渲染的时候activated钩子函数不会被调用

## diff算法
  - diff算法是一种通过同层的树节点进行比较，找到差异的算法，从而提高性能的一种算法
  - 深度优先，只比较同层级的节点，不跨层级比较，比较过程中循环从两边向中间遍历
  - 通过key属性来标识节点的唯一性
  - 采用双端比较的策略来提高效率


## axios封装
  - axios是一个轻量的http客户端，基于XMLHttpRequest开发，支持Promise API
  - 特性：
    - 从浏览器中创建XMLHttpRequest
    - 支持Promise API
    - 支持请求和响应的拦截器
    - 支持请求和响应的错误处理
    - 支持请求和响应的转换
    - 支持请求和响应的缓存
    - 支持请求和响应的取消
  - 如何封装：
    - 与后端协商好请求头、状态码、超时时间、请求方法等
    - 设置接口请求前缀：根据开发、测试、预发、线上环境的不同，设置不同的接口请求前缀
    - 请求头：根据具体业务，设置请求头需要带的参数
    - 状态码：根据具体业务，设置状态码的含义
    - 请求方法：根据具体业务，设置请求方法
    - 请求拦截器：根据请求头的设定，设置请求拦截器
    - 响应拦截器：根据后端返回的数据，设置响应拦截器
  - 取消请求
    - 拦截器中，添加一个cancelToken属性，用来取消请求,cancelToken是利用Promise.reject来实现的取消请求
    ```javascript
    const source = axios.CancelToken.source()
    axios.get('/user/12345', {
      cancelToken: source.token
    })
    source.cancel()

    const CancelToken = axios.CancelToken;
    let cancel;

    axios.get('xxxx', {
      cancelToken: new CancelToken(function executor(c) {
        cancel = c;
      })
    });
    cancel('主动取消请求');
  ```
  - 实现简易版axios
    ```javascript
    class Axios {
      constructor(config) {}

      request(config) {
        return new Promise((resolve, reject) => {
          // 处理config
          const { url, method, data, headers, timeout } = config;
          // 创建一个XMLHttpRequest对象
          const xhr = new XMLHttpRequest(); 
          // 设置请求方法
          xhr.open(method, url, true);
          // 设置请求头
          Object.keys(headers).forEach(key => {
            xhr.setRequestHeader(key, headers[key]);
          });
          // 设置超时时间
          xhr.timeout = timeout;
          // 设置请求体
          xhr.send(data);
          // 处理响应
          xhr.onload(function() {
            resolve(xhr.response);
          })
        })
      }
    }
  ```

## vue2和vue3的区别
  - 1、性能提升
    - 更小的包体积
      - vue3的核心库体积只有10kb左右，而vue2的核心库体积为30kb左右，tree-shaking可以减少体积
    - 重写了虚拟DOM的实现
    - 编译优化
      - vue3的编译器使用了基于AST的编译器，编译速度更快
      - vue2的编译器使用了基于字符串的编译器，编译速度更慢
    - 响应系统
      - 使用proxy和reflect实现响应系统，替代了Object.defineProperty
      - 可以监听数组变化和对象的删除/添加
  - 2、支持多根节点
  - 3、引入了Teleport组件
    - 允许将组件渲染到指定的DOM节点中
  - 4、声明周期变化
  - 5、vue3的异步组件需要使用defineAsyncComponent来定义
  - 6、typescript支持
  - 7、更好的tree-shaking支持
  - 8、Suspense组件
    - 用于协调异步组件的加载
    ```vue
      <Suspense>
        <template #default>
          <AsyncComponent />
        </template>
        <template #fallback>
          Loading...
        </template>
      </Suspense>
    ```

## vue3性能提升方面
  - 编译阶段
    - diff算法优化
      - 静态提升：只会被创建一次，在渲染时直接复用
      - 事件监听缓存
    - SSR优化：
  - 源码体积
    - 移出一些不常用的API，再重要的是Tree shanking
  - 响应式系统
    - 使用Proxy代替Object.defineProperty

## Attributes 继承
  - “透传 attribute”指的是传递给一个组件，却没有被该组件声明为 props 或 emits 的 attribute 或者 v-on 事件监听器。最常见的例子就是 class、style 和 id

## 追踪运行时错误
  - 应用级错误处理 可以用来向追踪服务报告错误：
  ```javascript
    improt { createApp } from 'vue'
    const app = createApp({})
    app.config.errorHandler = (err, instance, info) => {
      // 向追踪服务报告错误
    }
  ```
  - 组件级错误处理 可以用来在组件内报告错误：
  ```javascript
    import { defineComponent } from 'vue'
    export default defineComponent({
      setup(props, { emit }) {
        // ...
      },
      render() {
        // ...
      },
      onError(err, instance, info) {
        // 向追踪服务报告错误
      }
    })
  ```
  - Sentry和Bugsnag也提供了Vue的插件，可以用来追踪运行时错误

## webpack构建
  - npm init -y
  - tsc --init
  - npm i -D webpack webpack-cli webpack-dev-server ts-loader html-webpack-plugin
  - npm i -D @types/webpack @types/webpack-dev-server @types/webpack-cli @types/ts-loader
  - npm i -D @babel/core @babel/preset-env @babel/preset-typescript
  - Source Map 是一种用于将压缩、混淆或编译后的代码映射回原始源代码的文件。它的主要作用是帮助开发者在浏览器中调试代码时，能够看到原始的代码内容，而不是机器优化后的代码。


## vue-router
  - vue3对应router4+,vue2对应router3
  - vue2 mode history模式 vue3 createWebHistory
  - vue2 mode hash模式 vue3 createWebHashHistory
  - useRouter: 用于获取路由器实例，允许你以编程方式操作路由
    - 主要用途
      - 编程式导航
      - 动态添加路由
      - 访问全局路由配置和方法

      ```vue
        const router = useRouter()
        router.push('/home')
        router.push({ path: '/home' })
        router.push({ name: 'user', params: { userId: '123' } })
        router.push({ path: '/user', query: { userId: '123' } })
      ```
  - useRoute: 用于获取当前路由对象，包含当前URL的状态和参数
    - 主要用途
      - 访问路由参数
      - 获取查询字符串
      - 获取查询字符串
      ```vue
        const route = useRoute()
        route.params.id
        route.query.id
        route.fullPath
      ```
  - beforeEach：全局前置守卫，在路由跳转前执行
    ```javascript
      const router = createRouter({ ... })

      router.beforeEach((to, from, next) => {
        // ...
        next()
      })

    ```
  - beforeResolve：在导航被确认之前，同时在所有组件内守卫和异步路由组件被解析之后调用
    ```javascript
      router.beforeResolve(async (to) => {
        if (to.meta.requiresCamera) {
          try {
            await askForCameraPermission()
          } catch (error) {
            if (error instanceof NotAllowedError) {
              // ... 处理错误
              return false
            } else {
              // 意料之外的错误，取消导航并把错误传给全局处理器
              throw error
            }
          }
        }
      })

    ```
  - afterEach：全局后置钩子，在路由跳转后执行
    ```javascript
      router.afterEach((to, from) => {
        sendToAnalytics(to.fullPath)
      })
    ```
  - beforeEnter：路由进入前执行
    ```javascript
      const routes = [
        {
          path: '/users/:id',
          component: UserDetails,
          beforeEnter: (to, from, next) => {
            // ...
            next()
          }
        }
      ]
    ```
  - beforeRouteEnter：在渲染该组件的对应路由被验证前调用
    ```javascript
      const UserDetails = {
        template: `...`,
        beforeRouteEnter(to, from, next) {
          // 在渲染该组件的对应路由被 confirm 前调用
          // 不能获取组件实例 `this`
          // 因为当守卫执行前，组件实例还没被创建
        }
      }
    ```
  - beforeRouteUpdate：在当前路由改变，但是该组件被复用时调用
    ```javascript
      const UserDetails = {
        template: `...`,
        beforeRouteUpdate(to, from) {
          // 在当前路由改变，但是该组件被复用时调用
          // 举例来说，对于一个带有动态参数的路径 `/users/:id`，在 `/users/1` 和 `/users/2` 之间跳转的时候，
          // 由于会渲染同样的 UserDetails 组件，因此组件实例会被复用。而这个钩子就会在这个情况下被调用。
          // 因为在这种情况发生的时候，组件已经挂载好了，导航守卫可以访问组件实例 `this`
        }
      }
    ```
  - beforeRouteLeave：导航离开该组件的对应路由时调用
    ```javascript
      const UserDetails = {
        template: `...`,
        beforeRouteLeave(to, from) {
          const answer = window.confirm('Do you really want to leave? you have unsaved changes!')
          if (!answer) return false
        }
      }
    ```

## vue2如何实现对数组和对象的响应式
  - vue2中，对数组和对象的响应式是通过Object.defineProperty()方法实现的，对对象进行响应式处理时，会遍历对象的所有属性，对每个属性都调用Object.defineProperty()方法，对数组进行响应式处理时，会遍历数组的所有元素，对每个元素都调用Object.defineProperty()方法，这样就实现了对数组和对象的响应式处理。对数组是通过重写数组方法来实现的数组的响应式的。
  - vue3是使用proxy来实现对象和数组的响应式
  - vue2中对新增对象属性的处理：this.$set(this.obj, 'newKey', 'newValue'), Object.assign(),computed
