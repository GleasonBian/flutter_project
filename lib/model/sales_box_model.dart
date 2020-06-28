import 'common_model.dart';

/// 创建 home model 类
/// 活动入口模型
/// final String icon
/// final String moreUrl
/// final CommonModel bigCard1
/// final CommonModel bigCard2
/// final CommonModel smallCard1
/// final CommonModel smallCard2
/// final CommonModel smallCard3
/// final CommonModel smallCard4
class SalesBoxModel {
   final String icon;
   final String moreUrl;
   final CommonModel bigCard1;
   final CommonModel bigCard2;
   final CommonModel smallCard1;
   final CommonModel smallCard2;
   final CommonModel smallCard3;
   final CommonModel smallCard4;

  // 参数可选
  SalesBoxModel({this.icon, this.moreUrl, this.bigCard1, this.bigCard2, this.smallCard1, this.smallCard2, this.smallCard3, this.smallCard4});

  // 工厂函数
  factory SalesBoxModel.fromJson(Map<String, dynamic> json) {
    return SalesBoxModel(
      icon: json['icon'],
      moreUrl: json['moreUrl'],
      bigCard1:  CommonModel.fromJson(json['bigCard1']),
      bigCard2: CommonModel.fromJson(json['bigCard2']),
      smallCard1: CommonModel.fromJson(json['bigCard1']),
      smallCard2: CommonModel.fromJson(json['smallCard2']),
      smallCard3: CommonModel.fromJson(json['smallCard3']),
      smallCard4: CommonModel.fromJson(json['smallCard4']),
    );
  }
}
