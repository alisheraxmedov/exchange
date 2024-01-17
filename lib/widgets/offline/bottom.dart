import 'package:exchange/component/color.dart';
import 'package:exchange/widgets/numbers.dart';
import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        color: ConstColor.purple,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumbersBtn(data: "7"),
                NumbersBtn(data: "8"),
                NumbersBtn(data: "9"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumbersBtn(data: "4"),
                NumbersBtn(data: "5"),
                NumbersBtn(data: "6"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumbersBtn(data: "1"),
                NumbersBtn(data: "2"),
                NumbersBtn(data: "3"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClearBtn(data: "C"),
                NumbersBtn(data: "0"),
                NumbersBtn(data: "."),
              ],
            ),
          ],
        ),
      ),
    );
  }
}