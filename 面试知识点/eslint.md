## 简单配置
```javascript
module.exports = {
  root: true,
  parserOptions: {
    parser: 'babel-eslint',
    sourceType: 'module'
  },
  env: {
    browser: true,
    node: true,
    es6: true,
  },
  extends: ['plugin:vue/recommended', 'eslint:recommended'],

  // add your custom rules here
  // it is base on https://github.com/vuejs/eslint-config-vue
  // 文档查阅地址https://nodejs.cn/eslint/，可根据自己的习惯进行设置
  // '0' 或 'off': 表示禁用规则，不会发出任何警告或错误
  // '1' 或 'warn': 表示启用规则，它将发出警告，但不会阻止代码的执行。
  // '2' 或 'error': 表示启用规则，并且它将发出错误，如果违反规则，代码执行将会失败
  rules: {
    /** 
    * 控制 Vue 单文件组件中 HTML 标签的属性分布，以确保一致的代码风格和可读性
    * [2, { ... }]：这是规则的配置，其中 2 表示启用此规则并将它视为错误（error）。你也可以将 2 替换为 'error'，效果相同。
    * "singleline"：这是一个配置对象，用于指定单行 HTML 标签的属性的最大数量。在单行情况下，允许最多 10 个属性
    * "multiline"：这是另一个配置对象，用于指定多行 HTML 标签的属性的分布。它有两个属性：
    * "max"：指定多行标签的属性的最大数量。在多行情况下，允许最多 1 个属性在每一行
    * "allowFirstLine"：一个布尔值，指定是否允许多行标签的第一行包含属性。如果设置为 false，则第一行应该只包含标签的名称，而没有属性
    */
    "vue/max-attributes-per-line": [2, {
      "singleline": 10,
      "multiline": {
        "max": 1,
        "allowFirstLine": false
      }
    }],
    /**
     * 用于控制在 Vue.js 单行 HTML 元素的内容中是否需要添加换行符
     * "always"（默认）：表示始终需要在单行 HTML 元素的内容中添加换行符。这意味着单行 HTML 元素的内容应该分为多行，每行包含一个元素
     * "never"：表示不需要在单行 HTML 元素的内容中添加换行符。这允许单行 HTML 元素的内容保持在同一行上
     * "ignore"：表示忽略此规则，不强制添加或删除换行符
     */
    "vue/singleline-html-element-content-newline": "off",
    /**
     * 用于控制 Vue.js 单文件组件（.vue 文件）中多行 HTML 元素内容的换行格式
     * 'vue/multiline-html-element-content-newline': [
      'error',
      {
        // 可选的配置选项
        // 'always' 表示在多行元素的开始和结束标签之间始终添加换行
        // 'never' 表示不在多行元素的开始和结束标签之间添加换行
        // 'always' 和 'never' 是两个可选的值
        'always': {
          'except': ['pre', 'textarea'], // 在指定的元素中除外，不强制添加换行
        },
        'never': {
          'except': ['pre', 'textarea'], // 在指定的元素中除外，不强制不添加换行
        },
      },
    ],
     */
    "vue/multiline-html-element-content-newline":"off",
    /**
     * 用于检查 Vue 组件的名称属性（name property）的命名规范
     * ['error', 'PascalCase']：这是 "vue/name-property-casing" 规则的配置选项。
     * 它指定了规则的严重程度（error 表示错误）以及期望的名称属性命名规范规则期望 Vue 
     * 组件的名称属性采用 PascalCase 命名规范，即每个单词的首字母都大写，单词之间没有
     * 空格或特殊字符。
     */
    "vue/name-property-casing": ["error", "PascalCase"],
    /**
     * 强制要求开发者不应该在模板中使用 v-html 指令，以避免潜在的安全风险和 XSS 攻击
     */
    "vue/no-v-html": "off",
    /**
     * 用于确保对象中的 setter 和 getter 函数是成对出现的
     * '0' 或 'off': 表示禁用规则，不会发出任何警告或错误
     * '1' 或 'warn': 表示启用规则，它将发出警告，但不会阻止代码的执行。
     * '2' 或 'error': 表示启用规则，并且它将发出错误，如果违反规则，代码执行将会失败
     */
    'accessor-pairs': 2,
    /**
     * 用于检查箭头函数的前后空格
     * 用法eslint arrow-spacing: ["error", { "before": false, "after": true }]
     */
    /* 'arrow-spacing': [2, {
      'before': true,
      'after': true
    }], */
    'arrow-spacing': 'off',
    /**
     * 用于检查代码块（即大括号 {}）内的间距是否符合一致的规范
     */
    // 'block-spacing': [2, 'always'],
    'block-spacing': 'off',
    /**
     * brace-style: ['error', 'stroustrup', { 'allowSingleLine': true }]
     * 用于定义大括号的风格，即大括号的位置应该如何排列。你可以为该规则添加注释以指定特定区块的大括号风格
     * "1tbs"，表示"1TBS" 风格（即一种大括号放在控制结构关键字后，然后在下一行开始新的代码块）
     * Allman 风格，其中大括号在控制结构关键字的同一行内，然后单独占用一行
     * Stroustrup 风格是一种将大括号放在控制结构关键字的同一行，并在同一行内开始新的代码块
     */
    'brace-style': [2, '1tbs', {
      'allowSingleLine': true
    }],
    /**
     * 于强制或禁止变量和对象属性的命名风格必顩遵循驼峰命名规则
     */
    'camelcase': [0, {
      'properties': 'always' // 对象属性的命名必须使用驼峰命名规则: 即首字母小写，后续单词的首字母大写。
    }],
    /**
     * comma-dangle 规则有三个选项,用于控制对象字面量、数组字面量以及函数参数中的末尾逗号（或称为拖尾逗号）
     * "always"：要求在对象字面量、数组字面量和函数参数的末尾使用逗号。这意味着最后一项后面必须有逗号
     * "always-multiline"：与 "always" 类似，但只在多行情况下要求逗号。单行对象字面量和数组字面量可以不使用逗号
     * "never"：禁止在对象字面量、数组字面量和函数参数的末尾使用逗号
     */
    // 'comma-dangle': [2, 'never'],
    'comma-dangle': 'off',
    /**
     * 用于控制逗号后的空格规则的规则（rule）
     * "comma-spacing": ["error", { "before": false, "after": true }]
     */
    /* 'comma-spacing': [2, {
      'before': false,
      'after': true
    }], */
    'comma-spacing': 'off',
    /**
     * 用于检测在 JavaScript 代码中逗号的使用风格
     * always（默认值）：强制逗号总是在行末。这是 JavaScript 的常用风格
     * first：强制逗号总是在行首。这是一种不太常见的风格
     * last：强制逗号在行末，但允许在行首的逗号。这也是一种不太常见的风格
     */
    'comma-style': [2, 'last'],
    /**
     * 用于检查类的构造函数（constructor）中是否正确使用了super关键字
     * 确保在一个子类（派生类）的构造函数中正确调用父类（基类）的构造函数，以确保正确初始化继承的属性
     */
    'constructor-super': 2,
    /**
     * 用于检查条件语句（if、else if、else、while、for）是否使用了花括号（curly braces）来包裹代码块
     */
    'curly': [2, 'multi-line'], // multi-line只会检查多行条件语句
    /**
     * 用于控制成员表达式中的点操作符的位置，也就是决定成员表达式中的点操作符(.)应该放在一行的开始还是一行的末尾
     * eslint dot-location: ["error", "object"]：将点操作符放在对象上
     * eslint dot-location: ["error", "property"]：将点操作符放在属性上
     */
    'dot-location': [2, 'property'],
    /**
     * 用于检测文件末尾是否有空白行（换行符）
     * 强制要求文件末尾必须有一个换行符（always）
     * 禁止在文件末尾添加换行符（never）
     */
    // 'eol-last': 2,
    'eol-last': 'off',
    /**
     * 强制要求使用恒等运算符（=== 和 !==）而不是相等运算符（== 和 !=）
     * "always"：这是 eqeqeq 规则的第二个参数，它表示要求始终使用恒等运算符（=== 和 !==）
     * 而不是相等运算符（== 和 !=）。这将强制要求比较时不仅比较值，还比较类型
     * {"null": "ignore"}：这是配置对象，它允许你指定特定的选项，以及如何处理 null 值的比较。
     * 在这个配置中，null 设置为 "ignore"，这意味着在比较 null 值时，可以使用相等运算符而不会触发警告
     */
    // 'eqeqeq': ["warning", "always", {"null": "ignore"}],
    'eqeqeq': 'off',
    /**
     * 用于强制在生成器函数中的 *（星号）前后设置空格
     */
    /* 'generator-star-spacing': [2, {
      'before': true,
      'after': true
    }], */
    'generator-star-spacing': 'off',
    /**
     * 用于强制执行回调函数中的错误参数
     */
    'handle-callback-err': [2, '^(err|error)$'],
    /**
     * 缩进规则
     * 第一个元素 2 表示缩进的错误级别。在 ESLint 中，错误级别有三种选择：0（禁用错误），1（警告级别），2（错误级别）
     * 第二个元素 2 表示要使用的缩进量
     * 第三个元素 { 'SwitchCase': 1 } 是一个配置对象，指定了不同情况下的缩进规则。在这里，SwitchCase 是指 JavaScript 
     * 的 switch 语句中的 case 和 default 关键字的缩进。1 表示 case 和 default 关键字的缩进将与 switch 语句的缩进保持一致
     */
    /* 'indent': [2, 2, {
      'SwitchCase': 1
    }], */
    'indent': 'off', // 关闭
    /**
     * 用于指定在 JSX 中使用双引号 (") 还是单引号 (') 来定义属性值的引号风格
     */
    'jsx-quotes': [2, 'prefer-single'], // "prefer-double" 表示首选双引号作为属性值的引号风格
    /**
     * 用于控制对象字面量属性键（key）与值之间的空格的规则
     * { beforeColon: false, afterColon: true } 冒号前无空格，冒号后有空格
     */
    'key-spacing': [2, {
      'beforeColon': false,
      'afterColon': true
    }],
    /**
     * 用于控制 JavaScript 关键字（如 if、for、while 等）前后的空格使用
     * before: true,  // 在关键字前面需要空格
     * after: true    // 在关键字后面需要空格
     */
    'keyword-spacing': [2, {
      'before': true,
      'after': true
    }],
    /**
     * 用于强制要求构造函数（即通过 new 关键字创建的对象）的名称必顩遵循大驼峰命名规则。
     * 大驼峰命名规则要求构造函数的名称应该以大写字母开头，并且没有下划线或其他分隔符
     * "newIsCap" 设置为 true，表示构造函数的名称必须以大写字母开头
     * 'capIsNew' 设置为 false，表示构造函数名不应该包含 "new" 字样
     */
    'new-cap': [2, {
      'newIsCap': true,
      'capIsNew': false
    }],
    /**
     * 用于强制要求在使用 new 关键字调用构造函数时是否需要在构造函数后添加括号
     */
    'new-parens': 2,
    /**
     * 禁止Array构造函数
     */
    'no-array-constructor': 2,
    /**
     * 阻止使用 arguments.caller和arguments.callee
     */
    'no-caller': 2,
    /**
     * 禁止使用console
     */
    'no-console': 'off',
    /**
     * 禁止重新分配类名
     */
    'no-class-assign': 2,
    /**
     * 禁止在条件表达式中使用赋值运算符
     */
    'no-cond-assign': 2,
    /**
     * 禁止重新分配const变量
     */
    'no-const-assign': 2,
    /**
     * 禁止在正则表达式中使用控制字符
     */
    'no-control-regex': 0,
    /**
     * 禁止删除变量
     */
    'no-delete-var': 2,
    /**
     * function不允许定义中出现重复的参数
     */
    'no-dupe-args': 2,
    /**
     * 禁止重复的类成员
     */
    'no-dupe-class-members': 2,
    /**
     * 禁止对象字面量中出现重复的键
     */
    'no-dupe-keys': 2,
    /**
     * 用于检测在 switch 语句中是否存在重复的 case 标签
     */
    'no-duplicate-case': 2,
    /**
     * 禁止在正则表达式中使用空字符类
     */
    'no-empty-character-class': 2,
    /**
     * 禁止空解构模式
     */
    'no-empty-pattern': 2,
    /**
     * 禁止使用eval()
     */
    'no-eval': 2,
    /**
     * 用于禁止在异常对象（通常是 catch 语句中的异常参数）上进行赋值操作
     */
    'no-ex-assign': 2,
    /**
     * 用于禁止扩展内建对象的原型
     * 如果你想为内建对象（例如 Array、Object、String 等）添加自定义方法或属性，
     * 这个规则会警告你不要这样做
     */
    'no-extend-native': 2,
    /**
     * 用于检测不必要的函数绑定
     */
    'no-extra-bind': 2,
    /**
     * 用于检测代码中不必要的布尔值类型转换
     */
    'no-extra-boolean-cast': 2,
    /**
     * 用于检测不必要的括号
     * 'functions' 表示该规则仅会检查函数表达式中的不必要括号，而会忽略其他上下文中的括号
     */
    'no-extra-parens': [2, 'functions'],
    /**
     * 用于禁止在 switch 语句中出现不带 break 或 return 等终止语句的情况
     */
    'no-fallthrough': 2,
    /**
     * 不允许在数字文字中使用前导或尾随小数点
     */
    'no-floating-decimal': 2,
    /**
     * 用于防止给一个函数重新赋值，即禁止对已声明的函数进行赋值操作
     */
    'no-func-assign': 2,
    /**
     * 用于禁止在代码中使用隐含的 eval() 函数
     */
    'no-implied-eval': 2,
    /**
     * 用于禁止在代码块内部声明函数或变量
     * functions: 只允许在代码块内部声明函数，而不允许声明变量
     */
    'no-inner-declarations': [2, 'functions'],
    /**
     * 用于检测 JavaScript 代码中无效正则表达式的规则
     */
    'no-invalid-regexp': 2,
    /**
     * 用于检测代码中不规则的空格字符
     */
    'no-irregular-whitespace': 2,
    /**
     * 用于禁止使用迭代器方法
     */
    'no-iterator': 2,
    /**
     * 用于禁止在变量声明之前使用标签。
     * 这个规则的目的是防止在 JavaScript 代码中使用标签来跳出循环或在其他情况下控制代码流程
     */
    'no-label-var': 2,
    /**
     * 禁止在代码中使用标签（labels）。
     * 标签是一种标记，通常用于在循环中或者条件语句中，以便在后续的代码中通过 break 
     * 或 continue 语句跳转到标签位置
     * 'allowLoop': false：这表示禁止在循环语句中使用标签
     * 'allowSwitch': false：这表示禁止在 switch 语句中使用标签
     */
    'no-labels': [2, {
      'allowLoop': false,
      'allowSwitch': false
    }],
    /**
     * 禁止不必要的嵌套块
     */
    'no-lone-blocks': 2,
    /**
     * 不允许使用混合空格和制表符进行缩进
     */
    'no-mixed-spaces-and-tabs': 2,
    /**
     * 禁止多个空格
     */
    // 'no-multi-spaces': 2,
    'no-multi-spaces': 0,
    /**
     * 禁止多行字符串
     */
    'no-multi-str': 2,
    /**
     * 禁止多个空行
     */
    // 'no-multiple-empty-lines': [2, {
    //   'max': 1
    // }],
    'no-multiple-empty-lines':  0,
    /**
     * 禁止对native objects或只读全局变量进行赋值
     * 此规则在 ESLint v3.3.0 中已弃用，并被 no-global-assign 规则取代。
     */
    'no-native-reassign': 2,
    /**
     * 此规则不允许对 in 表达式中的左操作数取反
     * 此规则在 ESLint v3.3.0 中已弃用，并被 no-unsafe-negation 规则取代。
     */
    'no-negated-in-lhs': 2,
    /**
     * 禁止 Object 构造函数
     */
    'no-new-object': 2,
    /**
     * 此规则旨在消除对 new require 表达式的使用
     * 此规则在 ESLint v7.0.0 中已弃用。请使用 eslint-plugin-node 中的相应规则。
     */
    'no-new-require': 2,
    /**
     * 禁止带有 Symbol 对象的 new 运算符
     */
    'no-new-symbol': 2,
    /**
     * 禁止带有 String、Number 和 Boolean 对象的 new 运算符
     */
    'no-new-wrappers': 2,
    /**
     * 禁止将全局对象属性作为函数调用
     */
    'no-obj-calls': 2,
    /**
     * 禁止八进制字面
     */
    'no-octal': 2,
    /**
     * 禁止字符串字面中的八进制转义序列
     */
    'no-octal-escape': 2,
    /**
     * 防止Node.js中目录路径的字符串连接
     */
    'no-path-concat': 2,
    /**
     * 禁止使用 __proto__ 属性
     * __proto__ 属性自 ECMAScript 3.1 起已被弃用，不应在代码中使用
     */
    'no-proto': 2,
    /**
     * 禁止变量重新声明
     */
    'no-redeclare': 2,
    /**
     * 禁止在正则表达式中使用多个空格
     */
    'no-regex-spaces': 2,
    /**
     * 在 return 语句中不允许赋值运算符
     * 'except-parens' 表示除非赋值操作符被包含在括号中，否则会触发警告或错误
     */
    'no-return-assign': [2, 'except-parens'],
    /**
     * 禁止等号两边完全相同的赋值
     */
    'no-self-assign': 2,
    /**
     * 禁止双方完全相同的比较
     */
    'no-self-compare': 2,
    /**
     * 禁止逗号运算符
     */
    'no-sequences': 2,
    /**
     * 禁止标识符遮蔽受限名称
     */
    'no-shadow-restricted-names': 2,
    /**
     * 此规则不允许函数标识符与其应用程序之间存在间距
     * 此规则在 ESLint v3.3.0 中已弃用，并被 func-call-spacing 规则取代
     */
    'no-spaced-func': 2,
    /**
     * 禁止稀疏数组如var items = [,,];
     */
    'no-sparse-arrays': 2,
    /**
     * 在构造函数中调用 super() 之前禁止 this/super
     */
    'no-this-before-super': 2,
    /**
     * 不允许将字面作为异常抛出，如：throw "error";throw 0;throw undefined;throw null;
     */
    'no-throw-literal': 2,
    /**
     * 不允许在行尾出现尾随空格
     */
    'no-trailing-spaces': 'off',
    /**
     * 除非在 global注释中提及，否则不允许使用未声明的变量
     */
    'no-undef': 2,
    /**
     * 不允许将变量初始化为 undefined
     * 在 JavaScript 中，已声明但未初始化为任何值的变量会自动获取 undefined 的值
     * 因此不必将变量初始化为 undefined
     */
    'no-undef-init': 2,
    /**
     * 禁止混淆多行表达式
     */
    'no-unexpected-multiline': 2,
    /**
     * 禁止未修改的循环条件
     */
    'no-unmodified-loop-condition': 2,
    /**
     * 当存在更简单的替代方案时，不允许使用三元运算符
     * 如const x = condition ? true : false; // 不必要的三元运算符
     * 通过将 'defaultAssignment' 设置为 false，你可以禁用检查以下情况：
     * const x = condition ? true : value;  // 'defaultAssignment' 设置为 false，不会触发警告
     * const y = condition ? 'A' : value;    // 'defaultAssignment' 设置为 false，不会触发警告
     * 在这种情况下，三元运算符的分支中包含一个变量 value，规则认为它可能有意义，因此不会发出警告
     */
    'no-unneeded-ternary': [2, {
      'defaultAssignment': false
    }],
    /**
     * 在 return、throw、continue 和 break 语句之后禁止无法访问的代码
     */
    'no-unreachable': 2,
    /**
     * 禁止 finally 块中的控制流语句
     */
    'no-unsafe-finally': 2,
    /**
     * 禁止未使用的变量
     * 'vars': 'all'：这表示对所有声明的变量都会进行检测，不论是全局变量还是局部变量
     * 'args': 'none'：这表示不检测函数参数是否未使用
     */
    // 'no-unused-vars': [2, {
    //   'vars': 'all',
    //   'args': 'none'
    // }],
    'no-unused-vars': 0,
    /**
     * 禁止对 .call() 和 .apply() 进行不必要的调用
     */
    'no-useless-call': 2,
    /**
     * 禁止对象和类中不必要的计算属性键
     */
    'no-useless-computed-key': 2,
    /**
     * 禁止不必要的构造函数
     */
    'no-useless-constructor': 2,
    /**
     * 禁止不必要的转义字符
     */
    'no-useless-escape': 0,
    /**
     * 禁止属性前有空格
     */
    'no-whitespace-before-property': 2,
    /**
     * 禁止 with 语句
     * with 语句可能存在问题，因为它将对象的成员添加到当前作用域，从而无法判断块内的变量实际指的是什么。
     */
    'no-with': 2,
    /**
     * 强制变量在函数中一起或单独声明
     * { 'initialized': 'never' } 是一个对象，其中包含了规则的选项。在这里，配置指示变量声明不允许在声明时进行初始化
     */
    'one-var': [2, {
      'initialized': 'never'
    }],
    /**
     * 为操作员强制执行一致的换行样式
     * 'after' 表示操作符应该在换行符之后，也就是操作符与下一行代码分开
     * overrides 是一个对象，其中包含了一些特定操作符的配置，这些配置覆盖了默认的 'after' 设置
     * 对于普通操作符（如加法、减法等），操作符应该在换行符之后
     * 对于三元条件运算符（? 和 :），操作符应该在换行符之前
     */
    'operator-linebreak': [2, 'after', {
      'overrides': {
        '?': 'before',
        ':': 'before'
      }
    }],
    /**
     * 此规则在块内强制执行一致的空行填充
     */
    // 'padded-blocks': [2, 'never'],
    'padded-blocks': 'off',
    /**
     * 强制一致地使用反引号、双引号或单引号
     */
    'quotes': 'off',
    /**
     * 要求或禁止使用分号而不是 ASI
     * JavaScript 不需要在每条语句的末尾使用分号
     */
    'semi': 'off',
    /**
     * 在分号前后强制保持一致的间距
     */
    /* 'semi-spacing': [2, {
      'before': false,
      'after': true
    }], */
    'semi-spacing': 0,
    /**
     * 在块之前强制保持一致的间距
     * 如果是 "always"，那么块必须总是有至少一个前面的空格。如果 "never"，那么所有块都不应该有任何前面的空格
     */
    // 'space-before-blocks': [2, 'always'],
    'space-before-blocks': 0,
    /**
     * 在 function 定义左括号之前强制保持一致的间距
     * always（默认）需要一个空格，后跟 ( 参数。
     * never 不允许任何空格后跟 ( 参数。
     */
    'space-before-function-paren': [2, 'never'],
    /**
     * 在括号内强制保持一致的间距
     * "never"（默认）在括号内强制使用零空格
     * "always" 强制括号内有空格
     */
    'space-in-parens': [2, 'never'],
    /**
     * 中缀运算符周围需要间距
     */
    'space-infix-ops': 2,
    /**
     * 在一元运算符之前或之后强制执行一致的间距
     * words - 适用于一元字运算符，例如：new、delete、typeof、void、yield
     * nonwords - 适用于一元运算符，例如：-、+、--、++、!、!!
     * overrides - 为每个运算符、单词或非单词指定覆盖间距的使用。默认情况下为空，但可用于强制或禁止运算符周围的间距
     */
    'space-unary-ops': [2, {
      'words': true,
      'nonwords': false
    }],
    /**
     * 在注释中的 // 或 /* 之后强制保持一致的间距
     * 该规则有两个选项。第一个是一个字符串，它可以是 "always" 或 "never"。默认值为 "always"。
     * 如果是 "always"，那么 // 或 /* 必须后跟至少一个空格。
     * 如果 "never" 那么后面应该没有空格
     * 此规则还可以采用第二个选项，即具有以下任何键的对象："exceptions" 和 "markers"
     * "exceptions" 值是一个字符串模式数组，被视为规则的例外。当模式从注释的开头开始并重复到行尾或 * /
     *  如果注释是单行注释时，该规则不会发出警告。请注意，如果第一个参数是 "never"，则忽略异常
     * "markers" 值是一个字符串模式数组，被认为是 docblock 样式注释的标记，例如附加的 /，用于表示 doxygen、
     * vsdoc 等必须具有附加字符的文档读取。无论第一个参数的值如何，"markers" 数组都将适用，例如"always" 或 "never"。
     */
    'spaced-comment': [2, 'always', {
      'markers': ['global', 'globals', 'eslint', 'eslint-disable', '*package', '!', ',']
    }],
    /**
     * 要求或禁止模板字符串的嵌入表达式周围有空格
     * 此规则有一个选项，其值为 "never" 或 "always"
     * "never"（默认）- 大括号对内不允许有空格
     * "always" - 花括号对内需要一个或多个空格
     */
    'template-curly-spacing': [2, 'never'],
    /**
     * 检查NaN时需要调用isNaN()，此规则不允许与'NaN'进行比较
     * 因为 NaN在JavaScript中是独一无二的，它不等于任何东西，包括它自己，所以与NaN的比较结果令人困惑
     * NaN === NaN 或 NaN == NaN 评估为假
     * NaN !== NaN 或 NaN != NaN 评估为真
     * 因此，使用 Number.isNaN() 或全局 isNaN() 函数来测试一个值是否为 NaN。
     */
    'use-isnan': 2,
    /**
     * 强制将typeof表达式与有效字符串进行比较
     * 此规则有一个对象选项：
     * "requireStringLiterals": true 要求 typeof 表达式只能与字符串字面或其他 typeof 表达式进行比较，并且不允许与任何其他值进行比较。
     */
    'valid-typeof': 2,
    /**
     * 立即调用 function 需要括号
     * 该规则有两个选项，一个字符串选项和一个对象选项。
     * 字符串选项：
     * "outside" 强制始终包装调用表达式。默认值为 "outside"
     * "inside" 强制始终包装函数表达式。
     * "any" 强制总是换行，但允许任何一种样式。
     * 对象选项：
     * "functionPrototypeMethods": true 还强制使用 .call 和 .apply 调用包装函数表达式。默认值为 false。
     */
    'wrap-iife': [2, 'any'],
    /**
     * 在 yield* 表达式中要求或不允许在 * 周围有空格
     */
    'yield-star-spacing': [2, 'both'],
    /**
     * 要求或禁止 "Yoda" 条件
     * 尤达条件之所以如此命名，是因为条件的字面值排在第一位，而变量排在第二位。例如，以下是 Yoda 条件：
     * if ("red" === color) { // ...}
     */
    'yoda': [2, 'never'],
    /**
     * 声明后从不重新分配的变量需要 const 声明
     * 此规则旨在标记使用 let 关键字声明但在初始分配后从未重新分配的变量。
     */
    'prefer-const': 2,
    /**
     * 禁止使用 debugger
     */
    'no-debugger': process.env.NODE_ENV === 'production' ? 2 : 0,
    /**
     * 在大括号内强制保持一致的间距
     * 此规则强制在对象字面量、解构赋值和导入/导出说明符的大括号内保持一致的间距。
     * 该规则有两个选项，一个字符串选项和一个对象选项。
     * 字符串选项：
     * "never"（默认）不允许大括号内的间距
     * "always" 需要大括号内的间距（{} 除外）
     * 对象选项：
     * "arraysInObjects": true 要求以数组元素开始和/或结束的对象的大括号内有间距（适用于第一个选项设置为 never 时）
     * "arraysInObjects": false 不允许在以数组元素开头和/或结尾的对象的大括号内间隔（适用于第一个选项设置为 always 时）
     * "objectsInObjects": true 要求以对象元素开始和/或结束的对象大括号内的间距（当第一个选项设置为 never 时适用）
     * "objectsInObjects": false 不允许以对象元素开始和/或结束的对象大括号内的间距（当第一个选项设置为 always 时适用）
     */
    'object-curly-spacing': [2, 'always', {
      objectsInObjects: false
    }],
    /**
     * 在数组括号内强制保持一致的间距
     * "never"（默认）不允许数组括号内有空格
     * "always" 在数组括号内需要一个或多个空格或换行符
     */
    'array-bracket-spacing': [2, 'never']
  }
}
```
