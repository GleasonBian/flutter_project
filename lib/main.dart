import 'package:flutter/material.dart';

import 'navigator/tab_navigator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String showResult = '';
  Future<CommonModel>fetchPost() async{
    var response = await http.get('https://www.devio.org/io/flutter_app/json/test_common_model.json');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    final result = json.decode(response.body);
    return CommonModel.fromJson(result);

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('http'),
        ),
        body: Column(
          children: [
            // 可点击的按钮
            InkWell(
              onTap: (){
                fetchPost().then((CommonModel value){
                  setState(() {
                    showResult = '请求结果: \n hideAppBar: ${value.hideAppBar} \n icon: ${value.icon}';
                  });
                });
              },
              child: Text('点我',style: TextStyle(fontSize: 26),),
            ),
            Text(showResult)
          ],
        ),
      ),
    );
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
  CommonModel({this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  // 创建工厂方法factory fromJson 参数为 动态类型 map
  factory CommonModel.fromJson(Map<String,dynamic>json){
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppBar: json['hideAppBar'],
    );
  }
}
