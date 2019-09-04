import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() => runApp(MainApp());

/*class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static const platform = const MethodChannel('jp.shido.channel');

  String res = "";

  Future<String> _showNativeClass() async {
    return await platform.invokeMethod('showNativeClass');
  }

  void getResult() async {
    res = await _showNativeClass();
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Calling Android Method'),
      ),
      body: Center(
        child: FlatButton(
          child: Text('Call native code'),
          onPressed: () {
            getResult();
          },
        ),
      ),
    ));
  }
}*/

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class User {
  String name;
  int age;

  User(this.name, this.age);
}

class _MainAppState extends State<MainApp> {
  static const platformMethod = const MethodChannel('jp.shido.channel');
  static const platformEventChannel = EventChannel('jp.shido.eventchannel');

  String res = "";

  Future<String> _showNativeClass() async {
    return await platformMethod.invokeMethod('showNativeClass');
  }

  Future<String> _showNativeClass2() async {
    var user = User("Shido", 30);
    await platformMethod.invokeMethod('passingUser', user);
    return await platformMethod.invokeMethod('showNativeClass2');
  }

  void getResult() async {
    var random = Random().nextInt(2);
    if (random == 0) {
      res = await _showNativeClass();
    } else {
      res = await _showNativeClass2();
    }
    print(res);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Calling Android Method'),
      ),
      body: Center(
        child: FlatButton(
          color: Colors.blueAccent,
          child: Text(
            'Text is: $res',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            setState(() {
              getResult();
            });
          },
        ),
      ),
    ));
  }
}
