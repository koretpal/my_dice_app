import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'dart:math';
//import 'device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int dicenumber1 = 1;
  int dicenumber2 = 2;
  int rndnumber = 1;
  int rndnumber2 = 1;
  void changedice() {
    setState(() {
      rndnumber = Random().nextInt(6) + 1;
      rndnumber2 = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Dice app'),
        ),
        body: SafeArea(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      changedice();
                      print('left button got pressed');
                      //  Image.asset('images/image$rndnumber.png');
                    },
                    child: Image.asset('images/image$rndnumber.png'),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        rndnumber2 = Random().nextInt(6) + 1;
                        rndnumber = Random().nextInt(6) + 1;
                      });
                      print('right button got pressed');
                    },
                    child: Image.asset('images/image$rndnumber2.png'),
                  ),
                ),
                // Image.asset('images/image$dicenumber2.png'),
                // Image.asset('images/image$dicenumber1.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
