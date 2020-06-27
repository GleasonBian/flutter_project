import 'package:flutter/material.dart';
/// 下拉刷新 上拉加载更多
List<String> cityName = [
  '北京',
  '上海',
  '广州',
  '深圳',
  '苏州',
  '成都',
  '武汉',
  '郑州',
  '洛阳',
  '厦门',
  '青岛',
  '拉萨'
];

class Refresh extends StatefulWidget {
  @override
  _RefreshState createState() => _RefreshState();
}

class _RefreshState extends State<Refresh> {
  final title = '下拉刷新,上拉加载';



  String get city => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        // 使用 RefreshIndicator 下拉刷新
        body: RefreshIndicator(
            onRefresh: _handleRefresh,
            // listView 中添加 controller 实现 上拉加载更多
            child: ListView(
              controller: _scrollController,
              children:_buildList(),
            )),
      ),
    );
  }
  /// 下拉刷新
  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      cityName = cityName.reversed.toList();
    });
    return null;
  }
  /// 下拉刷新
  List<Widget> _buildList() {
    return cityName.map((city) => _item(city)).toList();
  }
  /// 下拉刷新
  Widget _item(String city) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  /// 上拉加载更多
  /// 构建 ScrollController 实例
  ScrollController _scrollController = ScrollController();
  /// 上拉加载更多
  @override
  void initState() {
    // 给 _scrollController 增加监听
    _scrollController.addListener(() {
      // 如果当前 位置像素 等于 最大可滚动高度 调用 加载 数据方法
      if (_scrollController.position.pixels  == _scrollController.position.maxScrollExtent) {
        _loadData();
      }
    });
    super.initState();
  }
  /// 上拉加载更多
  void _loadData() async{
    // 等待 200 毫秒执行 setState 方法
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      // 复制数组
      List <String> list = List<String>.from(cityName);
      // 向数组 重新添加一个 cityName ;
      list.addAll(cityName);
      cityName = list;
    });
  }
  /// 移除监听
  @override
  void dispose() {
    // TODO: implement deactivate
     _scrollController.dispose();
     super.dispose();
  }
}
