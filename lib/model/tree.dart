class Tree {
  final int id;
  final String name;
  final String info;
  String icon;

  Tree({
    required this.id,
    required this.name,
    required this.info,
    required String icon,
  }) : this.icon = 'assets/icons/$icon.png';
}
