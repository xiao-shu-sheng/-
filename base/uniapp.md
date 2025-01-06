## uniapp路由跳转及参数
  - uni.navigateTo(OBJECT）
    - 保留当前页，跳转到应用内的某个页面
    - 使用uni.navigateBack可以返回到原页面
    ```javascript
      uni.navigateTo({
        url: '/pages/detail/detail?id=1&name=uniapp',
        success: function(res) {
          // 跳转成功回调
        },
        fail: function(err) {
          // 跳转失败回调
        }
      });

    ```
  - uni.redirectTo(OBJECT)
    - 关闭当前页面，跳转到应用内的某个页面
    ```javascript
      uni.redirectTo({
        url: '/pages/index/index?id=1'
      });

    ```
  - uni.reLaunch(OBJECT)
    - 关闭所有页面，打开到应用内的某个页面
    ```javascript
      uni.reLaunch({
        url: '/pages/index/index'
      });

    ```
  - uni.switchTab(OBJECT)
    - 跳转到 tabBar 页面，并关闭其他所有非 tabBar 页面
    ```javascript
      uni.switchTab({
        url: '/pages/index/index'
      });

    ```
  - uni.navigateBack(OBJECT)
    - 关闭当前页面，返回上一页面或多级页面
    ```javascript
      uni.navigateBack({
        delta: 1
      });

    ```
