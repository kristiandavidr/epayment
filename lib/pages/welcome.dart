import 'package:electronic_payment/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5D5FEF),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 89),
                child: Text(
                  'Welcome\n To our App',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.quicksand(fontSize: 40, color: Colors.white),
                ),
              ),
              SvgPicture.asset(
                'assets/images/welcomelogo.svg',
                height: 313,
                width: 217,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 37),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    width: 351,
                    height: 51,
                  ),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Login();
                        }));
                      },
                      child: Text(
                        'Continue',
                        style: GoogleFonts.quicksand(
                            color: Colors.black, fontSize: 26),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
