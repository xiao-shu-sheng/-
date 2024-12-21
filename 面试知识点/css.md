## display: none 和 overflow: hidden 隐藏的区别: 
  - 隐藏方式:
    - display: none:
      -  完全隐藏：元素从渲染树中移除，相当于该元素不存在，不会占据页面空间
      -  子元素继承：子元素也会被隐藏，无法通过任何方式（如脚本）访问这些元素的尺寸或位
      -  不会响应事件：因为该元素被移除，无法触发鼠标或键盘事件
      overflow: hidden
      -  裁剪隐藏：元素仍然存在，只是超出容器范围的部分不可见
      -  占据空间：隐藏的内容之外的部分仍然占据页面布局空间
      -  子元素未移除：隐藏的子元素仍在 DOM 中，可以通过脚本获取它们的位置、尺寸等属性
  - 对布局的影响:
    - display: none
      - 对父级和兄弟元素的布局会有直接影响，类似于该元素从页面中移除
    - overflow: hidden
      - 对父级和兄弟元素没有任何影响，仅隐藏超出范围的部分，仍保留元素的宽高和布局

    - 触发重排的区别
      - display: none
        - 触发重排：因为该属性会影响布局，导致元素从渲染树中移除
      - overflow: hidden
        - 可能触发重排：仅当 overflow: hidden 改变了布局（如内容超出隐藏后导致高度变化），才会触发重排
        如果没有改变布局，仅隐藏内容时，只会触发重绘

  - 相同点：
    - 视觉上都能实现隐藏的效果
    - 无论使用 display: none 还是 overflow: hidden，隐藏的元素仍然存在于 DOM 树中，可以通过脚本（如 document.querySelector）访问

  - visibility: hidden
    - 作用对象
      - 影响元素本身的可见性
    - 原理
      - 当设置 visibility: hidden 时，元素仍然参与页面的文档流和布局计算，保留占位，只是不会被渲染到屏幕上
      - 它的行为是通过改变元素的“可见性状态”，使浏览器在渲染阶段跳过该元素的绘制
      - 元素仍然存在于 渲染树 和 DOM 树 中，可以通过脚本访问，也会响应部分事件（如 transition）

  - 重排（Reflow）：
    - 重排是指当页面布局或几何属性发生变化时，浏览器需要重新计算布局，导致页面重新渲染
  - 重绘（Repaint）
    - 重绘是指页面的外观发生变化，但布局未改变。

## 盒子模型
  - 盒子模型是 CSS 中的一个基础概念，每个 HTML 元素都可以被视为一个盒子，盒子模型定义了这些元素的内容、内边距、边框和外边距
  - 标准盒模型和 IE 盒模型
    - 标准盒模型：width/height 只是内容高度，不包含 padding 和 border值
      - 盒子宽度 = 内容宽度 + 内边距 + 边框 + 外边距
      ```css
        .content-box {
          box-sizing: content-box; /* 标准盒模型 */
        }
      ```
    - IE 盒模型：width/height 包含了 padding和 border值
      - 盒子宽度 = 内容宽度 + 内边距 + 边框
      - 盒子高度 = 内容高度 + 内边距 + 边框
      ```css
        .content-box {
          box-sizing: content-box; /* 标准盒模型 */
        }
      ```
## css选择器
  - 选择器的种类
    - id选择器（#box），选择id为box的元素
    - 类选择器（.one），选择类名为one的所有元素
    - 标签选择器（div），选择标签为div的所有元素
    - 属性选择器 （a[href]），选择带有href属性的a元素
    - 伪类选择器 （a:hover），选择鼠标悬停在a元素上的状态
    - 伪元素选择器 （::before），选择元素的某个部分
  - 优先级
    - 内联样式 > id选择器 > 类选择器 > 标签选择器 > 通配符选择器 > 继承的样式
## css 布局
  - 流式布局：css 布局的默认方式，元素按照从上到下，从左到右的顺序排列，元素之间没有任何间隙
  - 浮动布局：元素浮动到页面的左边或右边
    ```css
      .left {
        float: left;
        width: 50%;
      }

      .right {
        float: right;
        width: 50%;
      }

      /* 清除浮动 */
      .clearfix::after {
        content: "";
        display: table;
        clear: both;
      }
    ```
  - 定位布局：元素通过绝对定位或相对定位，使元素脱离文档流，并调整元素的位置
  - 弹性布局：元素通过 flex 布局，使元素在页面中占据一定的空间，并调整元素的位置和大小
  - 网格布局：元素通过 grid 布局，将页面划分为多个网格，并调整元素的位置和大小
    ```css
      .container {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
      }

      .item {
        grid-column: span 2;
      }
    ```
  - 多列布局：元素通过 column 布局，将页面划分为多个列，并调整元素的位置和大小
    ```css
      .container {
        column-count: 3;
        column-gap: 20px;
      }
    ```
  - 响应式布局：元素通过媒体查询，根据不同的屏幕大小，调整元素的位置和大小
    ```css
      .container {
        width: 100%;
        padding: 20px;
      }

      @media (min-width: 768px) {
        .container {
          width: 750px;
          margin: 0 auto;
        }
      }

      @media (min-width: 1024px) {
        .container {
          width: 960px;
        }
      }
    ```
  - Sticky 定位: 元素通过 sticky 定位，使元素在页面中固定位置，当元素到达指定位置时，元素会固定在页面中，不再随着页面滚动
  - Table 布局: 元素通过 table 布局，将页面划分为多个表格，并调整元素的位置和大小

## em、px、rem、vh、vw的区别
  - em：相对于当前元素的字体大小
  - px：像素，绝对单位
  - rem：相对于根元素的字体大小
  - vh：相对于视口高度的百分比
  - vw：相对于视口宽度的百分比

## css中隐藏元素
  - 使用visibility: hidden; 隐藏元素，元素仍然占据空间，但不可见
  - 使用display: none; 隐藏元素，元素从渲染树中移除，不再占据空间
  - 使用opacity: 0; 隐藏元素，元素仍然占据空间，但透明度为0，不可见
  - 使用width: 0; height: 0; 
  - 使用position: absolute; 隐藏元素，元素从渲染树中移除，不再占据空间
  - clip-path: polygon(0 0, 0 0, 0 0, 0 0); 隐藏元素，元素不可见，占据页面空间，无法响应点击事件

## BFC
  - BFC（Block Formatting Context）块级格式化上下文，是 CSS 中的一个概念，它是页面中的一块渲染区域，并且有一套属于自己的渲染规则：
    - 内部的盒子会在垂直方向上一个接一个的放置
    - 对于同一个BFC的俩个相邻的盒子的margin会发生重叠，与方向无关
    - 每个元素的左外边距与包含块的左边界相接触（从左到右），即使浮动元素也是如此
    - BFC的区域不会与float的元素区域重叠
    - 计算BFC的高度时，浮动子元素也参与计算
    - BFC就是页面上的一个隔离的独立容器，容器里面的子元素不会影响到外面的元素，反之亦然

## 水平垂直居中方法
  - 利用定位 + margin: auto
    ```css
      .parent {
        position: relative;
        height: 100vh;
      }

      .child {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        width: 200px;
        height: 100px;
        margin: auto;
      }

    ```
  - 利用定位 + 负边距：知道子元素的尺寸，可以使用负边距
    ```css
      .parent {
        position: relative;
        height: 100vh;
      }

      .child {
        position: absolute;
        top: 50%;
        left: 50%;
        width: 200px;
        height: 100px;
        margin-top: -50px; /* 高度的一半 */
        margin-left: -100px; /* 宽度的一半 */
      }
    ```
  - 利用定位 + transform：子元素尺寸未知的情况
    ```css
      .parent {
        position: relative;
        height: 100vh;
      }

      .child {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
      }
    ```
  - table布局
    ```css
      .parent {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh; /* 确保父容器有足够的高度 */
      }
    ```
  - flex布局
    ```css
      .parent {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh; /* 确保父容器有足够的高度 */
      }
    ```
  - grid布局
    ```css
      .parent {
        display: grid;
        place-items: center;
        height: 100vh; /* 确保父容器有足够的高度 */
      }
    ```
  - calc() 函数
    ```css
      .parent {
        position: relative;
        height: 100vh;
      }

      .child {
        position: absolute;
        top: calc(50% - 50px);  /* 50px 是元素高度的一半 */
        left: calc(50% - 100px);  /* 100px 是元素宽度的一半 */
        width: 200px;
        height: 100px;
      }

    ```
## css新增特性
  - 选择器
    - :first-of-type 选择某个类型的第一个元素
    - :last-of-type 选择某个类型的最后一个元素
    - :only-of-type 选择某个类型的唯一一个元素
    - :only-child 选择某个类型的唯一一个元素
    - :nth-child(n) 选择某个类型的第n个元素
    - :nth-last-child(n) 选择某个类型的倒数第n个元素
    - :nth-of-type(n) 选择某个类型的第n个元素
    - :nth-last-of-type(n) 选择某个类型的倒数第n个元素
  - 样式
    - 边框属性：border-radius、box-shadow、border-image
    - box-shadow
    - 背景属性：background-image、background-size、background-position、background-repeat、background-attachment、background-origin、background-clip
    - 文字属性：text-overflow、text-shadow、text-align、text-align-last、text-justify、text-indent、text-transform、text-decoration、text-decoration-line、text-decoration-style、text-decoration-color、text-decoration-skip-ink、text-underline-position、text-emphasis、text-emphasis-style、text-emphasis-color、text-emphasis-position、text-emphasis-position
  - transition过度：过渡效果、持续时间
    ```css
      transition： CSS属性，花费时间，效果曲线(默认ease)，延迟时间(默认0)
    ```
  - transform: transform-origin、transform-style、transform-function
  - animation: animation-name、animation-duration、animation-timing-function、animation-delay、animation-iteration-count、animation-direction、animation-fill-mode、animation-play-state、animation-name、animation-duration、animation-timing-function、animation-delay、animation-iteration-count、animation-direction、animation-fill-mode、animation-play-state
  - 渐变：linear-gradient、radial-gradient、repeating-linear-gradient、repeating-radial-gradient

## CSS动画
  - transition：过渡效果，持续时间，效果曲线，延迟时间
  - animation：动画名称，持续时间，效果曲线，延迟时间，播放次数，是否反向播放，是否暂停动画
  - transform：旋转、缩放、移动、倾斜

## css优化
  - 内联首屏关键CSS
  - 异步加载CSS
  - 资源压缩
  - 不要使用@import

## 单行文本超出省略
  ```css
    .ellipsis {
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
  ```
## 滚动视差
  - background-attachment：作用是设置背景图像是否固定或者随着页面的其余部分滚动
    - scroll：默认值，背景图像会随着页面其余部分的滚动而移动
    - fixed：当页面的其余部分滚动时，背景图像不会移动
    - inherit：继承父元素background-attachment属性的值
  - transform：translate3d(x, y, z) 函数用于将元素移动到三维空间中的指定位置

## css绘制三角形
  - 使用边框实现
    ```css
      .border {
        width: 0;
        height: 0;
        border-style:solid;
        border-width: 0 50px 50px;
        border-color: transparent transparent #d9534f;
      }
    ```
  - 使用clip-path
    ```css
      .triangle {
        width: 100px;
        height: 100px;
        background-color: #000;
        clip-path: polygon(50% 0%, 0% 100%, 100% 100%);
      }
    ```
## css预编译
  - less
  - sass
  - stylus

## css灰度
  - 使用filter: grayscale(100%) 实现


## css绘制梯形
  - 使用border实现
  ```css
    .trapezoid {
      width: 0;
      height: 0;
      border-left: 50px solid transparent; /* 左边透明 */
      border-right: 50px solid transparent; /* 右边透明 */
      border-bottom: 100px solid #4CAF50; /* 下边实色 */
    }
  ```
  - 使用clip-path实现
  ```css
    .trapezoid {
      width: 100px;
      height: 100px;
      background-color: #4CAF50;
      clip-path: polygon(20% 0%, 80% 0%, 100% 100%, 0% 100%);
    }
  ```