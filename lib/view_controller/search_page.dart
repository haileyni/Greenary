import 'package:flutter/material.dart';
import '../model/tree.dart';
import 'detail_page.dart';

class T_SearchController extends StatefulWidget {
  final List<Tree> trees;

  const T_SearchController({Key? key, required this.trees}) : super(key: key);

  @override
  _T_SearchControllerState createState() => _T_SearchControllerState();
}

class _T_SearchControllerState extends State<T_SearchController> {
  List<Tree> _filteredTrees = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredTrees = []; // 初始空白
    // _filteredTrees = widget.trees; // 初始包含全部
  }

  _filterSearchResults(String query) {
    List<Tree> searchResult = [];
    if (query.isNotEmpty) {
      for (var tree in widget.trees) {
        if (tree.name.toLowerCase().contains(query.toLowerCase())) {
          searchResult.add(tree);
        }
      }
      setState(() {
        _filteredTrees = searchResult;
      });
    } else {
      setState(() {
        _filteredTrees = []; // 清除搜索后空白
        // _filteredTrees = widget.trees; // 清除搜索后展示全部数据
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                _filterSearchResults(value);
              },
              decoration: InputDecoration(
                labelText: "Search",
                hintText: "Search for trees",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 6,
              ),
              itemCount: _filteredTrees.length,
              itemBuilder: (context, index) {
                final Tree tree = _filteredTrees[index];

                return GestureDetector(
                  onTap: () {
                    // Handle tap
                    Navigator.of(context).push(
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
    );
  }
}
