import 'package:exchange/model/model.dart';
import 'package:exchange/screens/home.dart';
import 'package:exchange/servises/api.dart';
import 'package:exchange/widgets/first.dart';
import 'package:exchange/widgets/offline/wait.dart';
import 'package:exchange/widgets/second.dart';
import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCurrensy(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Wait();
        }

        List<Currensy> lsCurrensy = snapshot.data!;
        currensyCopy = lsCurrensy;

        return SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            children: [
              First(
                label: lsCurrensy[0].rates,
              ),
              const Second(),
            ],
          ),
        );
      },
    );
  }
}
