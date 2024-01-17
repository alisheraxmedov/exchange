import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SaveDataForOfflineMode{
//======================= save data ======================= 
Future<void> saveData(Map<String, dynamic> data) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String jsonData = json.encode(data);
  prefs.setString('currensy', jsonData);
}
//======================= load data ======================= 
Future<Map<String, dynamic>> loadData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String jsonData = prefs.getString('currensy') ?? '{}';
  return json.decode(jsonData);
}
//======================= update data ======================= 

}