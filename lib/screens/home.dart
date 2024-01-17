import 'package:exchange/model/model.dart';
import 'package:exchange/screens/all_currency.dart';
import 'package:exchange/screens/calculate.dart';
import 'package:flutter/material.dart';

// global varriable
String defaultCurrent = "USD";
String defaultConvert = "UZS";
List<Currensy> currensyCopy = [];

class Home extends StatefulWidget {
  static const routeName = "/home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [const Calculate(), const AllCurrensy()];
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return pages[index];
          },
        ),
      ),
    );
  }
}
