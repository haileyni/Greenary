import 'package:flutter/material.dart';
import '../view_controller/recommendation_page.dart';

class ResultPage extends StatelessWidget {
  final Map<String, String> query;
  // final List<String> recommendedTrees;

  ResultPage({
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
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
            // 根据查询结果构建列表
            ListView.builder(
              shrinkWrap: true,
//              itemCount: recommendedTrees.length,
              itemBuilder: (context, index) {
                return ListTile(
//                  title: Text(recommendedTrees[index]),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
