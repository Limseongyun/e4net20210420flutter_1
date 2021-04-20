import 'package:flutter/material.dart';
import 'package:flutter_e4net_1/learn_flutter/posts.dart';

class PostDetail extends StatelessWidget {
  final JsonTest myPost;
  PostDetail({@required this.myPost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Detail'),
      ),
      body: Container(),
    );
  }
}
