import 'common_model.dart';
import 'config_model.dart';
import 'grid_nav_model.dart';
import 'sales_box_model.dart';

class HomeModel {
  final ConfigModel config;
  final GridNavModel gridNav;
  final SalesBoxModel salesBox;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final List<CommonModel> subNavList;

  HomeModel({
    required this.config,
    required this.bannerList,
    required this.localNavList,
    required this.subNavList,
    required this.gridNav,
    required this.salesBox,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    var bannerListJson = json['bannerList'] as List;
    var localNavListJson = json['localNavList'] as List;
    var subNavListJson = json['subNavList'] as List;
    List<CommonModel> bannerList =
        bannerListJson.map((i) => CommonModel.fromJson(i)).toList();
    List<CommonModel> localNavList =
        localNavListJson.map((i) => CommonModel.fromJson(i)).toList();
    List<CommonModel> subNavList =
        subNavListJson.map((i) => CommonModel.fromJson(i)).toList();

    return HomeModel(
      config: ConfigModel.fromJson(json['config']),
      gridNav: GridNavModel.fromJson(json['gridNav']),
      salesBox: SalesBoxModel.fromJson(json['salesBox']),
      bannerList: bannerList,
      localNavList: localNavList,
      subNavList: subNavList,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'config': config,
        'gridNav': gridNav,
        'salesBox': salesBox,
        'bannerList': bannerList,
        'localNavList': localNavList,
        'subNavList': subNavList
      };
}
