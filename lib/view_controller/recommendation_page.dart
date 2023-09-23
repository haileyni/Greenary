import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../model/tree.dart';
import 'result_page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RecommendationPage extends StatefulWidget {
  final List<Tree> trees;

  const RecommendationPage({Key? key, required this.trees}) : super(key: key);

  @override
  _RecommendationPageState createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  String selectedDifficulty = 'Easy';
  String selectedClimateZone = 'zone1';
  String selectedPlantType = 'Vegetable';

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
              items: ['Easy', 'Medium', 'Difficult'].map((difficulty) {
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
              items: ['Vegetable', 'Fruit'].map((type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final query = {
                  'difficulty': selectedDifficulty,
                  'zone': selectedClimateZone,
                  'plantType': selectedPlantType,
                };

                print("q_dict: $query");

                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      trees: widget.trees,
                      query: query,
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
