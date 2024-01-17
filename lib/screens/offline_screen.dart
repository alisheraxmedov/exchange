import 'package:exchange/component/color.dart';
import 'package:exchange/component/const.dart';
import 'package:exchange/widgets/offline/bottom.dart';
import 'package:exchange/widgets/offline/top.dart';
import 'package:exchange/widgets/style.dart';
import 'package:flutter/material.dart';

class Offline extends StatefulWidget {
  static const String routeName = "/offline";
  const Offline({super.key});

  @override
  State<Offline> createState() => _OfflineState();
}

class _OfflineState extends State<Offline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ConstColor.white, size: 30.0),
        centerTitle: true,
        backgroundColor: ConstColor.purpleLight,
        title: Text(
          "Offline Mode",
          style: style(
            fontFamily: "Roboto",
            size: 30.0,
            color: ConstColor.white,
            weight: FontWeight.bold,
            spasing: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Top(
              label: ConstValue.offlineCurrensy,
            ),
            const Bottom(),
          ],
        ),
      ),
    );
  }
}
