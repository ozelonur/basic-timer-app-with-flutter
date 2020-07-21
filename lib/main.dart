import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(TimerApp());

class TimerApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TimerAppState();
  }
}

class TimerAppState extends State<TimerApp> {
  static const duration = const Duration(seconds: 1);

  int secondPassed = 0;
  bool isActive = false;

  Timer timer;

  void handleTick() {
    if (isActive) {
      setState(() {
        secondPassed = secondPassed + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null)
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });

    int second = secondPassed % 100;
    int minute = secondPassed ~/ 60;
    int hour = secondPassed ~/ (100 * 60);

    return MaterialApp(
      title: 'Flutter Eğitimi',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kronometre'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomTextContainer(
                      label: 'SAAT', value: hour.toString().padLeft(2, '0')),
                  CustomTextContainer(
                      label: 'DAKİKA', value: minute.toString().padLeft(2, '0')),
                  CustomTextContainer(
                      label: 'SANİYE', value: second.toString().padLeft(2, '0')),
                ],
              ),
              const SizedBox(height: 40),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    isActive = !isActive;
                  });
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Text(isActive ? 'STOP' : 'START',style: TextStyle(fontSize: 60)),
                ),
              ),
              const SizedBox(height: 40),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    secondPassed = 0;
                    isActive=false;
                  });
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Text('SIFIRLA',style: TextStyle(fontSize: 60)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextContainer extends StatelessWidget {
  CustomTextContainer({this.label, this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(20),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(10),
        color: Colors.lightBlueAccent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 54,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$label',
            style: TextStyle(
              color: Colors.white70,
            ),
          )
        ],
      ),
    );
  }
}