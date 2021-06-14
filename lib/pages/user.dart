import 'package:electronic_payment/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class User extends StatelessWidget {
  const User({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color(0xFF5D5FEF),
              height: 160,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          NetworkImage("https://picsum.photos/seed/5/600"),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name Here",
                          style: GoogleFonts.quicksand(fontSize: 22),
                        ),
                        Text(
                          "ID Here",
                          style: GoogleFonts.quicksand(fontSize: 22),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person),
                          Text(
                            "Account",
                            style: GoogleFonts.quicksand(fontSize: 20),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Full Name"),
                            Text("Name here"),
                            Row(
                              children: [
                                Text("Change"),
                                IconButton(
                                    icon: Icon(Icons.keyboard_arrow_right))
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Email"),
                            Text("Email here"),
                            Row(
                              children: [
                                Text("Change"),
                                IconButton(
                                    icon: Icon(Icons.keyboard_arrow_right))
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Phone Number"),
                            Text("Phone here"),
                            Row(
                              children: [
                                Text("Change"),
                                IconButton(
                                    icon: Icon(Icons.keyboard_arrow_right))
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                )),
            Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.lock_outline),
                          Text(
                            "Security",
                            style: GoogleFonts.quicksand(fontSize: 20),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("PIN"),
                            Row(
                              children: [
                                Text("Change"),
                                IconButton(
                                    icon: Icon(Icons.keyboard_arrow_right))
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                )),
            Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person),
                          Text(
                            "About",
                            style: GoogleFonts.quicksand(fontSize: 20),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Help"),
                            IconButton(icon: Icon(Icons.keyboard_arrow_right))
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Terms & Conditions"),
                            IconButton(icon: Icon(Icons.keyboard_arrow_right))
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Privacy Policy"),
                            IconButton(icon: Icon(Icons.keyboard_arrow_right))
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                )),
            InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return Welcome();
                }), (Route<dynamic> route) => false);
              },
              child: Container(
                color: Color(0xFF5D5FEF),
                width: double.infinity,
                height: 75,
                child: Center(
                    child: Text(
                  "Sign Out",
                  style:
                      GoogleFonts.quicksand(fontSize: 25, color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
