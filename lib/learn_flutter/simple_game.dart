import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SimpleGame extends StatefulWidget {
  @override
  _SimpleGameState createState() => _SimpleGameState();
}

class _SimpleGameState extends State<SimpleGame> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Text('text1'),
        ],
      ),
    );
  }
}
