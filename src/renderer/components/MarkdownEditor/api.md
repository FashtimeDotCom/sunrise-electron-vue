# <center> MarkdownEditor 组件说明 </center>

#### Use

```html
<markdown-editor
  v-model="xxx"
  v-bind="Attributes"
  v-on="Events"
  ...
></markdown-editor>
```

#### Attributes

| 参数            |  类型   | 默认值 | 说明                                   |
| --------------- | :-----: | :----: | -------------------------------------- |
| value / v-model | String  |   ——   | 初始值                                 |
| view            | Boolean | false  | 是否是显示模式                         |
| height          | String  |  auto  | 组件的高度，例如 "100"、"30%"、"200px" |
| scroll          | Boolean |  true  | 是否出现滚动条                         |
| options         | Object  | 如下例 | 组件的高级配置                         |

##### options.Attributes

| 参数         |   类型   |   默认值    | 说明                                                                                                                                |
| ------------ | :------: | :---------: | ----------------------------------------------------------------------------------------------------------------------------------- |
| language     |  String  |    zh-CN    | 语言选择，暂支持 zh-CN: 中文简体 ， en: 英文 ， fr: 法语， pt-BR: 葡萄牙语， ru: 俄语， de: 德语， ja: 日语                         |
| fontSize     |  String  |    15px     | 编辑区域文字大小                                                                                                                    |
| scrollStyle  | Boolean  |    true     | 开启滚动条样式(暂时仅支持 chrome)                                                                                                   |
| boxShadow    | Boolean  |    true     | 开启边框阴影                                                                                                                        |
| subfield     | Boolean  |    true     | true： 双栏(编辑预览同屏)， false： 单栏(编辑预览分屏)                                                                              |
| defaultOpen  |  String  |             | edit： 默认展示编辑区域 ， preview： 默认展示预览区域 , 其他 = edit                                                                 |
| placeholder  |  String  | 开始编辑... | 输入框为空时默认提示文本                                                                                                            |
| editable     | Boolean  |    true     | 是否允许编辑                                                                                                                        |
| codeStyle    |  String  | code-github | markdown 样式： 默认 github, [可选配色方案](https://github.com/hinesboy/mavonEditor/blob/master/src/lib/core/hljs/lang.hljs.css.js) |
| toolbarsFlag | Boolean  |    true     | 工具栏是否显示                                                                                                                      |
| navigation   | Boolean  |    false    | 默认展示目录                                                                                                                        |
| shortCut     | Boolean  |    true     | 是否启用快捷键                                                                                                                      |
| autofocus    | Boolean  |    true     | 自动聚焦到文本框                                                                                                                    |
| ishljs       | Boolean  |    true     | 代码高亮                                                                                                                            |
| imageFilter  | function |    null     | 图片过滤函数，参数为一个`File Object`，要求返回一个`Boolean`, `true`表示文件合法，`false`表示文件不合法                             |
| imageClick   | function |    null     | 图片点击事件，默认为预览，可覆盖                                                                                                    |
| tabSize      |  Number  |     \t      | tab 转化为几个空格，默认为\t                                                                                                        |
| toolbars     |  Object  |   如下例    | 工具栏                                                                                                                              |

```javascript
 /*
    默认工具栏按钮全部开启, 传入自定义对象
    例如: {
         bold: true, // 粗体
         italic: true,// 斜体
         header: true,// 标题
    }
    此时, 仅仅显示此三个功能键
 */
toolbars: {
      bold: true, // 粗体
      italic: true, // 斜体
      header: true, // 标题
      underline: true, // 下划线
      strikethrough: true, // 中划线
      mark: true, // 标记
      superscript: true, // 上角标
      subscript: true, // 下角标
      quote: true, // 引用
      ol: true, // 有序列表
      ul: true, // 无序列表
      link: true, // 链接
      imagelink: true, // 图片链接
      code: true, // code
      table: true, // 表格
      fullscreen: true, // 全屏编辑
      readmodel: true, // 沉浸式阅读
      htmlcode: true, // 展示html源码
      help: true, // 帮助
      /* 1.3.5 */
      undo: true, // 上一步
      redo: true, // 下一步
      trash: true, // 清空
      save: true, // 保存（触发events中的save事件）
      /* 1.4.2 */
      navigation: true, // 导航目录
      /* 2.1.8 */
      alignleft: true, // 左对齐
      aligncenter: true, // 居中
      alignright: true, // 右对齐
      /* 2.2.1 */
      subfield: true, // 单双栏模式
      preview: true, // 预览
  }
```

#### Events

| 事件名           |              参数               | 说明                                                                  |
| ---------------- | :-----------------------------: | --------------------------------------------------------------------- |
| change           | String: value , String: render  | 编辑区发生变化的回调事件(render: value 经过 markdown 解析后的结果)    |
| save             | String: value , String: render  | ctrl + s 的回调事件(保存按键,同样触发该回调)                          |
| fullScreen       | Boolean: status , String: value | 切换全屏编辑的回调事件(boolean: 全屏开启状态)                         |
| readModel        | Boolean: status , String: value | 切换沉浸式阅读的回调事件(boolean: 阅读开启状态)                       |
| htmlCode         | Boolean: status , String: value | 查看 html 源码的回调事件(boolean: 源码开启状态)                       |
| subfieldToggle   | Boolean: status , String: value | 切换单双栏编辑的回调事件(boolean: 双栏开启状态)                       |
| previewToggle    | Boolean: status , String: value | 切换预览编辑的回调事件(boolean: 预览开启状态)                         |
| helpToggle       | Boolean: status , String: value | 查看帮助的回调事件(boolean: 帮助开启状态)                             |
| navigationToggle | Boolean: status , String: value | 切换导航目录的回调事件(boolean: 导航开启状态)                         |
| imgAdd           | String: filename, File: imgfile | 图片文件添加回调事件(filename: 写在 md 中的文件名, File: File Object) |
| imgDel           |        String: filename         | 图片文件删除回调事件(filename: 写在 md 中的文件名)                    |

#### FastKey

| key               |    keycode     |       功能        |
| ----------------- | :------------: | :---------------: |
| F8                |      119       |   开启/关闭导航   |
| F9                |      120       |   预览/编辑切换   |
| F10               |      121       |   开启/关闭全屏   |
| F11               |      122       | 开启/关闭阅读模式 |
| F12               |      123       |   单栏/双栏切换   |
| TAB               |       9        |       缩进        |
| CTRL + S          |    17 + 83     |     触发保存      |
| CTRL + D          |    17 + 68     |    删除选中行     |
| CTRL + Z          |    17 + 90     |      上一步       |
| CTRL + Y          |    17 + 89     |      下一步       |
| CTRL + BreakSpace |     17 + 8     |     清空编辑      |
| CTRL + B          |    17 + 66     |     **加粗**      |
| CTRL + I          |    17 + 73     |      _斜体_       |
| CTRL + H          |    17 + 72     |      # 标题       |
| CTRL + 1          | 17 + 97 or 49  |      # 标题       |
| CTRL + 2          | 17 + 98 or 50  |      ## 标题      |
| CTRL + 3          | 17 + 99 or 51  |     ### 标题      |
| CTRL + 4          | 17 + 100 or 52 |     #### 标题     |
| CTRL + 5          | 17 + 101 or 53 |    ##### 标题     |
| CTRL + 6          | 17 + 102 or 54 |    ###### 标题    |
| CTRL + U          |    17 + 85     |    ++下划线++     |
| CTRL + M          |    17 + 77     |     ==标记==      |
| CTRL + Q          |    17 + 81     |      > 引用       |
| CTRL + O          |    17 + 79     |    1. 有序列表    |
| CTRL + L          |    17 + 76     |     [链接]()      |
| CTRL + ALT + S    |  17 + 18 + 83  |     ^上角标^      |
| CTRL + ALT + U    |  17 + 18 + 85  |    - 无序列表     |
| CTRL + ALT + C    |  17 + 18 + 67  |    ``` 代码块     |
| CTRL + ALT + L    |  17 + 18 + 76  |   ![图片链接]()   |
| CTRL + ALT + T    |  17 + 18 + 84  |       表格        |
| CTRL + SHIFT + S  |  17 + 16 + 83  |     ~下角标~      |
| CTRL + SHIFT + D  |  17 + 16 + 68  |    ~~中划线~~     |
| CTRL + SHIFT + C  |  17 + 16 + 67  |       居中        |
| CTRL + SHIFT + L  |  17 + 16 + 76  |       居左        |
| CTRL + SHIFT + R  |  17 + 16 + 82  |       居右        |
| SHIFT + TAB       |     16 + 9     |     取消缩进      |

#### Markdown 语法拓展

- [emoji](https://github.com/markdown-it/markdown-it-emoji)
- [subscript](https://github.com/markdown-it/markdown-it-sub)
- [superscript](https://github.com/markdown-it/markdown-it-sup)
- [container](https://github.com/markdown-it/markdown-it-container)
- [definition list](https://github.com/markdown-it/markdown-it-deflist)
- [abbreviation](https://github.com/markdown-it/markdown-it-abbr)
- [footnote](https://github.com/markdown-it/markdown-it-footnote)
- [insert](https://github.com/markdown-it/markdown-it-ins)
- [mark](https://github.com/markdown-it/markdown-it-mark)
- [todo list](https://github.com/revin/markdown-it-task-lists)
- [highlight](https://github.com/isagalaev/highlight.js)
- [katex](https://github.com/Khan/KaTeX)
- [images preview](https://github.com/CHENXCHEN/markdown-it-images-preview)
- [toc](https://github.com/tylerlong/markdown-it-toc)