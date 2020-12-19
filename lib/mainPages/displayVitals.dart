import 'package:flutter/material.dart';
import 'package:my_app/sharedWidgets/sizeConfig.dart';
import 'package:hexcolor/hexcolor.dart';

class DisplayVitals extends StatefulWidget {
  @override
  _DisplayVitalsState createState() => _DisplayVitalsState();
}

class _DisplayVitalsState extends State<DisplayVitals> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: null,
                  iconSize: SizeConfig.blockSizeHorizontal * 50,
                  color: Colors.red),
              Text(
                "patientID",
                style: TextStyle(
                    fontFamily: 'Open-Sans',
                    fontSize: SizeConfig.safeBlockHorizontal * 6,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Display Heart Rate",
                style: TextStyle(
                    fontFamily: 'Open-Sans',
                    fontSize: SizeConfig.safeBlockHorizontal * 10.5,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
