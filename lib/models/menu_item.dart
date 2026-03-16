class MenuItem {
  final String title;
  final String route;
  final String screenName;
  final String? imageUrl;
  final dynamic arguments;

  MenuItem({
    required this.title,
    required this.route,
    required this.screenName,
    this.imageUrl,
    this.arguments,
  });
}
