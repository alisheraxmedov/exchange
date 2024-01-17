import 'package:exchange/component/color.dart';
import 'package:exchange/widgets/text.dart';
import 'package:flutter/material.dart';

class Update extends StatelessWidget {
  final String last;
  final String next;
  const Update({
    super.key,
    required this.last,
    required this.next,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          height: MediaQuery.sizeOf(context).width * 0.09,
          child: Column(
            children: [
              Row(
                children: [
                  TextWidget(
                    data: "   Last update: $last",
                    size: 11.0,
                    color: ConstColor.white,
                  ),
                ],
              ),
              Row(
                children: [
                  TextWidget(
                    data: "   Next update: $next",
                    size: 11.0,
                    color: ConstColor.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
