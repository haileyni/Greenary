import 'package:flutter/material.dart';
import 'data/data_manager.dart';
import 'model/tree.dart';
import 'view_controller/main_tab_controller.dart'; // new

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List Example',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FutureBuilder<List<Tree>>(
        future: DataManager.getTrees(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error occurred'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          }

          final List<Tree> trees = snapshot.data!;
          return MainTabController(trees: trees);
        },
      ),
    );
  }
}
