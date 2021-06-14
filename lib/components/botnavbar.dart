import 'package:electronic_payment/pages/home.dart';
import 'package:electronic_payment/pages/scan.dart';
import 'package:electronic_payment/pages/stats.dart';
import 'package:flutter/material.dart';

class BotNavBar extends StatefulWidget {
  BotNavBar({Key key}) : super(key: key);

  @override
  _BotNavBarState createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int _selectedIndex = 0;

  final tabs = [Home(), Stats()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Stats"),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_box_outlined),
        tooltip: "Pay",
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Scan();
          }));
        },
      ),
    );
  }
}
