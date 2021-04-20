import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SimpleGame extends StatefulWidget {
  @override
  _SimpleGameState createState() => _SimpleGameState();
}

class _SimpleGameState extends State<SimpleGame> {

  int gameSpeed = 450;
  int nowLevel = 1;
  int correctCnt = 0;
  bool maxLevel = false;

  bool gaming = false;
  bool answer = false;

  Alignment card1 = Alignment(-0.7, -0.5);
  Alignment card2 = Alignment(0.0, -0.5);
  Alignment card3 = Alignment(0.7, -0.5);

  Alignment firstCardState;
  Alignment secondCardState;
  Alignment thirdCardState;

  bool firstJoker = false;
  bool secondJoker = false;
  bool thirdJoker = false;

  bool cardSelectOff = true;
  bool cardResultOff = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
    firstCardState = card1;
    secondCardState = card2;
    thirdCardState = card3;
    var rand = Random().nextInt(3);
    print(rand);
    setState(() {
      if(rand == 0){
        firstJoker = true;
      } else if(rand ==1){
        secondJoker = true;
      } else {
        thirdJoker = true;
      }
    });
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

  changeCard(){
    var rand = Random().nextInt(3);
    if(rand == 0){
      oneToTwo();
    } else if(rand == 1){
      twoToThree();
    }else {
      oneToThree();
    }
  }

  Widget getMyCard(bool whoIsJoker){
    return InkWell(
      onTap: (){},
      child: Text(
        whoIsJoker ? '🃟' : '🂠',
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
        onPressed: gaming ? (){} : () async {
          setState(() {
            gaming = true;
          });
          for(int i = 0; i < 5; i++){
            changeCard();
            await Future.delayed(Duration(milliseconds: 1300));
          }

          setState(() {
            cardSelectOff = false;
          });
        },
        child: gaming ? CircularProgressIndicator(backgroundColor: Colors.white,) : Text('GO'),
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
              // color: Colors.red,
              child: getMyCard(firstJoker),
            ),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            alignment: secondCardState,
            child: Container(
              width: 150,
              height: 200,
              // color: Colors.green,
              child: getMyCard(secondJoker),
            ),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            alignment: thirdCardState,
            child: Container(
              width: 150,
              height: 200,
              // color: Colors.blue,
              child: getMyCard(thirdJoker),
            ),
          ),
          Offstage(
            offstage: cardSelectOff,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                  '카드를 선택해주세요',
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          Offstage(
            offstage: cardResultOff,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text('정답 또는 오답',
              style: TextStyle(
                  fontSize: 40
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
