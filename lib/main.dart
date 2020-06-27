import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'demo/Refresh.dart';
import 'navigator/tab_navigator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(Refresh());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 请求数据结果
  String showResult = '';
  // 演示 使用本地存储 shared_preference
  String countString = '';
  String localCount = '';

  Future<CommonModel> fetchPost() async {
    var response = await http.get(
        'https://www.devio.org/io/flutter_app/json/test_common_model.json');
    // 处理中文乱码
    Utf8Decoder utf8decoder = Utf8Decoder();
    final result = json.decode(utf8decoder.convert(response.bodyBytes));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return CommonModel.fromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('future 与 futureBuilder 实用技巧'),
        ),
        // ignore: missing_return
        body: FutureBuilder<CommonModel>(
            // future 参数切记
            future: fetchPost(),
            builder:
                // ignore: missing_return
                (BuildContext context, AsyncSnapshot<CommonModel> snapshot) {
              // ignore: missing_return
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('input a url to start');
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.active:
                  return Text('active');
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text(
                      '${snapshot.error}',
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return Column(
                      children: [
                        Text('icon:${snapshot.data.icon}'),
                        Text('statusBarColor:${snapshot.data.statusBarColor}'),
                        Text('title: ${snapshot.data.title}'),
                        Text('title: ${snapshot.data.url}'),

                      ],
                    );
                  }
              }
            }),
      ),
    );
  }
  _incrementCounter() async{
    // 实例化 SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      countString = countString + "1";
    });
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    await prefs.setInt('counter',counter);
  }
  _getCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      localCount = prefs.getInt('counter'.toString()) as String;
    });
  }
}

// 定义 model
class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  // 定义构造方法 参数可选
  CommonModel(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  // 创建工厂方法factory fromJson 参数为 动态类型 map
  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppBar: json['hideAppBar'],
    );
  }
}
