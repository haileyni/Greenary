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
      debugShowCheckedModeBanner: false, // 隐藏虚拟机上的 "Debug" 字样

      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Home Page",
            style: TextStyle(
              fontSize: 24, // 增大标题字体大小
            ),
          ),
          backgroundColor: Colors.green, // 更改 AppBar 的背景颜色为绿色
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 每行显示2个项目
                  mainAxisSpacing: 1, // 在主轴上设置行之间的间距
                  crossAxisSpacing: 6, // 在交叉轴上设置列之间的间距
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
                        SizedBox(height: 2), // 图片和名称之间的间距
                        Text(
                          tree.name,
                          style: TextStyle(
                            fontSize: 20, // 增大名称字体大小
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
