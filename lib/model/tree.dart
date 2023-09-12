class Tree {
  final int id;
  final String name;
  final String info;
  final String nutritionalValue;
  final String culinaryUses;
  final String difficulty;
  final String ripetime;
  final String bestPlantingTimeZone1;
  final String bestPlantingTimeZone2;
  final String bestPlantingTimeZone3;
  final String humidity;
  final String temperature;
  final String sunlight;
  final String soil;
  final String water;
  final String fertilizer;
  final String tips;
  String icon;

  Tree({
    required this.id,
    required this.name,
    required this.info,
    required this.nutritionalValue,
    required this.culinaryUses,
    required this.difficulty,
    required this.ripetime,
    required this.bestPlantingTimeZone1,
    required this.bestPlantingTimeZone2,
    required this.bestPlantingTimeZone3,
    required this.humidity,
    required this.temperature,
    required this.sunlight,
    required this.soil,
    required this.water,
    required this.fertilizer,
    required this.tips,
    required String icon,
  }) : this.icon = 'assets/icons/$icon.png';
}
