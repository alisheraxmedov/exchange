import 'package:exchange/component/color.dart';
import 'package:exchange/screens/home.dart';
import 'package:exchange/widgets/info_update.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextEditingController amountController = TextEditingController();
TextEditingController convertedController = TextEditingController();

class First extends StatefulWidget {
  final Map<String, dynamic> label;
  const First({
    super.key,
    required this.label,
  });
  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
//=========================================================================
    List<DropdownMenuItem<String>> dropdownItems =
        widget.label.keys.map<DropdownMenuItem<String>>((String key) {
      return DropdownMenuItem<String>(
        value: key,
        child: Text(key),
      );
    }).toList();
//=========================================================================

    return Expanded(
      flex: 6,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.purple.shade800,
              Colors.purple.shade900,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Update(
                last: currensyCopy[0].lastUpdates.substring(1, 16),
                next: currensyCopy[0].nextUpdates.substring(1, 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: DropdownButton<String>(
                    style: GoogleFonts.roboto(
                        color: ConstColor.white, fontSize: 30.0),
                    dropdownColor: const Color.fromARGB(255, 180, 33, 243),
                    iconEnabledColor: Colors.white,
                    menuMaxHeight: 300,
                    elevation: 0,
                    value: defaultCurrent,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          defaultCurrent = newValue;
                        });
                      }
                    },
                    items: dropdownItems,
                  ),
                ),
                const SizedBox(
                  width: 50.0,
                ),
                //========================= Qiymat kiritiladigan field =========================
                SizedBox(
                  width: 180,
                  height: 45,
                  child: TextField(
                    cursorColor: ConstColor.white,
                    textAlign: TextAlign.end,
                    style: GoogleFonts.roboto(
                      color: ConstColor.white,
                      fontSize: 22.0,
                    ),
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    controller: amountController,
                    keyboardType: TextInputType.none,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 20.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        String value = defaultCurrent;
                        defaultCurrent = defaultConvert;
                        defaultConvert = value;
                      });
                    },
                    icon: const Icon(Icons.import_export,
                        size: 40.0, color: ConstColor.white),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: DropdownButton<String>(
                    style: GoogleFonts.roboto(
                      color: ConstColor.white,
                      fontSize: 30.0,
                    ),
                    menuMaxHeight: 300,
                    dropdownColor: const Color.fromARGB(255, 180, 33, 243),
                    iconEnabledColor: Colors.white,
                    value: defaultConvert,
                    onChanged: (String? newValue) {
                      // handle dropdown item selection
                      if (newValue != null) {
                        setState(() {
                          defaultConvert = newValue;
                        });
                      }
                    },
                    items: dropdownItems,
                  ),
                ),
                const SizedBox(
                  width: 50.0,
                ),
                SizedBox(
                  width: 180,
                  height: 45,
                  child: TextField(
                    cursorColor: ConstColor.white,
                    textAlign: TextAlign.end,
                    style: GoogleFonts.roboto(
                      color: ConstColor.white,
                      fontSize: 15.0,
                    ),
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    controller: convertedController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: ConstColor.white,
                      thickness: 2.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (amountController.text.isNotEmpty) {
                        // print("from: ${currensyCopy[0].rates[defaultCurrent]}");
                        // print("from Type: ${currensyCopy[0].rates[defaultCurrent].runtimeType}");

                        // print("to: ${currensyCopy[0].rates[defaultConvert]}");
                        // print("to Type: ${currensyCopy[0].rates[defaultConvert].runtimeType}");

                        // print("value: ${amountController.text}");
                        // print("value Type: ${amountController.text.runtimeType}");

                        double dollor = double.parse(amountController.text) /
                            currensyCopy[0].rates[defaultCurrent];
                        double result =
                            dollor * currensyCopy[0].rates[defaultConvert];
                        convertedController.text = result.toString();
                      } else {
                        convertedController.text = "0.0";
                      }
                    },
                    icon: const Icon(
                      Icons.change_circle_outlined,
                      size: 50.0,
                      color: ConstColor.white,
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: ConstColor.white,
                      thickness: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
