import 'package:flutter/material.dart';
import '../model/tree.dart';
import 'result_page.dart';
import 'dart:convert'; // 用于解析 JSON
import 'dart:io';

class RecommendationPage extends StatefulWidget {
  final List<Tree> trees;

  const RecommendationPage({Key? key, required this.trees}) : super(key: key);

  @override
  _RecommendationPageState createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  String selectedDifficulty = 'Easy';
  String selectedPlantType = 'Vegetable';
  double todayTemperature = 0.0; // 存储今天的温度，默认为0.0
  String todayWeather = ''; // 存储今天的天气情况，默认为空字符串
  DateTime? suitablePlantingTime; // 存储适合种植的时间

  Future<void> fetchData() async {
    try {
      final String weatherUrl =
          'https://api.openweathermap.org/data/2.5/weather?lat=-36.85582&lon=174.743042&appid=245bb630f5438d4405ede934399dfe4792826';
      final HttpClient client = HttpClient();
      final Uri uri = Uri.parse(weatherUrl);
      final HttpClientRequest request = await client.getUrl(uri);
      final HttpClientResponse response = await request.close();
      final String responseBody = await response.transform(utf8.decoder).join();
      final Map<String, dynamic> weatherData = json.decode(responseBody);

      // 提取温度数据并将其转换为摄氏度
      final double todayTemp = (weatherData['main']['temp'] - 273.15);

      // 提取天气情况
      final List<dynamic> weatherInfo = weatherData['weather'];
      if (weatherInfo.isNotEmpty) {
        todayWeather = weatherInfo[0]['main'];
      }

      // 请求天气预报信息
      final String weatherForecastUrl =
          'https://api.openweathermap.org/data/2.5/forecast?lat=-36.85582&lon=174.743042&appid=245bb630f5438d4405ede934399dfe4792826';
      final Uri forecastUri = Uri.parse(weatherForecastUrl);
      final HttpClientRequest forecastRequest =
          await client.getUrl(forecastUri);
      final HttpClientResponse forecastResponse = await forecastRequest.close();
      final String forecastResponseBody =
          await forecastResponse.transform(utf8.decoder).join();
      final Map<String, dynamic> weatherForecastData =
          json.decode(forecastResponseBody);

      // 提取天气预报信息
      final List<dynamic> forecastList = weatherForecastData['list'];

      if (forecastList.isNotEmpty) {
        for (var forecast in forecastList) {
          final String forecastWeather = forecast['weather'][0]['main'];
          final DateTime forecastDate = DateTime.fromMillisecondsSinceEpoch(
                  forecast['dt'] * 1000,
                  isUtc: true)
              .toLocal();

          // 检查天气是否适合种植
          if (forecastWeather == 'Sunny' || forecastWeather == 'Clouds') {
            suitablePlantingTime = forecastDate;
            break; // 找到适合的时间后，跳出循环
          }
        }
      }

      setState(() {
        todayTemperature = todayTemp;
      });
    } catch (e) {
      print('Exception fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await fetchData();
    });
  }

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
            SizedBox(height: 16), // 添加 16 的间距
            Row(
              children: [
                Icon(
                  Icons.thermostat,
                  color: Colors.green,
                  size: 32, // 绿色图标
                ),
                SizedBox(width: 8), // 图标和文本之间的间距
                Text(
                  "Today's Temperature: ${todayTemperature.toStringAsFixed(2)}°C\n",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16), // 添加 16 的间距
            Row(
              children: [
                Icon(
                  Icons.cloud,
                  color: Colors.green,
                  size: 32, // 绿色图标
                ),
                SizedBox(width: 8), // 图标和文本之间的间距
                Text(
                  "Today's Weather: $todayWeather\n",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // 添加 20 的间距
            Text(
              'Select Difficulty:',
              style: TextStyle(fontSize: 20), // 更改字体大小为 18
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
                  child: Text(difficulty, style: TextStyle(fontSize: 18)),
                );
              }).toList(),
            ),
            SizedBox(height: 20), // 添加 20 的间距
            Text(
              'Select Plant Type:',
              style: TextStyle(fontSize: 20), // 更改字体大小为 18
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
                  child: Text(type, style: TextStyle(fontSize: 18)),
                );
              }).toList(),
            ),
            SizedBox(height: 20), // 添加 20 的间距
            ElevatedButton(
              onPressed: () {
                // 筛选出满足温度条件的树
                final filteredTrees = widget.trees.where((tree) {
                  return tree.tempMin <= todayTemperature &&
                      todayTemperature <= tree.tempMax;
                }).toList();

                final query = {
                  'difficulty': selectedDifficulty,
                  'weather': todayWeather, // 将今天的天气情况传递给查询
                  'plantType': selectedPlantType,
                  'suitablePlantingTime': suitablePlantingTime
                          ?.toIso8601String() ??
                      '', // Use an empty string if suitablePlantingTime is null
                };

                print("Query: $query");

                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      trees: filteredTrees, // 传递筛选后的树列表
                      query: query,
                    ),
                  ),
                );
              },
              child: Text(
                'Apply',
                style: TextStyle(fontSize: 24), // 增大字体大小为 24
              ),
            ),
          ],
        ),
      ),
    );
  }
}
