import 'package:exchange/component/color.dart';
import 'package:exchange/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllCurrensy extends StatefulWidget {
  const AllCurrensy({super.key});

  @override
  State<AllCurrensy> createState() => _AllCurrensyState();
}

class _AllCurrensyState extends State<AllCurrensy> {
  List<String> keys = currensyCopy[0].rates.keys.toList();
  List<dynamic> value = currensyCopy[0].rates.values.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConstColor.purpleLight,
        title: Text(
          "All prices are in USD",
          style: GoogleFonts.inter(
            color: ConstColor.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: ConstColor.purpleDark,
      body: ListView.builder(
        itemCount: keys.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            child: ListTile(
              style: ListTileStyle.drawer,
              // tileColor: ConstColor.purpleLight,
              tileColor: ConstColor.purple,
              title: Text(
                keys[index].toString(),
                style: GoogleFonts.archivo(
                    fontSize: 20.0, color: ConstColor.white),
              ),
              trailing: Text(
                value[index].toString(),
                style: GoogleFonts.archivo(
                    fontSize: 20.0, color: ConstColor.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
