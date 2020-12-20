import 'package:flutter/material.dart';
import 'package:my_app/sharedWidgets/sizeConfig.dart';
import 'package:hexcolor/hexcolor.dart';

class DisplayVitals extends StatefulWidget {
  @override
  _DisplayVitalsState createState() => _DisplayVitalsState();
}

class _DisplayVitalsState extends State<DisplayVitals>
    with TickerProviderStateMixin {
  AnimationController motionController;
  Animation motionAnimation;
  double size = SizeConfig.blockSizeHorizontal * 180;
  void initState() {
    super.initState();

    motionController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      lowerBound: .5,
    );

    motionAnimation = CurvedAnimation(
      parent: motionController,
      curve: Curves.ease,
    );

    motionController.forward();
    motionController.addStatusListener((status) {
      setState(() {
        if (status == AnimationStatus.completed) {
          motionController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          motionController.forward();
        }
      });
    });

    motionController.addListener(() {
      setState(() {
        size = motionController.value * 280;
      });
    });
    // motionController.repeat();
  }

  @override
  void dispose() {
    motionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.safeBlockHorizontal * 0,
            SizeConfig.safeBlockVertical * 5,
            SizeConfig.safeBlockHorizontal * 0,
            SizeConfig.safeBlockVertical * 0),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: SizeConfig.blockSizeVertical * 40,
                child: IconButton(
                  icon: Icon(Icons.favorite, color: Colors.red),
                  onPressed: null,
                  iconSize: size,
                ),
              ),
              SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
              Text(
                "patientID",
                style: TextStyle(
                    fontFamily: 'Open-Sans',
                    fontSize: SizeConfig.safeBlockHorizontal * 6,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
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
