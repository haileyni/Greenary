import 'package:flutter/material.dart';
import 'detail_page.dart';
import '../model/tree.dart';

class MyHomePage extends StatefulWidget {
  final List<Tree> trees;

  const MyHomePage({Key? key, required this.trees}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Home Page",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 6,
                ),
                itemCount: widget.trees.length,
                itemBuilder: (context, index) {
                  final Tree tree = widget.trees[index];

                  return GestureDetector(
                    onTap: () {
                      print("Grid Item tapped!");

                      Navigator.push(
                        context,
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
