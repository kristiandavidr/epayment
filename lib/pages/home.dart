import 'package:electronic_payment/pages/notification.dart';
import 'package:electronic_payment/pages/payment.dart';
import 'package:electronic_payment/pages/scan.dart';
import 'package:electronic_payment/pages/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;

DateTime currentBackPressTime;

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: onWillPop,
          child: Stack(children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: CustomPaint(
                size: Size(
                    420,
                    (350 * 1.4257907542579076)
                        .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: RPSCustomPainter(),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 26, 30, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return User();
                              }));
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 26,
                                  backgroundImage: NetworkImage(
                                      "https://picsum.photos/seed/5/600"),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text("Name")
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.notifications_active_outlined),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Notif();
                              }));
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 36,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Balance",
                                style: GoogleFonts.quicksand(fontSize: 25)),
                            Text(
                              "Rp.120.000.000",
                              style: GoogleFonts.quicksand(fontSize: 26),
                            ),
                          ])
                    ],
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                Center(
                  child: Container(
                      width: 325,
                      height: 58,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(color: Color(0xffA5A6F6)),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 47,
                            height: 50,
                            child: FittedBox(
                              child: Column(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.arrow_forward_rounded),
                                  ),
                                  Text("Send")
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 47,
                            height: 50,
                            child: FittedBox(
                              child: Column(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.add),
                                  ),
                                  Text("Top up")
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 47,
                            height: 50,
                            child: FittedBox(
                              child: Column(
                                children: [
                                  IconButton(
                                      icon:
                                          Icon(Icons.arrow_circle_down_sharp)),
                                  Text("Receive")
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 51,
                ),
                Expanded(
                    child: Container(
                  width: 300,
                  height: 368,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: Color(0xffA5A6F6)),
                      color: Colors.white),
                  child: GridView(
                    padding: EdgeInsets.all(32),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      FittedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.settings_outlined),
                              color: Colors.black,
                              iconSize: 24,
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Payment();
                                }));
                              },
                            ),
                            Text(
                              'PLN',
                              style: GoogleFonts.quicksand(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      FittedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.settings_outlined),
                              color: Colors.black,
                              iconSize: 24,
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Payment();
                                }));
                              },
                            ),
                            Text(
                              'Telkom',
                              style: GoogleFonts.quicksand(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      FittedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.settings_outlined),
                              color: Colors.black,
                              iconSize: 24,
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Payment();
                                }));
                              },
                            ),
                            Text(
                              'Pulsa',
                              style: GoogleFonts.quicksand(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
                SizedBox(height: 20)
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.1473430);
    path_0.cubicTo(
        0,
        size.height * 0.1473430,
        size.width * 1.018623,
        size.height * -0.07953174,
        size.width * 1.073107,
        size.height * 0.02976553);
    path_0.cubicTo(
        size.width * 1.127594,
        size.height * 0.1390626,
        size.width * 1.073107,
        size.height * 0.9505119,
        size.width * 1.073107,
        size.height * 0.9505119);
    path_0.lineTo(size.width * 0.4868078, size.height * 0.9505119);
    path_0.lineTo(0, size.height * 0.9505119);
    path_0.lineTo(0, size.height * 0.1473430);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff5D5FEF).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9391727, size.height * 0.1729403);
    path_1.cubicTo(
        size.width * 0.9391727,
        size.height * 0.1729403,
        size.width * -0.07945109,
        size.height * -0.05393447,
        size.width * -0.1339355,
        size.height * 0.05536280);
    path_1.cubicTo(
        size.width * -0.1884200,
        size.height * 0.1646599,
        size.width * -0.1339355,
        size.height * 0.9761092,
        size.width * -0.1339355,
        size.height * 0.9761092);
    path_1.lineTo(size.width * 0.4523650, size.height * 0.9761092);
    path_1.lineTo(size.width * 0.9391727, size.height * 0.9761092);
    path_1.lineTo(size.width * 0.9391727, size.height * 0.1729403);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xffF178B6).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(0, size.height * 0.1968311);
    path_2.cubicTo(
        0,
        size.height * 0.1968311,
        size.width * 1.018623,
        size.height * -0.03004369,
        size.width * 1.073107,
        size.height * 0.07925358);
    path_2.cubicTo(size.width * 1.127594, size.height * 0.1885512,
        size.width * 1.073107, size.height, size.width * 1.073107, size.height);
    path_2.lineTo(size.width * 0.4868078, size.height);
    path_2.lineTo(0, size.height);
    path_2.lineTo(0, size.height * 0.1968311);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xff7879F1).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

Future<bool> onWillPop() {
  DateTime now = DateTime.now();
  if (currentBackPressTime == null ||
      now.difference(currentBackPressTime) > Duration(seconds: 2)) {
    currentBackPressTime = now;
    Fluttertoast.showToast(msg: "Press again to Exit");
    return Future.value(false);
  }
  return Future.value(true);
}
