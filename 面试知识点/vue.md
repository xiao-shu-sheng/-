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
  - vue2中对新增对象属性的处理：this.$set(this.obj, 'newKey', 'newValue'), Object.assign(),computed，forceUpdate()

## 按需加载(也称为懒加载或动态导入)
  - 是一种优化技术，用于减少初始加载时间和提高应用性能
  - 按需加载的实现方式：
    - 路由级别的按需加载
      ```javascript
        import { createRouter, createWebHistory } from 'vue-router'

        const routes = [
          {
            path: '/home',
            name: 'Home',
            component: () => import('./views/Home.vue')
          },
          {
            path: '/about',
            name: 'About',
            component: () => import('./views/About.vue')
          }
        ]

        const router = createRouter({
          history: createWebHistory(),
          routes
        })

      ```
    - 组件级别的按需加载
      ```javascript
        <script setup>
        import { defineAsyncComponent } from 'vue'

        const HeavyComponent = defineAsyncComponent(() => 
          import('./components/HeavyComponent.vue')
        )
        </script>

        <template>
          <HeavyComponent v-if="showHeavyComponent" />
        </template>
      ```
    - 条件渲染的按需加载，使用v-if和v-else
      ```javascript
        <script setup>
        import { defineAsyncComponent } from 'vue'

        const HeavyComponent = defineAsyncComponent(() =>
          import('./components/HeavyComponent.vue')
        )
        </script>

        <template>
          <HeavyComponent v-if="showHeavyComponent" />
          <div v-else>Loading...</div>
        </template>
      ```
    - 使用Suspense组件
      ```javascript
        <template>
          <Suspense>
            <template #default>
              <AsyncComponent />
            </template>
            <template #fallback>
              <div>Loading...</div>
            </template>
          </Suspense>
        </template>

        <script setup>
        import { defineAsyncComponent } from 'vue'

        const AsyncComponent = defineAsyncComponent(() => 
          import('./components/AsyncComponent.vue')
        )
        </script>
      ```

## composition Api是什么
  - 组合式API是Vue3中引入的新特性，它允许开发者使用函数式编程的方式来组织代码，从而提高代码的可读性和可维护性。
  - 组合式API的优点：
    - 更好的代码组织和复用性
    - 更好的代码可读性和可维护性
  - 主要有ref、reactive、computed、watch、provide、inject、toRefs、toRef、shallowRef

## setup()函数在vue3中气什么作用
  - setup()是vue3组件选项，是组合式api的入口函数，在组件实例创建之前执行，用于初始化状态、计算属性、方法和生命周期钩子等，并返回在模板中使用的数据和方法
## ref和reactive的区别
  - 数据类型
    - ref适用于基本类型和对象类型，reactive只适用于对象类型
  - 访问和修改
    - ref访问和修改数据时，需要使用.value，reactive访问和修改数据时，不需要使用.value
  - 重新赋值
    - ref可以直接赋值，reactive不可以直接赋值，会失去响应性
  - ts类型推断
    - ref需要显式指定泛型类型，reactive通常可以自动推断类型

## 简述vue3中Suspense组件是如何工作的
  - 基本结构：Suspense组件有两个插槽：default和fallback，default插槽用于渲染异步组件，fallback插槽用于渲染加载状态
  - 异步处理：Suspense会尝试渲染deafult插槽，如果遇到异步组件，会暂停渲染，直到异步组件加载完成，然后继续渲染
  - 加载状态：在异步加载期间，Suspense会渲染fallback插槽
  - 加载完成：一旦所有的异步操作完成，Suspense会重新渲染default插槽
  - 错误处理：如果在异步加载过程中发生错误，可以配合onErrorCaptured生命周期钩子来处理错误
## Teleport组件有什么作用
  - Teleport组件可以将组件的渲染位置移动到指定的DOM节点上，而不影响组件的逻辑结构
    ```vue
      <Teleport to="body">
        <div v-if="open" class="modal">
          <p>Hello from the modal!</p>
          <button @click="open = false">Close</button>
        </div>
      </Teleport>
    ```
## vue3如何优化性能
  - 响应式系统优化：使用proxy代替Object.defineProperty
  - 虚拟dom优化： 静态数提升将静态内容提升，减少渲染开销，静态属性提升将不会改变的属性标记，减少对比，patch flag标记动态内容只更新变化的函数
  - 编译优化：使用跟高效的编译策略，减少编译时间，基于模板的静态分析，减少运行时的开销
  - 按需加载：使用动态导入和异步组件实现按需加载
  - 使用v-once和v-memo来减少不必要的渲染
  - 合理使用computed和watch来减少不必要的计算
  - 使用shallowRef和shallowReactive来减少不必要的响应式
  - 使用keek-alive缓存组件
  - 虚拟列表
  - 使用web workers将耗时的计算操作放在web worker中执行
  - 使用tree-shaking来减少不必要的代码

## provide和reject是如何工作的
  - 父组件使用provide提供数据，子组件使用inject接收数据
  ```vue
    <!--父组件-->
    <script setup>
    import { provide } from 'vue'
    const updateMessage = (newmsg) => {
      console.log(newmsg)
    }
    privide('message', 'Hello, World')
    privide('updateMessage', updateMessage)
    </script>

    <!--子组件-->
    <script setup>
    import { inject } from 'vue'
    const message = inject('message')
    const updateMessage = inject('updateMessage')
    const changeMessage = () => {
      updateMessage('Hello, Vue')
    }
    </script>
  ```

## 简述vue3中如何实现响应式
  - vue3中使用Proxy和Reflect来实现响应式
  - Proxy可以监听对象的属性变化，Reflect可以实现对对象属性的操作
  - 使用Proxy监听对象的属性变化，使用Reflect实现对对象属性的操作
  - 具体工作原理
    - 1、创建响应式对象：使用reactive或者ref创建响应式对象
    - 2、创建proxy代理对象：使用Proxy监听对象的属性变化，使用Reflect实现对对象属性的操作
    - 3、依赖收集：当组件渲染时会访问响应式对象，vue会记录下该属性与当前组件之间的依赖关系
    - 4、触发更新：当响应式对象的属性被修改时会触发set拦截器，vue会通知依赖该属性的组件进行更新
    - 5、异步更新队列：vue会将更新操作放入异步更新队列中，多个更新会被合并，避免不必要的更新
    - 6、虚拟DOM重新渲染：组件重新渲染时会生成新的DOM树，vue会比较新旧DOM树的差异，只更新变化的部分
## vue3的自定义指令是如何定义的
  - vue3中的自定义指令由一个包含类似组件生命周期钩子的对象来定义。钩子函数会接收到指令所绑定元素作为其参数
  - 自定义指令的使用方式：
    ```javascript
      const myDirective = {
        // 在绑定元素的 attribute 前
        // 或事件监听器应用前调用
        created(el, binding, vnode) {
          // 下面会介绍各个参数的细节
        },
        // 在元素被插入到 DOM 前调用
        beforeMount(el, binding, vnode) {},
        // 在绑定元素的父组件
        // 及他自己的所有子节点都挂载完成后调用
        mounted(el, binding, vnode) {},
        // 绑定元素的父组件更新前调用
        beforeUpdate(el, binding, vnode, prevVnode) {},
        // 在绑定元素的父组件
        // 及他自己的所有子节点都更新后调用
        updated(el, binding, vnode, prevVnode) {},
        // 绑定元素的父组件卸载前调用
        beforeUnmount(el, binding, vnode) {},
        // 绑定元素的父组件卸载后调用
        unmounted(el, binding, vnode) {}
      }
    ```
  - 在vue应用中注册：
    ```javascript
      const app = createApp(App)
      app.directive('my-directive', myDirective)
      app.directive('my-directive', myDirective)
      app.mount('#app')
    ```
  - 自定义指令的使用方式：
    ```vue
      <div v-my-directive="value"></div>
    ```
## vue3中的路由和vue router4有哪些变化
  - 1、组合式API支持：提供了新的useRouter()和useRoute()函数来访问路由实例和当前路由信息
  - 2、引入了新的路由导航守卫：onBeforeRouteLeave()、onBeforeRouteUpdate()
  - 3、改进了typescript的支持
  - 4、动态路由增强：新增了addRoute方法用于动态添加路由，移除了router.match方法，改进了router.resolve方法
  - 5、命名子路由的变化：移除了children配置中的name属性，改为使用扁平化的路由名称
  - 6、<router-link>组件的变化：移除了tag属性，改用了v-soltAPI来自定义渲染，新增了custom属性，用于创建自定义导航
  - 7、改进的滚动行为：支持异步滚动
  - 8、移除了*通配符路由使用带有自定义正则的参数路由来代替
## vue3中的插槽和vue2中的有何不同
  - 1、vue3中统一使用v-slot(#)来定义插槽，vue2中使用slot和slot-scope来定义插槽
  - 2、vue3支持动态插槽
    ```vue
      <template v-slot:[SlotName]>
      </template>
    ```
  - 3、vue3引入了新的useSlots和useAttrs函数来访问插槽和属性
## vue3实现过渡动画
    ```vue
      <transition name="fade">
        <div v-if="show">Hello, World</div>
      </transition>
    ```
    ```css
      .fade-enter-active, .fade-leave-active {
        transition: opacity .5s;
      }
      .fade-enter-from, .fade-leave-to {
        opacity: 0;
      }

    ```
## vue3如何处理全局状态
  - 使用vuex来管理全局状态
    ```javascript
      import { createStore } from 'vuex'
      export default createStore({
        store: {
          count: 0
        },
        mutations: {
          increment(state) {
            state.count++
          }
        },
        actions: {
          increment({ commit }) {
            commit('increment')
          }
        }
      })

      // main.js
      import { createApp } from 'vue'
      import App from './App.vue'
      import store from './store'
      const app = createApp(App)
      app.use(store)
      app.mount('#app')

      // 使用
      <script setup>
        import { useStore } from 'vuex'
        const store = useStore()
        const count = computed(() => store.state.count)
        const increment = () => store.commit('increment')
      </script>
    ```
  - 使用pinia来管理全局状态
    ```javascript
      import { createApp } from 'vue'
      import { createPinia } from 'pinia'
      import App from './App.vue'
      const app = createApp(App)
      const pinia = createPinia()
      app.use(pinia)
      app.mount('#app')
      // store
      import { defineStore } from 'pinia'
      export const useCounterStore = defineStore('counter', {
        state: () => {
          return {
            count: 0
          }
        },
        getters: {
          doubleCount: (state) => state.count * 2
        },
        actions: {
          increment() {
            this.count++
          }
        },
        persist: {
          enabled: true,
          strategies: [
            {
              key: 'counter',
              storage: localStorage
            }
          ]
        }
      })
      // 使用
      <script setup>
      import { useCounterStore } from '@/store/counter'
      const counterStore = useCounterStore()
      const count = computed(() => counterStore.count)
      </script>
    ```
  - 使用响应式api中的reactive来管理全局状态
  - 使用provide和inject来管理全局状态
  - 使用自定义订阅发布模式来管理全局状态
## vue3中的Fragment是什么
  - vue3的新特性，包含多个根节点的模板被表示为一个片段(Fragment)，可以避免在模板中使用额外的根节点
## vue3如何支持Fragments
  ```vue
    <template>
      <div>1</div>
      <div>1</div>
      <div>1</div>
    </template>
  ```
## setup方法与setup语法糖有什么区别
  - 用法不同：
    ```javascript
      // setup语法糖
      <script setup></script>
      // setup方法
      <script>
      export default {
        setup() {
          // ...
        }
      }
      </script>
    ```
  - 返回值处理：setup方法需要显示的返回变量和方法，setup语法糖无需显示返回
  - props和context
    ```javascript
      // setup语法糖
      <script setup>
      const props = defineProps(...)
      const emit = defineEmits(...)
      const slots = defineSlots(...)
      </script>
      // setup方法
      <script>
      export default {
        setup(props, context) {}
      }
      </script>
    ```

## vue3实现混入
  ```vue
    <!--vue3-->
    <script setup>
      import { ref } from 'vue'

      const foo = ref(1)
      const bar = ref(2)

      onMounted(() => {
        console.log(foo.value) // 1
        console.log(bar.value) // 2
      })

      const useFoo = () => {
        return {
          foo
        }
      }

      const useBar = () => {
        return {
          bar
        }
      }
    </script>
  ```
  ```vue
    <script setup>
    import { useFoo, useBar } from './mixins'

    const foo = useFoo()
    const bar = useBar()
    </script>

  ```
  ```javascript
    // vue2
    export const myMixin = {
      data() {
        return {
          foo: 1,
          bar: 2
        }
      }
      method: {
        useFoo() {
          return this.foo
        },
        useBar() {
          return this.bar
        }
      }
      mounted() {
        console.log(this.useFoo()) // 1
        console.log(this.useBar()) // 2
      }
    }
    // 在组件中使用
    import {myMixin} from './mixin'
    export default {
      mixins: [myMixin]
    }
  ```
## vue3中的响应式系统如何处理循环引用的
  - 使用任务栈+清除任务+闭包+判断当前执行函数
  ```javascript
    let activeEffect
    const effectStack = []
    function effect(fn, options={}) {
      const effectFn = () => {
        cleanup(effectFn)
        activeEffect = effectFn
        effectStack.push(effectFn)
        const res = fn()
        effectStack.pop()
        return res
      }
      effectFn.options = options
      effectFn.deps = []
      if(!options.lazy) {
        effectFn()
      }
      return effectFn
    }
    function cleanup(effectFn) {
      for(let i = 0; i < effectStack.length; i++) {
        const deps = effectStack.deps[i]
        if(deps) {
          deps.delete(effectFn)
        }
      }
      effectStack.deps.length = 0
    }
  ```

## vue3中的ref指令有那些用途
  - 1、ref指令可以用来定义响应式数据
  - 2、ref指令可以用来定义组件实例
  - 3、ref指令可以用来定义组件实例的属性
  - 4、获取DOM元素
## vue3如何与web Components集成
  - 在vue中直接使用web Components
    ```vue
      <template>
        <my-web-component></my-web-component>
      </template>
    ```
    ```javascript
      import {defineCustomElemt} from 'vue'
      const MyVueComponent = {
        template: '<div>Hello, World</div>',
        props: ['message']
      }
      const MyWebComponent = defineCustomElement(MyVueComponent)
      customElements.define('my-web-component', MyWebComponent)
    ```

## vue3动态绑定属性v-bind（：）
  ```vue
    <template>
      <div :class="dynamicClass" :style="dynamicStyle">
        <img :src="imageUrl" :alt="imageAlt">
      </div>
    </template>

    <script setup>
    import { ref } from 'vue'

    const dynamicClass = ref('active')
    const dynamicStyle = ref({ color: 'red', fontSize: '16px' })
    const imageUrl = ref('path/to/image.jpg')
    const imageAlt = ref('Dynamic Image')
    </script>
  ```
## ref,toRef,toRefs
  - 用法如下
  ```vue
    import { ref, toRef, toRefs } from 'vue'
    const state = reactive({
      foo: 1,
      bar: 2
    })
    const fooRef = toRef(state, 'foo')
    const { foo, bar } = toRefs(state)
    
  ```
## vue3中的事件函数是什么
  - vue3中的事件函数是指用于处理各种事件的方法，这些事件可以是用户交互事件、生命周期事件、自定义事件等
  - 模板中的事件函数可以使用@符号来绑定，例如：
  ```vue
    <button @click="handleClick">Click Me</button>
    <input @input="handleInput"/>
  ```
  - 在setup中可以使用onMounted、onUpdated、onUnmounted等生命周期函数来处理事件，例如：
  ```vue
    <script setup>
    import { onMounted } from 'vue'
    const handleClick = () => {
      console.log('clicked')
    }
    onMounted(() => {
      document.addEventListener('click', handleClick)
    })
    </script>
  ```
  - 使用内联事件处理函数来处理事件，例如：
  ```vue
    <button @click="() => { console.log('clicked') }">Click Me</button>
  ```
  - 使用自事件修饰符
  ```vue
    <button @click.stop="handleClick">Click Me</button>
    <input @input.prevent="handleInput"/>
  ```
  - 使用自定义事件
  ```vue
    <template>
      <button @click="emitCustomEvent">Emit Event</button>
    </template>
    <script setup>
    const emit = defineEmits(['custom-event'])

    const emitCustomEvent = () => {
      emit('custom-event', 'Some data')
    }
    </script>
    <!--父组件-->
    <template>
      <MyComponent @custom-event="handleCustomEvent" />
    </template>
    <script setup>
    import MyComponent from './MyComponent.vue'

    const handleCustomEvent = (data) => {
      console.log(data) // Some data
    }
    </script>
  ```
  - 使用监听器watch
  ```vue
    <script setup>
    import { ref, watch } from 'vue'

    const count = ref(0)

    watch(count, (newValue, oldValue) => {
      console.log(`count changed from ${oldValue} to ${newValue}`)
    })
    </script>
  ```
  - 使用addEventListener
  ```vue
    <script setup>
    const handleClick = () => {
      console.log('clicked')
    }
    onMounted(() => {
      document.addEventListener('click', handleClick)
    })
    </script>
  ```
## 简述vue3中SetupContext函数详解-组件API的使用
  - 在vue3中，setup函数接收一个SetupContext参数，该参数是一个对象，包含了组件的props、attrs、slots、emit、expose等API
  - 例如：
  ```vue
    <script setup>
    import { ref, computed, onMounted, onUnmounted } from 'vue'

    const count = ref(0)
    const doubleCount = computed(() => count.value * 2)
    const props = defineProps({
      message: String
    })
    const emit = defineEmits(['increment'])
    defineExpose({
      doubleCount
    })

    onMounted(() => {
      console.log('mounted')
    })

    onUnmounted(() => {
      console.log('unmounted')
    })
    </script>
    <!--setup()函数中-->
    <script>
    export default {
      setup(props, {attrs, slots, emit, expose}) {
        console.log(props.message)
        console.log(attrs)
        console.log(slots.default)
        const handleClick = () => {
          emit('custom-click', 'Some data')
        }
        expose({
          handleClick
        })
        return {
          handleClick
        }
      }
    </script>
  ```
## computed函数
  ```vue
    <script setup>
    import { ref, computed } from 'vue'

    const count = ref(0)
    const doubleCount = computed(() => count.value * 2)

    function increment() {
      count.value++
    }
    const customComputed = computed({
      // getter会调用
      get: () => count.value * 2,
      // setter会调用
      set: (value) => {
        // 赋值的时候会调用
        count.value = value / 2
      }
    })
    const customCount = () => {
      // 触发setter
      customComputed.value = 10
    }
    </script>
  ```

## vue3异步函数详解应用
  - vue3中的异步函数应用主要涉及到几个方面：异步组件、异步数据获取、异步计算属性、异步生命周期钩子
  - 异步组件
    ```javascript
      import { defineAsyncComponent } from 'vue'
      const AsyncComponent = defineAsyncComponent(() => import('./AsyncComponent.vue'))
    ```
    ```vue
      <template>
        <Suspense>
          <template #default>
            <AsyncComponent />
          </template>
          <template #fallback>
            <div>Loading...</div>
          </template>
        </Suspense>
      </template>
    ```
  - 异步数据获取
    ```javascript
      import { ref, onMounted } from 'vue'
      const data = ref(null)
      onMounted(async () => {
        data.value = await fetchData()
      })
    ```
  - 异步计算属性
    ```javascript
      <script setup>
      import { ref, watch } from 'vue'

      const userId = ref(1)
      const userData = ref(null)

      watch(userId, async (newId) => {
        userData.value = null // 重置数据，表示加载中
        try {
          const response = await fetch(`https://api.example.com/users/${newId}`)
          userData.value = await response.json()
        } catch (error) {
          console.error('Failed to fetch user data:', error)
          userData.value = null
        }
      }, { immediate: true })
      </script>

    ```
## vue3中global函数详解：全局方法调用？
  - 使用app.config.globalProperties
    ```javascript
      import { createApp } from 'vue'
      const app = createApp({})
      app.config.globalProperties.$myGlobalMethod = () => {
        console.log('Global method called')
      }
      app.mount('#app')
    ```
    - 在组件中使用
      ```vue
        <script setup>
        import { getCurrentInstance } from 'vue'
        const { proxy } = getCurrentInstance()
        proxy.$myGlobalMethod()
        </script>
      ```
  - 使用provide/inject
    ```javascript
      import { createApp, provide, inject } from 'vue'
      const app = createApp({})
      app.provide('globalMethod', () => {
        console.log('Global method called')
      })
      app.mount('#app')
    ```
    - 在组件中使用
      ```vue
        <script setup>
        import { inject } from 'vue'
        const globalMethod = inject('globalMethod')
        globalMethod()
        </script>
      ```
  - 使用插件
    ```javascript
      export default {
        install: (app, options) => {
          app.config.globalProperties.$myGlobalMethod = () => {
            console.log('Global method called')
          }
        }
      }
      // 在main.js中使用
      import { createApp } from 'vue'
      import MyPlugin from './plugins/MyPlugin'
      import App from './App.vue'

      const app = createApp(App)
      app.use(MyPlugin)
      app.mount('#app')
    ```
    - 在组件中使用
      ```vue
        <script setup>
        import { getCurrentInstance } from 'vue'
        const { appContext } = getCurrentInstance()
        appContext.config.globalProperties.$myGlobalMethod()
        </script>
      ```
  - 使用hooks
    ```javascript
      export function useGlobalMethod() {
        const myGlobalMethod = () => {
          console.log('Global method called')
        }
        return {
          myGlobalMethod
        }
      }
    ```
  - 使用es6模块
    ```javascript
      export function globalMethod() {
        console.log('Global method called')
      }
    ```
    ```vue
      <script setup>
      import { globalMethod } from './global'
      globalMethod()
      </script>
    ```
## vue3中自动导入ElementPlus组件
  ```shell
    pnpm add unplugin-vue-components unplugin-auto-import -D
  ```
  ```javascript
    import { defineConfig } from 'vite'
    import AutoImport from 'unplugin-auto-import/vite'
    import Components from 'unplugin-vue-components/vite'
    import { ElementPlusResolver } from 'unplugin-vue-components/resolvers'
    
    export default defineConfig({
      plugins: [
        AutoImport({
          resolvers: [ElementPlusResolver()],
        }),
        Components({
          resolvers: [ElementPlusResolver()],
        }),
      ],
    })
  ```
  ```javascript
    // webpack.config.js
    const AutoImport = require('unplugin-auto-import/webpack')
    const Components = require('unplugin-vue-components/webpack')
    const { ElementPlusResolver } = require('unplugin-vue-components/resolvers')
    module.exports = {
      plugins: [
        AutoImport({
          resolvers: [ElementPlusResolver()],
        }),
        Components({
          resolvers: [ElementPlusResolver()],
        }),
      ],
    }
  ```
## vue3自动导入ant-design-vue组件
  ```javascript
    import { defineConfig } from 'vite'
    import vue from '@vitejs/plugin-vue'
    import { resolve } from 'path'
    import AutoImport from 'unplugin-auto-import/vite'
    import Components from 'unplugin-vue-components/vite'
    import { AntDesignVueResolver } from 'unplugin-vue-components/resolvers'

    // https://vite.dev/config/
    export default defineConfig({
      plugins: [
        vue(),
        AutoImport({ 
          /* options */ 
          include: [
            /\.[tj]sx?$/, // .ts, .tsx, .js, .jsx
            /\.vue$/,
            /\.vue\?vue/, // .vue
            /\.md$/, // .md
          ],
          imports: [
            // presets
            'vue',
            'vue-router',
            'pinia',
          ],
          dts: "src/auto-import.d.ts",
        }),
        Components({
          resolvers: [
            AntDesignVueResolver({
              importStyle: false, // css in js
            }),
          ],
        }),
      ],
      // 配置别名
      resolve: {
        alias: { //定义路径别名
          '@': resolve(__dirname, './src')
        }
      },
      // 打包配置
      build: {
        // 输出路径
        outDir: 'dist',
        // 打包后是否生成 source map 文件
        sourcemap: false,
        // 启用/禁用 CSS 代码拆分
        cssCodeSplit: true,
        // 依赖包提取到一个独立的文件
        rollupOptions: {
          // tree shaking
          treeshake: true,
          // 代码拆分
          output: {
            manualChunks(id) {
              if (id.includes('node_modules')) {
                return id.toString().split('node_modules/')[1].split('/')[0].toString();
              }
            }
          }
        }
      },
      // 服务配置
      server: {
        host: '0.0.0.0',
        port: 9527,
        proxy: {
          '/api': {
            // target: 'http://192.168.1.17:3000/',
            target: 'http://localhost:3000/',
            changeOrigin: true,
            rewrite: (path) => path.replace(/^\/api/, '')
          }
        }
      }
    })

  ```

## vue3中使用jsx
  ```shell
    pnpm add @vitejs/plugin-vue @vitejs/plugin-vue-jsx -D
  ```
  ```javascript
    import { defineConfig } from 'vite'
    import vue from '@vitejs/plugin-vue'
    import vueJsx from '@vitejs/plugin-vue-jsx'

    export default defineConfig({
      plugins: [
        vue(),
        vueJsx(),
      ],
    })
  ```
  ```jsx
    import { defineComponent } from 'vue'

    export default defineComponent({
      name: 'MyComponent',
      props: {
        message: String
      },
      setup(props) {
        return () => (
          <div>
            <h1>{props.message}</h1>
          </div>
        )
      }
    })

  ```

## vue3中的curried(柯里化)函数详解：更好的函数式编程方式？
  ```javascript
    function curry(fn) {
      return function curried(...args){
        if(args.length >= fn.length){
          return fn.apply(this, args)
        }else{
          return function(...args2){
            return curried.apply(this, args.concat(args2))
          }
        }
      }
    }
  ```
  ```vue
    <script setup>
    import { ref } from 'vue'

    const curry = (fn) => {
      return function curried(...args) {
        if (args.length >= fn.length) {
          return fn.apply(this, args);
        } else {
          return function(...args2) {
            return curried.apply(this, args.concat(args2));
          }
        }
      };
    }

    const add = (a, b, c) => a + b + c;
    const curriedAdd = curry(add);

    const result = ref(0);

    const calculate = () => {
      result.value = curriedAdd(1)(2)(3); // 6
    }
    </script>

    <template>
      <button @click="calculate">Calculate</button>
      <p>Result: {{ result }}</p>
    </template>

  ```

## vue3中的nextTick函数，如何处理DOM更新后的操作
  ```vue
    <script setup>
    import { ref, nextTick } from 'vue'

    const message = ref('Hello')

    const updateMessage = async () => {
      message.value = 'Updated'
      // 等待DOM更新完成后再执行下面的代码
      await nextTick()
      // DOM更新完成后执行的代码
      console.log('DOM updated')
    }
    </script>

  ```
## vue3中的proxy为什么一定要使用Reflect
  - Reflect是一个内置的对象，它提供了一些静态方法来操作对象，这些方法与Object上的方法类似，但是它们是不可枚举的，并且它们的参数和返回值都是Reflect对象，而不是Object对象。
  - Reflect可以正确处理this的绑定，而Object.defineProperty()不能正确处理this的绑定。
    ```javascript
      const obj = {
        bar: 1,
        get foo() {
          return this.bar;
        }
      } 
      const proxy = new Proxy(obj, {
        get(target,key, receiver) {
          return Reflect.get(target, key, receiver);
        }
      })
    ```
  - Reflect方法与对应的Object方法的参数和返回值相同，因此可以轻松地将Object方法替换为Reflect方法。
    ```javascript
      Object.defineProperty(obj, 'prop', { value: 1 });
      Reflect.defineProperty(obj, 'prop', { value: 1 });
    ```
  - Reflect方法可以正确处理继承和原型链
    ```javascript
      const obj = {
        foo: 1,
        bar: 2
      }
      const proxy = new Proxy(obj, {
        set(target, key, value, receiver) {
          return Reflect.get(target, key, value, receiver);
        }
      })
    ```
  - Reflect方法可以正确处理Symbol属性
    ```javascript
      const obj = {
        [Symbol('foo')]: 1
      }
      const proxy = new Proxy(obj, {
        get(target, key, receiver) {
          return Reflect.get(target, key, receiver);
        }
      })
    ```

## vue3中如何使用Supabase Auth方法？
  - 安装
    ```shell
      pnpm add @supabase/supabase-js
    ```
  - 初始化Supabase 客户端
    ```javascript
      // src/supabase.js
      import { createClient } from '@supabase/supabase-js'

      const supabaseUrl = 'YOUR_SUPABASE_PROJECT_URL'
      const supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY'

      export const supabase = createClient(supabaseUrl, supabaseAnonKey)
    ```
  - 使用hooks
    ```javascript
      // src/composables/useAuth.js
      import { ref } from 'vue'
      import { supabase } from '../supabase'

      export function useAuth() {
        const user = ref(null)

        // 检查当前会话
        const checkSession = async () => {
          const { data: { user: currentUser } } = await supabase.auth.getUser()
          user.value = currentUser
        }

        // 注册
        const signUp = async (email, password) => {
          const { data, error } = await supabase.auth.signUp({
            email,
            password,
          })
          if (error) throw error
          return data
        }

        // 登录
        const signIn = async (email, password) => {
          const { data, error } = await supabase.auth.signInWithPassword({
            email,
            password,
          })
          if (error) throw error
          user.value = data.user
          return data
        }

        // 登出
        const signOut = async () => {
          const { error } = await supabase.auth.signOut()
          if (error) throw error
          user.value = null
        }

        // 使用第三方提供商登录
        const signInWithProvider = async (provider) => {
          const { data, error } = await supabase.auth.signInWithOAuth({
            provider,
          })
          if (error) throw error
          return data
        }

        return {
          user,
          checkSession,
          signUp,
          signIn,
          signOut,
          signInWithProvider,
        }
      }

    ```
  - 使用
    ```vue
      <template>
        <div>
          <div v-if="user">
            Welcome, {{ user.email }}!
            <button @click="handleSignOut">Sign Out</button>
          </div>
          <div v-else>
            <input v-model="email" placeholder="Email" />
            <input v-model="password" type="password" placeholder="Password" />
            <button @click="handleSignIn">Sign In</button>
            <button @click="handleSignUp">Sign Up</button>
            <button @click="handleSignInWithGoogle">Sign In with Google</button>
          </div>
        </div>
      </template>

      <script setup>
      import { ref, onMounted } from 'vue'
      import { useAuth } from './composables/useAuth'

      const { user, checkSession, signIn, signUp, signOut, signInWithProvider } = useAuth()

      const email = ref('')
      const password = ref('')

      onMounted(async () => {
        await checkSession()
      })

      const handleSignIn = async () => {
        try {
          await signIn(email.value, password.value)
          console.log('Signed in successfully')
        } catch (error) {
          console.error('Error signing in:', error.message)
        }
      }

      const handleSignUp = async () => {
        try {
          await signUp(email.value, password.value)
          console.log('Signed up successfully')
        } catch (error) {
          console.error('Error signing up:', error.message)
        }
      }

      const handleSignOut = async () => {
        try {
          await signOut()
          console.log('Signed out successfully')
        } catch (error) {
          console.error('Error signing out:', error.message)
        }
      }

      const handleSignInWithGoogle = async () => {
        try {
          await signInWithProvider('google')
          console.log('Signed in with Google successfully')
        } catch (error) {
          console.error('Error signing in with Google:', error.message)
        }
      }
      </script>
    ```
  - 路由保护
    ```javascript
      // src/router.js
      import { createRouter, createWebHistory } from 'vue-router'
      import { supabase } from './supabase'

      const routes = [
        // ... 你的路由配置
      ]

      const router = createRouter({
        history: createWebHistory(),
        routes,
      })

      router.beforeEach(async (to, from, next) => {
        const { data: { user } } = await supabase.auth.getUser()
        if (to.meta.requiresAuth && !user) {
          next('/login')
        } else {
          next()
        }
      })

      export default router
    ```
  
## vue3中的全局函数主要是指可以在应用的任何地方使用的函数和方法
  - createApp
    ```javascript
      import { createApp } from 'vue'
      import App from './App.vue'

      const app = createApp(App)
      app.mount('#app')

    ```
  - app.component
    ```javascript
      import { createApp } from 'vue'
      import App from './App.vue'
      import MyComponent from './components/MyComponent.vue'

      const app = createApp(App)
      app.component('MyComponent', MyComponent)
      app.mount('#app')

    ```
  - app.directive
    ```javascript
      app.directive('focus', {
        mounted(el) {
          el.focus()
        }
      })
    ```
  - aap.use
    ```javascript
      import { createApp } from 'vue'
      import App from './App.vue'
      import router from './router'

      const app = createApp(App)
      app.use(router)
      app.mount('#app')

    ```
  - app.mixin
    ```javascript
      import { createApp } from 'vue'
      import App from './App.vue'
      import mixin from './mixin'

      const app = createApp(App)
      app.mixin(mixin)
      app.mount('#app')

    ```
  - app.provide
    ```javascript
      // 在根组件
      app.provide('key', 'value')

      // 在任何子组件
      import { inject } from 'vue'
      const value = inject('key')

    ```

## 使用vue3+ts+axios+pinias实现无感刷新
  - 1.安装
    ```shell
      pnpm add axios pinia
    ```
  - 2.创建axios实例
    ```javascript
      // src/utils/axios.ts
      import axios, { AxiosInstance } from 'axios';

      const axiosInstance: AxiosInstance = axios.create({
        baseURL: 'https://api.example.com',
        timeout: 5000,
      });

      export default axiosInstance;
    ```
  - 3.创建store
    ```javascript
      // src/stores/auth.ts
      import { defineStore } from 'pinia';
      import axiosInstance from '@/utils/axios';

      interface AuthState {
        accessToken: string | null;
        refreshToken: string | null;
      }

      export const useAuthStore = defineStore('auth', {
        state: (): AuthState => ({
          accessToken: localStorage.getItem('accessToken'),
          refreshToken: localStorage.getItem('refreshToken'),
        }),
        actions: {
          setTokens(accessToken: string, refreshToken: string) {
            this.accessToken = accessToken;
            this.refreshToken = refreshToken;
            localStorage.setItem('accessToken', accessToken);
            localStorage.setItem('refreshToken', refreshToken);
          },
          clearTokens() {
            this.accessToken = null;
            this.refreshToken = null;
            localStorage.removeItem('accessToken');
            localStorage.removeItem('refreshToken');
          },
          async refreshTokens() {
            try {
              const response = await axiosInstance.post('/refresh', {
                refreshToken: this.refreshToken,
              });
              const { accessToken, refreshToken } = response.data;
              this.setTokens(accessToken, refreshToken);
              return accessToken;
            } catch (error) {
              this.clearTokens();
              throw error;
            }
          },
        },
      });

    ```
  - 创建响应拦截器
    ```javascript
      // src/utils/axios.ts
      import axios, { AxiosInstance, AxiosError, AxiosRequestConfig, AxiosResponse } from 'axios';
      import { useAuthStore } from '@/stores/auth';

      const axiosInstance: AxiosInstance = axios.create({
        baseURL: 'https://api.example.com',
        timeout: 5000,
      });

      axiosInstance.interceptors.request.use(
        (config: AxiosRequestConfig) => {
          const authStore = useAuthStore();
          if (authStore.accessToken) {
            config.headers = config.headers || {};
            config.headers['Authorization'] = `Bearer ${authStore.accessToken}`;
          }
          return config;
        },
        (error: AxiosError) => {
          return Promise.reject(error);
        }
      );

      axiosInstance.interceptors.response.use(
        (response: AxiosResponse) => {
          return response;
        },
        async (error: AxiosError) => {
          const originalRequest = error.config;
          if (error.response?.status === 401 && !originalRequest._retry) {
            originalRequest._retry = true;
            const authStore = useAuthStore();
            try {
              const newAccessToken = await authStore.refreshTokens();
              originalRequest.headers['Authorization'] = `Bearer ${newAccessToken}`;
              return axiosInstance(originalRequest);
            } catch (refreshError) {
              // 刷新令牌失败，可能需要重新登录
              authStore.clearTokens();
              // 重定向到登录页面或显示登录弹窗
              return Promise.reject(refreshError);
            }
          }
          return Promise.reject(error);
        }
      );

      export default axiosInstance;
    ```
  - 使用
    ```javascript
      <script setup lang="ts">
      import { ref, onMounted } from 'vue';
      import axiosInstance from '@/utils/axios';
      import { useAuthStore } from '@/stores/auth';

      const authStore = useAuthStore();
      const data = ref(null);

      const fetchData = async () => {
        try {
          const response = await axiosInstance.get('/protected-route');
          data.value = response.data;
        } catch (error) {
          console.error('Error fetching data:', error);
        }
      };

      onMounted(() => {
        fetchData();
      });
      </script>

      <template>
        <div>
          <h1>Protected Data</h1>
          <pre>{{ data }}</pre>
        </div>
      </template>
    ```

## vue3页面加载完之后获取宽度和高度
  ```vue
    <template>
      <div ref="containerRef">
        <h1>页面内容</h1>
        <p>宽度: {{ width }}px</p>
        <p>高度: {{ height }}px</p>
      </div>
    </template>

    <script setup lang="ts">
    import { ref, onMounted, nextTick } from 'vue';

    // 创建一个 ref 来引用 DOM 元素
    const containerRef = ref<HTMLElement | null>(null);

    // 创建 refs 来存储宽度和高度
    const width = ref(0);
    const height = ref(0);

    // 定义一个函数来更新尺寸
    const updateSize = () => {
      if (containerRef.value) {
        width.value = containerRef.value.offsetWidth;
        height.value = containerRef.value.offsetHeight;
      }
    };

    // 使用 onMounted 钩子
    onMounted(() => {
      // 使用 nextTick 确保 DOM 已经完全更新
      nextTick(() => {
        updateSize();

        // 添加窗口 resize 事件监听器，以便在窗口大小变化时更新尺寸
        window.addEventListener('resize', updateSize);
      });
    });

    // 可选：在组件卸载时移除事件监听器
    onUnmounted(() => {
      window.removeEventListener('resize', updateSize);
    });
    </script>

  ```

## 封装粘性组件
  ```vue
    <template>
      <div ref="stickyContainer" :style="containerStyle">
        <div ref="stickyElement" :style="elementStyle">
          <slot></slot>
        </div>
      </div>
    </template>

    <script>
    import { ref, onMounted, onUnmounted, computed } from 'vue'

    export default {
      name: 'StickyComponent',
      props: {
        offsetTop: {
          type: Number,
          default: 0
        },
        zIndex: {
          type: Number,
          default: 1000
        }
      },
      setup(props) {
        const stickyContainer = ref(null)
        const stickyElement = ref(null)
        const isSticky = ref(false)
        const originalTop = ref(0)

        const containerStyle = computed(() => ({
          position: 'relative'
        }))

        const elementStyle = computed(() => ({
          position: isSticky.value ? 'fixed' : 'relative',
          top: isSticky.value ? `${props.offsetTop}px` : 'auto',
          zIndex: isSticky.value ? props.zIndex : 'auto',
          width: isSticky.value ? `${stickyContainer.value.offsetWidth}px` : 'auto'
        }))

        const checkPosition = () => {
          if (!stickyContainer.value || !stickyElement.value) return

          const containerRect = stickyContainer.value.getBoundingClientRect()
          const elementRect = stickyElement.value.getBoundingClientRect()

          if (containerRect.top <= props.offsetTop) {
            if (!isSticky.value) {
              isSticky.value = true
              originalTop.value = containerRect.top + window.pageYOffset
            }
          } else {
            isSticky.value = false
          }

          if (isSticky.value) {
            const bottomOfContainer = originalTop.value + containerRect.height
            const bottomOfSticky = window.pageYOffset + elementRect.height + props.offsetTop
            if (bottomOfSticky >= bottomOfContainer) {
              stickyElement.value.style.top = `${bottomOfContainer - bottomOfSticky + props.offsetTop}px`
            } else {
              stickyElement.value.style.top = `${props.offsetTop}px`
            }
          }
        }

        onMounted(() => {
          window.addEventListener('scroll', checkPosition)
          window.addEventListener('resize', checkPosition)
          checkPosition()
        })

        onUnmounted(() => {
          window.removeEventListener('scroll', checkPosition)
          window.removeEventListener('resize', checkPosition)
        })

        return {
          stickyContainer,
          stickyElement,
          containerStyle,
          elementStyle
        }
      }
    }
    </script>
  ```
  ```javascript
    import StickyComponent from './StickyComponent.vue'

    export default {
      install: (app, options) => {
        // 全局注册 StickyComponent
        app.component('StickyComponent', StickyComponent)

        // 添加一个全局指令 v-sticky
        app.directive('sticky', {
          mounted(el, binding) {
            const offsetTop = binding.value || 0
            const stickyContainer = document.createElement('div')
            const stickyElement = document.createElement('div')
            
            el.parentNode.insertBefore(stickyContainer, el)
            stickyContainer.appendChild(stickyElement)
            stickyElement.appendChild(el)

            let isSticky = false
            let originalTop = 0

            const checkPosition = () => {
              const containerRect = stickyContainer.getBoundingClientRect()
              const elementRect = stickyElement.getBoundingClientRect()

              if (containerRect.top <= offsetTop) {
                if (!isSticky) {
                  isSticky = true
                  originalTop = containerRect.top + window.pageYOffset
                  Object.assign(stickyElement.style, {
                    position: 'fixed',
                    top: `${offsetTop}px`,
                    width: `${containerRect.width}px`,
                    zIndex: '1000'
                  })
                }
              } else {
                isSticky = false
                Object.assign(stickyElement.style, {
                  position: 'relative',
                  top: 'auto',
                  width: 'auto',
                  zIndex: 'auto'
                })
              }

              if (isSticky) {
                const bottomOfContainer = originalTop + containerRect.height
                const bottomOfSticky = window.pageYOffset + elementRect.height + offsetTop
                if (bottomOfSticky >= bottomOfContainer) {
                  stickyElement.style.top = `${bottomOfContainer - bottomOfSticky + offsetTop}px`
                } else {
                  stickyElement.style.top = `${offsetTop}px`
                }
              }
            }

            window.addEventListener('scroll', checkPosition)
            window.addEventListener('resize', checkPosition)
            checkPosition()

            // 清理函数
            el._stickyCleanup = () => {
              window.removeEventListener('scroll', checkPosition)
              window.removeEventListener('resize', checkPosition)
            }
          },
          unmounted(el) {
            if (el._stickyCleanup) {
              el._stickyCleanup()
            }
          }
        })
      }
    }

  ```
  ```javascript
    import { createApp } from 'vue'
    import App from './App.vue'
    import StickyPlugin from './sticky-plugin'

    const app = createApp(App)
    app.use(StickyPlugin)
    app.mount('#app')

  ```

## webpack的工作流程
  - 1.初始化参数
    - 从配置文件(webpack.config.js)和shell语句中读取与合并参数
    - 得出最终的配置对象
  - 2.开始编译
    - 初始化compiler对象
    - 加载所有配置的插件
    - 执行compiler对象的run方法
  - 3.确定入口文件
    - 根据配置文件中entry找出所有的入口文件
  - 4.编译模块
    - 从入口文件出发，调用所有配置的loadar对模块进行翻译
    - 找出模块的依赖模块，递归执行，直到所有入口依赖的文件都进过了这个步骤
  - 5.完成模块编译
    - 使用loader翻译完所有模块后，得到每个模块被翻译后的内容以及它们的依赖关系
  - 6.输出资源
    - 根据入口和模块之间的依赖关系，组成一个个包含多个模块的chunk
    - 再把每个chunk转换为一个单独的文件加到输出列表
  - 7.输出完成
    - 确定好输出内容后，根据配置确定输出的路径和文件名，把文件写入到文件系统