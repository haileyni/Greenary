import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../model/tree.dart';
import 'result_page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RecommendationPage extends StatefulWidget {
  @override
  _RecommendationPageState createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  String selectedDifficulty = 'easy';
  String selectedClimateZone = 'zone1';
  String selectedPlantType = 'vegetables';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommendation'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Select Climate Zone:',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'Check Climate Zone',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launch('https://gardengrow.co.nz/zones/');
                      },
                  ),
                ],
              ),
            ),
            DropdownButton<String>(
              value: selectedClimateZone,
              onChanged: (value) {
                setState(() {
                  selectedClimateZone = value!;
                });
              },
              items: ['zone1', 'zone2', 'zone3'].map((zone) {
                return DropdownMenuItem<String>(
                  value: zone,
                  child: Text(zone),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Select Difficulty:',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: selectedDifficulty,
              onChanged: (value) {
                setState(() {
                  selectedDifficulty = value!;
                });
              },
              items: ['easy', 'medium', 'difficult'].map((difficulty) {
                return DropdownMenuItem<String>(
                  value: difficulty,
                  child: Text(difficulty),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Select Plant Type:',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: selectedPlantType,
              onChanged: (value) {
                setState(() {
                  selectedPlantType = value!;
                });
              },
              items: ['vegetables', 'fruits'].map((type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // 处理选择并跳转到下一页
                final query = {
                  'difficulty': selectedDifficulty,
                  'zone': selectedClimateZone,
                  'plantType': selectedPlantType,
                };

                // 示例中使用空列表来代替实际数据
                final recommendedTrees = [];

                // 跳转到结果页面并传递查询结果
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      query: query,
                      //                   recommendedTrees: recommendedTrees,
                    ),
                  ),
                );
              },
              child: Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }
}
