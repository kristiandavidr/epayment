import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notif extends StatelessWidget {
  const Notif({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Notification'),
        backgroundColor: Color(0xffA5A6F6),
      ),
      body: ListView(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
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
                        "New Promo",
                        style: GoogleFonts.quicksand(fontSize: 12),
                      ),
                      Text(
                        "promo here",
                        style: GoogleFonts.quicksand(fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
