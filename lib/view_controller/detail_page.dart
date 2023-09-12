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
            Text(
              'Name: ${data.name}',
              style: TextStyle(fontSize: 24), // 更改字体大小为18
            ),
            Text(
              'Info: ${data.info}',
              style: TextStyle(fontSize: 18), // 更改字体大小为18
            ),
            SizedBox(height: 16),
            Image.asset(data.icon, width: 100, height: 100),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Icon(Icons.water),
                      SizedBox(height: 8), // 增加垂直间距
                      Text(
                        'Humidity: ${data.humidity}',
                        style: TextStyle(fontSize: 18), // 更改字体大小为18
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Icon(Icons.wb_sunny),
                      SizedBox(height: 8), // 增加垂直间距
                      Text(
                        'Sunlight: ${data.sunlight}',
                        style: TextStyle(fontSize: 18), // 更改字体大小为18
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Icon(Icons.star),
                      SizedBox(height: 8), // 增加垂直间距
                      Text(
                        'Difficulty: ${data.difficulty}',
                        style: TextStyle(fontSize: 18), // 更改字体大小为18
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Icon(Icons.timer),
                      SizedBox(height: 8), // 增加垂直间距
                      Text(
                        'Ripe Time: ${data.ripetime}',
                        style: TextStyle(fontSize: 18), // 更改字体大小为18
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(height: 16), // 增加垂直间距
            Text(
              'Water: ${data.water}',
              style: TextStyle(fontSize: 18), // 更改字体大小为18
            ),
            SizedBox(height: 8), // 增加垂直间距
            Text(
              'Fertilizer: ${data.fertilizer}',
              style: TextStyle(fontSize: 18), // 更改字体大小为18
            ),
            SizedBox(height: 8), // 增加垂直间距
            Text(
              'Soil: ${data.soil}',
              style: TextStyle(fontSize: 18), // 更改字体大小为18
            ),
            SizedBox(height: 8), // 增加垂直间距
            Text(
              'Tips: ${data.tips}',
              style: TextStyle(fontSize: 18), // 更改字体大小为18
            ),
          ],
        ),
      ),
    );
  }
}
