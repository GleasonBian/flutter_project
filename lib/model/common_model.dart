/// 创建 home model 类
/// String searchUrl	String	NonNull
class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppbar;

  // 参数可选
  CommonModel(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppbar});

  // 工厂函数
  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppbar: json['hideAppbar'],
    );
  }
}
