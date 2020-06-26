

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

// 滚动阀值
const APPBAR_SCROLL_OFFSET = 100;
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final  PageController _controller = PageController (
    initialPage: 0,
  );
  _onScroll(offset) {
    // offset 滚动距离
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    // 异常逻辑 补偿
    if (alpha < 0 ){
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    // 页面滚动时 设置 透明度
    setState(() {
      appBarAlpha = alpha;
    });
    print(appBarAlpha);
  }
  // 轮播图
  List _imageUrls = [
    'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3662039876,3693447911&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2918312108,3101945084&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3763108233,2332114507&fm=26&gp=0.jpg'
  ];
  // 通过滚动更改透明度 的 透明度的阈值变量
  double appBarAlpha = 0;
  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold (
      // 将元素叠放 stack 前面元素 会被叠在后面元素下面
      body: Stack(
        children: [
          // 移除顶部边距
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              // 添加列表滚动监听
              child: NotificationListener(
                // ignore: missing_return
                onNotification: (scrollNotification ){
                  // 排除无用监听 滚动监听通知 && 监听滚动元素过滤  当 第0个元素ListView的时候触发监听
                  if(scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
                    // 滚动 且是列表滚动的时候
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                },
                child: ListView(
                  children: [
                    Container(
                      height: 160,
                      child: Swiper(
                        itemCount: _imageUrls.length ,// 图片个数
                        autoplay: true, // 自动播放
                        itemBuilder: (BuildContext context,int index){
                          return Image.network(
                            _imageUrls[index],
                            fit: BoxFit.fill,
                          );
                        },
                        pagination: SwiperPagination(),
                      ),
                    ),
                    Container(
                      height: 800,
                      child: ListTile(title: Text('haha'),),
                    ),
                  ],
                ),
              )
          ),
          // 通过 Opacity 改变 appbar 的透明度
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              // 通过装饰器 设置背景色
              decoration: BoxDecoration( color: Colors.white ),
              child: Center(
                // 通过 padding 组件设置 上边边距 20
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('首页'),
                )
              ),
            ),
          )
        ],
      )
    );
  }

}