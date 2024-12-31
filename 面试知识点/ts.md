## type和interface的区别
  - 扩展性
    - interface：可以通过合并声明来扩展
    ```typescript
      interface Animal {
        name: string;
      }
      interface Animal {
        age: number;
      }
    ```
    - type：不能直接扩展，但是可以使用交叉类型来组合多个类型
    ```typescript
      type Animal = {
        name: string;
      }
      type AnimalWithAge = Animal & { age: number };
    ```
  - 继承和实现
    - interface：可以被类实现和继承
    ```typescript
      interface Animal {
        name: string;
      }
      class Dog implements Animal {
        name: string;
      }
      interface Pet extends Animal {
        owner: string;
      }
    ```
    - type：不能被直接实现或继承，但可以通过交叉类型来 实现类似的效果
    ```typescript
      type Animal = {
        name: string;
      }
      type Pet = Animal & { owner: string };

    ```
  - 联合类型和交叉类型
    - interface：不能直接创建联合类型或者交叉类型
    - type：可以直接创建联合类型和交叉类型
    ```typescript
      type StringOrNumber = string | number;
      type NameAndAge = { name: string } & { age: number };
    ```
  - 计算属性
    - interface：不支持计算属性名
    - type：支持计算属性名
    ```typescript
      type Keys = 'firstName' | 'lastName';
      type Person = {
        [key in Keys]: string;
      }
    ```
  - 元组和数组
    - interface：可以描述数组，但不能精确描述元组
    - type：可以精确描述元组和数组
    ```typescript
      type StringNumberPair = [string, number];
    ```
  - 映射类型
    - interface：不能使用映射类型
    - type：可以使用映射类型
    ```typescript
      type Readonly<T> = {
        readonly [P in keyof T]: T[P];
      };
    ```
  - 基本类型别名
    - interface：不能为基本类型创建别名
    - type：可以为基本类型创建别名
    ```typescript
      type myString = string
    ```
