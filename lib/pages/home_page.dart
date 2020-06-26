

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
    print('offset:$offset');
  }
  @override
  Widget build(BuildContext context) {
    List _imageUrls = [
      'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3662039876,3693447911&fm=26&gp=0.jpg',
      'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2918312108,3101945084&fm=26&gp=0.jpg',
      'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3763108233,2332114507&fm=26&gp=0.jpg'
    ];
    // TODO: implement build
    return Scaffold (
      // 移除顶部边距
      body: MediaQuery.removePadding(
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
      )
    );
  }

}