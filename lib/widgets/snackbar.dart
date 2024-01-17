import 'package:exchange/component/color.dart';
import 'package:exchange/screens/offline_screen.dart';
import 'package:flutter/material.dart';

class Snackbar extends StatefulWidget {
  static const String routeName = "/check";
  const Snackbar({super.key});

  @override
  State<Snackbar> createState() => _SnackbarState();
}

class _SnackbarState extends State<Snackbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.purple,
      body: RefreshIndicator(
        backgroundColor: ConstColor.black,
        color: ConstColor.white,
        onRefresh: () async {
          // await Future.delayed(const Duration(seconds: 2));
          setState(() {});
        },
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 60.0,
                color: ConstColor.white,
              ),
              SizedBox(height: 25.0),
              Text(
                "Internet may be slow or unavailable",
                style: TextStyle(
                  fontFamily: 'RoadRage',
                  fontSize: 35.0,
                  color: ConstColor.white,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 120.0,
        color: ConstColor.purple,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).width * .18,
                width: MediaQuery.sizeOf(context).width * .85,
                decoration: BoxDecoration(
                  color: ConstColor.purpleLight,
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Offline.routeName);
                  },
                  child: const Text(
                    "Offline mode",
                    style: TextStyle(
                      fontFamily: 'RoadRage',
                      fontSize: 35.0,
                      color: ConstColor.white,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
