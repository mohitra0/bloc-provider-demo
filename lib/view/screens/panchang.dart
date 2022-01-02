import 'package:flutter/material.dart';

class PanChang extends StatefulWidget {
  const PanChang({Key key}) : super(key: key);

  @override
  _PanChangState createState() => _PanChangState();
}

class _PanChangState extends State<PanChang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          'assets/logo.png',
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        leading: IconButton(
            icon: Image.asset(
              'assets/hamburger.png',
              width: 20,
            ),
            onPressed: () {}),
        actions: [
          IconButton(
              icon: Image.asset(
                'assets/profile.png',
                width: 26,
              ),
              onPressed: null)
        ],
      ),
    );
  }
}
