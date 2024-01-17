import 'package:exchange/screens/home.dart';
import 'package:exchange/screens/offline_screen.dart';
import 'package:exchange/widgets/snackbar.dart';
import 'package:flutter/material.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Home.routeName:
      return MaterialPageRoute(builder: (contex) => const Home());
    case Offline.routeName:
      return MaterialPageRoute(builder: (contex) => const Offline());
    case Snackbar.routeName:
      return MaterialPageRoute(builder: (contex) => const Snackbar());
    default:
      return MaterialPageRoute(
        builder: (contex) => const Scaffold(
          body: Center(
            child: Text(
              "Page Not Nound",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      );
  }
}
