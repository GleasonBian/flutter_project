
import 'package:deviceclient/main.dart';
import 'package:deviceclient/model/config_model.dart';
import 'package:deviceclient/model/grid_nav_model.dart';
import 'package:deviceclient/model/sales_box_model.dart';

/// 创建 home model 类
class HomeModel {
  final ConfigModel config;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavlist;
  final List<CommonModel> subNavList;
  final GridNavModel gridNav;
  final SalesBoxModel salesBox;
  HomeModel({this.config, this.bannerList, this.localNavlist, this.gridNav, this.salesBox, this.subNavList });

  // ignore: missing_return
  /// 工厂函数, 接受一个 Map 类型的参数
  /// map 的 key 是 String 类型
  /// map 的 value 是 dynamic(动态类型)
  /// 参数名为 json
  factory HomeModel.fromJson (Map<String,dynamic>json){
    // 取出 localNavList
    // 使用 var 声明 localNavListJson 变量接收 localNavList
    // 使用 as 将 localNavList 转换为 List 类型
    var localNavListJson = json['localNavList'] as List;

    /// 将 localNavListJson 进一步转换为 localNavList
    List <CommonModel> localNavList = localNavListJson.map((i) => CommonModel.fromJson(i)).toList();

    List <CommonModel> bannerList = localNavListJson.map((i) => CommonModel.fromJson(i)).toList();

    List <CommonModel> subNavList = localNavListJson.map((i) => CommonModel.fromJson(i)).toList();

    return HomeModel(
      localNavlist: localNavList,
      bannerList: bannerList,
      subNavList: subNavList,
      config: ConfigModel.fromJson(json['config']),
      gridNav: GridNavModel.fromJson(json['gridNav']),
      salesBox: SalesBoxModel.fromJson(json['salesBox']),
    );
  }
}