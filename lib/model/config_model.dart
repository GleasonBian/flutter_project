/// 创建 home model 类
/// String searchUrl	String	NonNull
class ConfigModel {
  final String searchUrl;

  // 参数可选
  ConfigModel({this.searchUrl});
  // 工厂函数
  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(searchUrl: json['searchUrl']);
  }
}
