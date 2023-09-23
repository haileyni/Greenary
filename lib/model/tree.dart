enum PlantType {
  Vegetable, //0
  Fruit, //1
}

int plantTypeToDatabaseValue(PlantType type) {
  return type.index; // 将枚举值转换为对应的索引
}

PlantType databaseValueToPlantType(int value) {
  return PlantType.values[value]; // 根据索引获取对应的枚举值
}

class Tree {
  final int id;
  final String name;
  final String info;
  final int type;
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
  final int tempMin;
  final int tempMax;
  String icon;

  Tree({
    required this.id,
    required this.name,
    required this.info,
    required this.type,
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
    required this.tempMin,
    required this.tempMax,
    required String icon,
  }) : this.icon = 'assets/icons/$icon.png';
}
