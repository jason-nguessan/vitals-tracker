import 'package:flutter/material.dart';
import 'package:my_app/sharedWidgets/sizeConfig.dart';
import 'package:hexcolor/hexcolor.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.safeBlockHorizontal * 0,
            SizeConfig.safeBlockVertical * 0,
            SizeConfig.safeBlockHorizontal * 0,
            SizeConfig.safeBlockVertical * 0),
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Material(
                          borderRadius: BorderRadius.all(
                            Radius.circular(SizeConfig.blockSizeVertical * 20),
                          ),
                          elevation: 3,
                          child: Container(
                            height: SizeConfig.blockSizeVertical * 7.2,
                            width: SizeConfig.blockSizeHorizontal * 72,
                            child: TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              decoration: new InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      SizeConfig.safeBlockHorizontal * 4,
                                      SizeConfig.safeBlockVertical * 3,
                                      0,
                                      SizeConfig.safeBlockVertical * 2),
                                  border: new OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          SizeConfig.blockSizeVertical * 20),
                                    ),
                                  ),
                                  hintText: "Enter Your patient ID"),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please enter your patient ID';
                                } else {
                                  setState(() {});
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RaisedButton(
                              padding: const EdgeInsets.all(0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                      SizeConfig.blockSizeVertical * 20),
                                ),
                                side: BorderSide(color: Colors.white),
                              ),
                              child: Container(
                                  width: SizeConfig.blockSizeHorizontal * 35,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        HexColor("#e4b9fa"),
                                        HexColor("#d9b9fa"),
                                        HexColor("#b9bffa")
                                      ],
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          SizeConfig.blockSizeVertical * 20),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text("Check Vitals",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15)),
                                  ),
                                  padding: EdgeInsets.all(
                                      SizeConfig.safeBlockHorizontal * 3.5)),
                              onPressed: () {},
                            ),
                            RaisedButton(
                              padding: const EdgeInsets.all(0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                      SizeConfig.blockSizeVertical * 20),
                                ),
                                side: BorderSide(color: Colors.white),
                              ),
                              child: Container(
                                  width: SizeConfig.blockSizeHorizontal * 35,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        HexColor("#e4b9fa"),
                                        HexColor("#d9b9fa"),
                                        HexColor("#b9bffa")
                                      ],
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          SizeConfig.blockSizeVertical * 20),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text("Scan",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15)),
                                  ),
                                  padding: EdgeInsets.all(
                                      SizeConfig.safeBlockHorizontal * 3.5)),
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
