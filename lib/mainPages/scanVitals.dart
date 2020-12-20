import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';
import 'package:charts_flutter/flutter.dart';

class ScanVitals extends StatefulWidget {
  @override
  _ScanVitalsState createState() => _ScanVitalsState();
}

class _ScanVitalsState extends State<ScanVitals> {
  bool _toggled = false;
  _toggle() {
    setState(() {
      _toggled = true;
    });
  }

  _untoggle() {
    setState(() {
      _toggled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: IconButton(
            icon: Icon(_toggled ? Icons.favorite : Icons.favorite_border),
            color: Colors.red,
            iconSize: 128,
            onPressed: () {
              if (_toggled) {
                _untoggle();
              } else {
                _toggle();
              }
            },
          ),
        ),
      ),
    );
  }
}
