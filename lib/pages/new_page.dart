import 'package:like_button/like_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
        child: Container(
        color: Colors.white70,
        child: Center(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text('g'),
                  leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 44,
                        minWidth: 44,
                        maxWidth: 64,
                        maxHeight: 64,
                      ),
                      child: LikeButton(
                        size: 30,
                        circleColor: const CircleColor(
                            start: Color(0xff00ddff), end: Color(0xff00ddff)
                        ),
                        likeCount: 0,
                        likeBuilder: (bool isLiked){
                          return Icon(
                           Icons.favorite,
                            color: isLiked ? Colors.purpleAccent : Colors.grey,
                            size: 30,
                          );
                        },
                      )
                  ),
                ),

                ListTile(
                  title: Text('g'),
                  leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 44,
                        minWidth: 44,
                        maxWidth: 64,
                        maxHeight: 64,
                      ),
                      child: LikeButton(
                        size: 30,
                        circleColor: const CircleColor(
                            start: Color(0xff00ddff), end: Color(0xff00ddff)
                        ),
                        likeCount: 0,
                        likeBuilder: (bool isLiked){
                          return Icon(
                            Icons.favorite,
                            color: isLiked ? Colors.purpleAccent : Colors.grey,
                            size: 30,
                          );
                        },
                      )
                  ),
                ),

                ListTile(
                  title: Text('g'),
                  leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 44,
                        minWidth: 44,
                        maxWidth: 64,
                        maxHeight: 64,
                      ),
                      child: LikeButton(
                        size: 30,
                        circleColor: const CircleColor(
                            start: Color(0xff00ddff), end: Color(0xff00ddff)
                        ),
                        likeCount: 0,
                        likeBuilder: (bool isLiked){
                          return Icon(
                            Icons.favorite,
                            color: isLiked ? Colors.purpleAccent : Colors.grey,
                            size: 30,
                          );
                        },
                      )
                  ),
                ),
              ],
            ),


        ),
      ),
        ),
    );
  }
}