import 'package:flutter/material.dart';
import '../model/tree.dart';
import 'detail_page.dart';

class ResultPage extends StatelessWidget {
  final List<Tree> trees;
  final Map<String, String> query;

  ResultPage({
    required this.trees,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    print('ResultPage Built');

    // 获取 query 中的筛选条件
    String difficulty = query['difficulty'] ?? '';
    String selectedPlantType = query['plantType'] ?? '';

    // 将 selectedPlantType 字符串转换为 PlantType 枚举
    PlantType? plantType;
    if (selectedPlantType == 'Vegetable') {
      plantType = PlantType.Vegetable;
    } else if (selectedPlantType == 'Fruit') {
      plantType = PlantType.Fruit;
    }

    print("Selected plant type: $plantType");

    // 根据筛选条件筛选 trees 列表
    List<Tree> filteredTrees = trees.where((tree) {
      bool matchesDifficulty = tree.difficulty == difficulty;

      // 将 tree 的类型从整数转换为 PlantType 枚举
      PlantType treePlantType = databaseValueToPlantType(tree.type);
      bool matchesPlantType = treePlantType == plantType;

      print("Tree difficulty: ${tree.difficulty}, Matches: $matchesDifficulty");
      print("Tree type: $treePlantType, Matches: $matchesPlantType");

      return matchesDifficulty && matchesPlantType;
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
