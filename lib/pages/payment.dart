import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Payment extends StatelessWidget {
  const Payment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Buy Pulsa",
            style: GoogleFonts.quicksand(fontSize: 40),
          ),
          toolbarHeight: 100,
          backgroundColor: Color(0xFF7879F1),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter ID",
                style: GoogleFonts.quicksand(fontSize: 35),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(),
              SizedBox(
                height: 40,
              ),
              Text(
                "Nominal",
                style: GoogleFonts.quicksand(fontSize: 35),
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButton(items: []),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                      width: 351,
                      height: 51,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      child: Text('Confirm'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
