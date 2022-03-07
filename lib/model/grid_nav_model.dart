import 'common_model.dart';

class GridNavModel {
  final GridNavItemModel hotel;
  final GridNavItemModel flight;
  final GridNavItemModel travel;

  GridNavModel({
    required this.hotel,
    required this.flight,
    required this.travel,
  });

  GridNavModel.fromJson(Map<String, dynamic> json)
      : hotel = GridNavItemModel.fromJson(json['hotel']),
        flight = GridNavItemModel.fromJson(json['flight']),
        travel = GridNavItemModel.fromJson(json['travel']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'hotel': hotel,
        'flight': flight,
        'travel': travel,
      };
}

class GridNavItemModel {
  final String startColor;
  final String endColor;
  final CommonModel mainItem;
  final CommonModel item1;
  final CommonModel item2;
  final CommonModel item3;
  final CommonModel item4;

  GridNavItemModel({
    required this.startColor,
    required this.endColor,
    required this.mainItem,
    required this.item1,
    required this.item2,
    required this.item3,
    required this.item4,
  });

  GridNavItemModel.fromJson(Map<String, dynamic> json)
      : startColor = json['startColor'],
        endColor = json['startColor'],
        mainItem = CommonModel.fromJson(json['mainItem']),
        item1 = CommonModel.fromJson(json['item1']),
        item2 = CommonModel.fromJson(json['item2']),
        item3 = CommonModel.fromJson(json['item3']),
        item4 = CommonModel.fromJson(json['item4']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'startColor': startColor,
        'endColor': endColor,
        'mainItem': mainItem,
        'item1': item1,
        'item2': item2,
        'item3': item3,
        'item4': item4,
      };
}
