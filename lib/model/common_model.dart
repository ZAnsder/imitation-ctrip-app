class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel(
    this.icon,
    this.title,
    this.url,
    this.statusBarColor,
    this.hideAppBar,
  );

  CommonModel.fromJson(Map<String, dynamic> json)
      : icon = json['icon'] ?? '',
        title = json['title'] ?? '',
        url = json['url'] ?? '',
        statusBarColor = json['statusBarColor'] ?? '',
        hideAppBar = json['hideAppBar'] ?? false;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'icon': icon,
        'title': title,
        'url': url,
        'statusBarColor': statusBarColor,
        'hideAppBar': hideAppBar,
      };
}
