# Flutter开发一个GitHub客户端及学习总结

> 本项目为个人Flutter的学习练习项目。

学习Flutter也有一阵子了。闲着没事，用Github开放出来的API进行练手，编写出来了一款Github客户端。
当然自己也是边查边写，也借鉴了许多Github上优秀的Flutter项目，例如UI上主要是参考[gitme](https://github.com/flutterchina/gitme)。现在开源出来，供大家交流学习。希望多多Star、Fork支持，有问题可以Issue。

[项目地址-OpenGit客户端](https://github.com/Yuzopro/OpenGit_Flutter)

## 预览

部分页面效果如下：

<table>
    <tr>
        <td ><center>
            <img src="https://user-gold-cdn.xitu.io/2019/6/13/16b506acaec0d91b?w=1600&h=2880&f=png&s=80120" width="210px"/>
        </center></td>
        <td ><center>
            <img src="https://user-gold-cdn.xitu.io/2019/6/13/16b506acb00c0697?w=1080&h=1944&f=jpeg&s=130075" width="210px"/>
        </center></td>
    </tr>
    <tr>
        <td ><center>
            <img src="https://user-gold-cdn.xitu.io/2019/6/13/16b506acc811e09a?w=1080&h=1944&f=jpeg&s=93369" width="210px"/>
        </center></td>
        <td ><center>
            <img src="https://user-gold-cdn.xitu.io/2019/6/13/16b506acb0d675af?w=1600&h=2880&f=png&s=99981" width="210px"/>
        </center></td>
    </tr>
    <tr>
        <td ><center>
            <img src="https://user-gold-cdn.xitu.io/2019/6/13/16b506acc7f96dc6?w=1080&h=1944&f=jpeg&s=89344" width="210px"/>
        </center></td>
        <td ><center>
            <img src="https://user-gold-cdn.xitu.io/2019/6/13/16b506ad44dc3ebf?w=1080&h=1944&f=jpeg&s=94746" width="210px"/>
        </center></td>
    </tr>
    <tr>
        <td ><center>
            <img src="https://user-gold-cdn.xitu.io/2019/6/13/16b506acc802891b?w=1080&h=1944&f=jpeg&s=106577" width="210px"/>
        </center></td>
        <td ><center>
            <img src="https://user-gold-cdn.xitu.io/2019/6/13/16b506ad97308e65?w=1600&h=2880&f=png&s=63654" width="210px"/>
        </center></td>
    </tr>
    <tr>
        <td ><center>
            <img src="https://user-gold-cdn.xitu.io/2019/6/13/16b506ad8bf8581a?w=1080&h=1944&f=jpeg&s=112009" width="210px"/>
        </center></td>
        <td ><center>
            <img src="https://user-gold-cdn.xitu.io/2019/6/13/16b506ad5404025b?w=1080&h=1944&f=jpeg&s=88664" width="210px"/>
        </center></td>
    </tr>
    <tr>
        <td ><center>
            <img src="https://user-gold-cdn.xitu.io/2019/6/13/16b506ae31c53235?w=1600&h=2880&f=png&s=83442" width="210px"/>
        </center></td>
        <td ><center>
            <img src="https://user-gold-cdn.xitu.io/2019/6/13/16b506ae361f22d2?w=1080&h=1944&f=jpeg&s=87580" width="210px"/>
        </center></td>
    </tr>
</table>

## 1.0.0支持功能列表

    1. 登录：支持github账号登录和注销；
    2. 主页：登录后用户可以查看掘金flutter列表、自己github项目、动态、issue等信息；
    3. 搜索：支持项目、用户、issue的搜索；
    4. 项目：支持对项目进行star/unstar、watch/unwatch，可以查看项目更新动态、分支源码、所属语言趋势等信息；
    5. 用户：支持查看用户详情；
    6. issue：支持issue列表的查看，以及编辑、评论issue；
    7. 国际化：支持简体中文与美国英语；
    8. 个性化：支持多套主题的切换；
    9. 功能介绍：支持每个版本迭代的详情介绍；
    10. 版本更新：支持app的升级；

## 学习历程

### 初识Flutter

最初学习`flutter`的方式是通过学习[Flutter中文网](https://flutterchina.club/)，在了解基本的flutter语法操作后，在通过学习[wendux](https://github.com/wendux)的[《Flutter实践》](https://book.flutterchina.club/)。由于`dart`好多语法和`java`比较类似，就没进行系统的学习，遇到`dart`上的问题，都是上网查阅资料解决。后续会对`dart`进行系统的学习。

### 学习一个月的感觉
学习flutter基本上都是空闲时间学习，最初每天花2-3个小时，学习flutter的最常用的基础组件;当基础组件掌握的差不多后，开始深入学flutter中的Widget，主要是参考flutter官方gallery demo, 并且跟着这个项目敲代码。在敲了几天之后，发现这个学习过程非常枯燥，并且经常性学了下个widget，就忘了上个widget，没坚持多久，就考虑拿一个项目练手。学习这整个过程大概就花了一个月，总体感觉只要静下心来学习还是很容易上手的。

## OpenGit项目的诞生
OpenGit主要是一个Github客户端。选择以Github客户端作为练手项目的主要原因有，第一因为最开始接触的flutter开发的第一个app就是[gitme](https://github.com/flutterchina/gitme)，而这个项目也是一个Github客户端，有现成的ui可以作为参考；第二可以参考[恋猫de小郭](https://juejin.im/user/582aca2ba22b9d006b59ae68)开源了一个更强大的Github客户端[GSYGithubAppFlutte](https://github.com/CarGuo/GSYGithubAppFlutter)

## 实战

### UI

项目的UI部分前面提到过，主要是参考[gitme](https://github.com/flutterchina/gitme)，widget的实现主要是参考gallery demo。

### 数据源

请求数据的相关API，主要是参[GSYGithubAppFlutte](https://github.com/CarGuo/GSYGithubAppFlutter)和[Github Developer](https://developer.github.com/v3/)。

这里非常感觉下[恋猫de小郭](https://juejin.im/user/582aca2ba22b9d006b59ae68)，[GSYGithubAppFlutte](https://github.com/CarGuo/GSYGithubAppFlutter) 确实在我实践过程中提供了很大的帮助，在查阅相关api封装时，节省了不少的时间。

### 架构

OpenGit 1.1.0版本架构已采用BloC+Redux。
详情可以参考文章[MVC、MVP、BloC、Redux四种架构在Flutter上的尝试](https://yuzopro.github.io/2019/07/13/MVC-MVP-BloC-Redux%E5%9B%9B%E7%A7%8D%E6%9E%B6%E6%9E%84%E5%9C%A8Flutter%E4%B8%8A%E7%9A%84%E5%B0%9D%E8%AF%95/)

OpenGit主要是通过网络从github获取数据，然后再渲染UI。我们可以在逻辑上对业务代码简单分成两层：底层数据IO+上层UI渲染。

#### 数据层

关于数据请求的配置、逻辑等不要在UI层去控制，而由数据层自己完成。这里主要对http层进行了下封装，缓存在1.0.0版本中还未实现，可能后续版本会加入。

#### UI渲染层

UI层我们主要使用的是material组件库，对Scaffold 、 AppBar 进行了统一的封装。

#### 开源库

为了尽可能最少的造轮子，主要使用了以下第三方开源库

| 库                          | 功能             |
| -------------------------- | -------------- |
| **dio**                    | **网络框架**       |
| **shared_preferences**     | **本地数据缓存**     |
| **connectivity**           | **网络连接**      |
| **json_annotation**        | **json模版**       |
| **flutter_markdown**       | **markdown解析**       |
| **cached_network_image**   | **图片加载**       |
| **flutter_webview_plugin** | **全屏的webview** |
| **photo_view**             | **图片预览** |
| **flutter_spinkit**        | **加载框样式** |
| **flutter_redux**          | **redux** |
| **fluro**                  | **路由** |
| **package_info**           | **版本信息** |
| **qr_flutter**             | **二维码生成** |
| **permission_handler**     | **权限申请** |
| **rxdart**                 | **rx框架用于BloC** |
| **pull_to_refresh**        | **下拉listview** |
| **fluttertoast**           | **toast提示** |
| **webview_flutter**        | **webview加载** |
| **url_launcher**           | **默认浏览器展示url** |

## Android版安装包：
[点击下载](https://github.com/Yuzopro/OpenGit_Flutter/releases/download/1.1.0/opengit-release-1.1.0.apk)

扫码下载

![image](https://raw.githubusercontent.com/Yuzopro/image/master/flutter/flutter_opengit_3.png) 

## IOS需要自行下载代码运行。（效果是一致的）

## 项目环境

    1. Flutter version 1.6.3

    2. Dart version 2.3.2 (build 2.3.2-dev.0.0 e3edfd36b2)

    3. Android SDK version 28.0.3

    4. Android Studio version 3.4.2

## TODO

已知问题：

    1. 切换语言时，代码中的中文暂未全部替换；
    2. 路由还未全部替换；
    3. markdown支持还不是很完善；

## Thanks For

- [flutter-go](https://github.com/alibaba/flutter-go)

- [GSYGithubAppFlutter](https://github.com/CarGuo/GSYGithubAppFlutter)

- [Flutter中文网](https://flutterchina.club/)

- [Flutter 实战](https://book.flutterchina.club/)

- [Github Developer](https://developer.github.com/v3/)

## 关于作者

- [个人博客](https://yuzopro.github.io/)

- [Github](https://github.com/yuzopro)

- [掘金](https://juejin.im/user/56ea9d7ca341310054a57b7c)

- [简书](https://www.jianshu.com/u/ef3cb65219d4)

- [CSDN](https://blog.csdn.net/Yuzopro)


如果觉得好？请打赏下作者😀

<img src="https://raw.githubusercontent.com/Yuzopro/image/master/flutter/weixin_pay.jpeg" width="260px"/>

## 默认条款

此项目仅供大家交流沟通使用，不得用于任何商业以及利益活动。