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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.wb_sunny),
                        Text('Sunlight: ${data.sunlight}',
                            style: const TextStyle(fontSize: 18)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.opacity),
                        Text('Humidity: ${data.humidity}',
                            style: const TextStyle(fontSize: 18)),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star),
                        Text('Difficulty: ${data.difficulty}',
                            style: const TextStyle(fontSize: 18)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.timelapse),
                        Text('Ripetime: ${data.ripetime}',
                            style: const TextStyle(fontSize: 18)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('Water: ${data.water}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 6),
            Text('Fertilizer: ${data.fertilizer}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 6),
            Text('Soil: ${data.soil}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 6),
            Text('Tips: ${data.tips}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
