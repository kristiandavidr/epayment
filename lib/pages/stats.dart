import 'package:electronic_payment/components/chart.dart';
import 'package:electronic_payment/components/linechart.dart';
import 'package:electronic_payment/pages/scan.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Stats extends StatefulWidget {
  const Stats({Key key}) : super(key: key);

  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  String _chosenValue = '30 Days';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 35, right: 35),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Your Expenses",
                  style: GoogleFonts.quicksand(
                    fontSize: 25,
                  ),
                ),
              ),
              Chart(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Last Expenditure",
                    style: GoogleFonts.quicksand(fontSize: 20),
                  ),
                  SizedBox(
                    height: 26,
                    width: 116,
                    child: DropdownButton<String>(
                      value: _chosenValue,
                      //elevation: 5,
                      style: GoogleFonts.quicksand(
                          fontSize: 18, color: Colors.black),

                      items: <String>['30 Days', '3 Months', '1 Year']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          _chosenValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15, right: 15),
                child: LineChartSample2(),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Internet Payment"), Text("-Rp.200.000")],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
