import 'package:flutter/material.dart';
import '../model/tree.dart';
import 'detail_page.dart';
import 'package:intl/intl.dart';

class ResultPage extends StatefulWidget {
  final List<Tree> trees;
  final Map<String, String> query;

  ResultPage({
    required this.trees,
    required this.query,
  });

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  DateTime? suitablePlantingTime;

  @override
  void initState() {
    super.initState();
    final String plantingTimeStr = widget.query['suitablePlantingTime'] ?? '';

    if (plantingTimeStr.isNotEmpty) {
      suitablePlantingTime = DateTime.tryParse(plantingTimeStr);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('ResultPage Built');

    // 获取 query 中的筛选条件
    String difficulty = widget.query['difficulty'] ?? '';
    String selectedPlantType = widget.query['plantType'] ?? '';
    double minTemperature = widget.query['tempMin'] != null
        ? double.parse(widget.query['tempMin']!)
        : double.negativeInfinity;
    double maxTemperature = widget.query['tempMax'] != null
        ? double.parse(widget.query['tempMax']!)
        : double.infinity;

    // 将 selectedPlantType 字符串转换为 PlantType 枚举
    PlantType? plantType;
    if (selectedPlantType == 'Vegetable') {
      plantType = PlantType.Vegetable;
    } else if (selectedPlantType == 'Fruit') {
      plantType = PlantType.Fruit;
    }

    print("Selected plant type: $plantType");

    // 根据筛选条件筛选 trees 列表
    List<Tree> filteredTrees = widget.trees.where((tree) {
      bool matchesDifficulty = tree.difficulty == difficulty;

      // 将 tree 的类型从整数转换为 PlantType 枚举
      PlantType treePlantType = databaseValueToPlantType(tree.type);
      bool matchesPlantType = treePlantType == plantType;

      // 检查温度是否在要求范围内
      bool matchesTemperature =
          tree.tempMin <= maxTemperature && tree.tempMax >= minTemperature;

      print("Tree difficulty: ${tree.difficulty}, Matches: $matchesDifficulty");
      print("Tree type: $treePlantType, Matches: $matchesPlantType");
      print(
          "Tree temp range: ${tree.tempMin}°C - ${tree.tempMax}°C, Matches: $matchesTemperature");

      return matchesDifficulty && matchesPlantType && matchesTemperature;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Recommendation Result'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Recommendations:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            if (suitablePlantingTime != null)
              Text(
                'Based on the weather forcast, Suitable Planting Time: ${DateFormat('yyyy-MM-dd').format(suitablePlantingTime!)}',
                style: TextStyle(fontSize: 18),
              ),
            // 根据筛选后的结果构建网格列表
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 6,
                ),
                itemCount: filteredTrees.length,
                itemBuilder: (context, index) {
                  final Tree tree = filteredTrees[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailPage(data: tree),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          tree.icon,
                          width: 90,
                          height: 90,
                        ),
                        SizedBox(height: 2),
                        Text(
                          tree.name,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
