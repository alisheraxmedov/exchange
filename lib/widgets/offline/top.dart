import 'package:exchange/component/color.dart';
import 'package:exchange/screens/home.dart';
import 'package:exchange/widgets/first.dart';
import 'package:exchange/widgets/style.dart';
import 'package:flutter/material.dart';

class Top extends StatefulWidget {
  final Map<String, dynamic> label;
  // Constructor
  const Top({
    super.key,
    required this.label,
  });

  @override
  State<Top> createState() => _TopState();
}

class _TopState extends State<Top> {
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
            // Update(
            //     last: currensyCopy[0].lastUpdates.substring(1, 16),
            //     next: currensyCopy[0].nextUpdates.substring(1, 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: DropdownButton<String>(
                    style: style(
                      fontFamily: 'Roboto',
                      size: 30.0,
                      color: ConstColor.white,
                    ),
                    // GoogleFonts.roboto(
                    //     color: ConstColor.white, fontSize: 30.0),
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
                    style: style(
                      fontFamily: "Roboto",
                      size: 25.0,
                      color: ConstColor.white,
                    ),
                    // GoogleFonts.roboto(
                    //   color: ConstColor.white,
                    //   fontSize: 25.0,
                    // ),
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
                    icon: const Icon(
                      Icons.import_export,
                      size: 40.0,
                      color: ConstColor.white,
                    ),
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
                    style: style(
                      fontFamily: 'Roboto',
                      size: 30.0,
                      color: ConstColor.white,
                    ),
                    // GoogleFonts.roboto(
                    //   color: ConstColor.white,
                    //   fontSize: 30.0,
                    // ),
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
                    style: style(
                      fontFamily: 'Roboto',
                      size: 10.0,
                      color: ConstColor.white,
                    ),
                    // GoogleFonts.roboto(
                    //   color: ConstColor.white,
                    //   fontSize: 10.0,
                    //   // convertedController.text.length < 5 ? 25.0 : 14.0,
                    // ),
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
                        double dollor = double.parse(amountController.text) /
                            widget.label[defaultCurrent];
                        double result = dollor * widget.label[defaultConvert];
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
