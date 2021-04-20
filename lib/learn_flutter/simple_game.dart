import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SimpleGame extends StatefulWidget {
  @override
  _SimpleGameState createState() => _SimpleGameState();
}

class _SimpleGameState extends State<SimpleGame> {

  Alignment card1 = Alignment(-0.7, -0.5);
  Alignment card2 = Alignment(0.0, -0.5);
  Alignment card3 = Alignment(0.7, -0.5);

  Alignment firstCardState;
  Alignment secondCardState;
  Alignment thirdCardState;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
    firstCardState = card1;
    secondCardState = card2;
    thirdCardState = card3;
  }

  oneToTwo(){
    setState(() {
      firstCardState = card2;
      secondCardState = card1;
      card2 = secondCardState;
      card1 = firstCardState;
    });
  }

  oneToThree(){
    setState(() {
      firstCardState = card3;
      thirdCardState = card1;
      card3 = thirdCardState;
      card1 = firstCardState;
    });
  }

  twoToThree(){
    setState(() {
      secondCardState = card3;
      thirdCardState = card2;
      card3 = thirdCardState;
      card2 = secondCardState;
    });
  }

  Widget getMyCard(){
    return InkWell(
      onTap: (){},
      child: Text(
        '🂠',
        style: TextStyle(fontSize: 150),
        textAlign: TextAlign.center,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    //,🂠,🃟
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // oneToTwo();
          // twoToThree();
          // oneToThree();
        },
        child: Text('GO'),
      ),
      appBar: AppBar(),
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
            alignment: firstCardState,
            child: Container(
              width: 150,
              height: 200,
              color: Colors.red,
              child: getMyCard(),
            ),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            alignment: secondCardState,
            child: Container(
              width: 150,
              height: 200,
              color: Colors.green,
            ),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            alignment: thirdCardState,
            child: Container(
              width: 150,
              height: 200,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
