import 'package:exchange/component/color.dart';
import 'package:exchange/widgets/first.dart';
import 'package:exchange/widgets/text.dart';
import 'package:flutter/material.dart';

class NumbersBtn extends StatefulWidget {
  final String data;
  const NumbersBtn({
    super.key,
    required this.data,
  });

  @override
  State<NumbersBtn> createState() => _NumbersBtnState();
}

class _NumbersBtnState extends State<NumbersBtn> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          amountController.text += widget.data;
        });
      },
      child: TextWidget(
        data: widget.data,
        size: 35.0,
        color: ConstColor.white,
      ),
    );
  }
}

class ClearBtn extends StatelessWidget {
  final String data;
  const ClearBtn({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        amountController.clear();
        convertedController.clear();
      },
      child: TextWidget(
        data: data,
        size: 35.0,
        color: ConstColor.red,
      ),
    );
  }
}
