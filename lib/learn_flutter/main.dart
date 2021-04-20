import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e4net_1/learn_flutter/posts.dart';

main(){
  runApp(MyMaterial());
}

class MyMaterial extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e4net',
      home: MyStateless(),
    );
  }
}


class MyStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Test App'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('text1'),
              Text('text2'),
              Text('text3'),
              ElevatedButton(
                  onPressed: (){
                    print('posts tap!');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) {
                              return Posts();
                            },
                        ),
                    );
                  },
                  child: Text('posts'),
                  style: ElevatedButton.styleFrom(
                    elevation: 1,
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                    onPrimary: Colors.red,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: (){},
                      child: Text('AlertDialog'),
                  ),
                  TextButton(
                      onPressed: (){},
                      child: Text('snackBar')
                  ),
                  FloatingActionButton(
                    onPressed: (){},
                    child: Text('Toast'),
                  )
                ],
              ),
              IconButton(
                  icon: Icon(Icons.videogame_asset),
                  onPressed: (){}
                  )
            ],
          ),
        ),
      ),
    );
  }
}

