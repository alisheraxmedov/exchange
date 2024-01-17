import 'package:exchange/routes.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    const Header(),
  );
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
    );
  }
}