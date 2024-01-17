import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String data;
  final double size;
  final Color color;

  const TextWidget({
    super.key,
    required this.data,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.roboto(
        fontSize: size,
        color: color,
      ),
    );
  }
}
