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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: ${data.name}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              'Info: ${data.info}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Image.asset(data.icon, width: 100, height: 100),
          ],
        ),
      ),
    );
  }
}
