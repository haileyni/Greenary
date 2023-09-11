import 'package:flutter/material.dart';
import 'detail_page.dart';
import '../model/tree.dart';

class MyHomePage extends StatelessWidget {
  final List<Tree> trees;

  const MyHomePage({Key? key, required this.trees}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Example'),
      ),
      body: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: trees.length,
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
        ),
        itemBuilder: (context, index) {
          final Tree tree = trees[index];

          return ListTile(
            leading: Image.asset(
              tree.icon,
              width: 40,
              height: 40,
            ),
            title: Text(tree.name),
            subtitle: Text(tree.info),
            onTap: () {
              print("ListTile tapped!");

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(data: tree),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
