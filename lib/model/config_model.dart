class ConfigModel {
  final String searchUrl;

  ConfigModel({required this.searchUrl});

  ConfigModel.fromJson(Map<String, dynamic> json)
      : searchUrl = json['searchUrl'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'searchUrl': searchUrl,
      };
}
