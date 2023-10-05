import 'package:flutter/material.dart';
import '../model/tree.dart';

class DetailPage extends StatelessWidget {
  final Tree data;

  const DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // 使用滚动视图包装
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    data.icon,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${data.name}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Category: ${data.info}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Nutrition: ${data.nutritionalValue}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // 2x2 Grid for Sunlight, Difficulty, Humidity, Ripetime
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildParameterRow(Icons.wb_sunny, 'Sunlight', data.sunlight),
                  _buildParameterRow(Icons.star, 'Difficulty', data.difficulty),
                  _buildParameterRow(Icons.opacity, 'Humidity', data.humidity),
                  _buildParameterRow(
                      Icons.timelapse, 'Ripetime', data.ripetime),
                ],
              ),
              const SizedBox(height: 16),
              // Water, Fertilizer, Soil, Tips
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildParameterRow(Icons.shower, 'Water', data.water),
                  const SizedBox(height: 6),
                  _buildParameterRow(Icons.eco, 'Fertilizer', data.fertilizer),
                  const SizedBox(height: 6),
                  _buildParameterRow(Icons.grass, 'Soil', data.soil),
                  const SizedBox(height: 6),
                  _buildParameterRow(Icons.lightbulb, 'Tips', data.tips),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParameterRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.green,
          size: 32, // 调整图标大小
        ),
        const SizedBox(width: 8),
        Expanded(
          // 使用 Expanded 让文本适应屏幕
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
