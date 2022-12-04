import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ProductDataModel.dart';
import 'package:flutter/services.dart' as rootBundle;

import 'package:like_button/like_button.dart';



class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context,data){
            if(data.hasError){
              return Center(child: Text("${data.error}"));
            }else if(data.hasData){
              var items =data.data as List<ProductDataModel>;
              return ListView.builder(
                  itemCount: items == null? 0: items.length,
                  itemBuilder: (context,index){
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              child: Image(image: NetworkImage(items[index].imageURL.toString()),fit: BoxFit.fill,),
                            ),

                            Expanded(child: Container(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text(items[index].name.toString(),style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),),),
                                  Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text(items[index].price.toString()),)
                                ],
                              ),
                            )),
                            Column(
                              children: [
                                LikeButton(
                                    size: 30,
                                    circleColor: const CircleColor(
                                        start: Colors.purpleAccent, end: Colors.deepPurpleAccent
                                    ),
                                    likeCount: 0,
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        Icons.favorite,
                                        color: isLiked
                                            ? Colors.purpleAccent
                                            : Colors.grey,
                                        size: 30,
                                      );
                                    }
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              );
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        )
    );
  }

  //   Center(
      //   child: Container(
      //   color: Colors.white70,
      //   child: Center(
      //       child: ListView(
      //         children: <Widget>[
      //           ListTile(
      //             title: Text('g'),
      //             leading: ConstrainedBox(
      //                 constraints: BoxConstraints(
      //                   minHeight: 44,
      //                   minWidth: 44,
      //                   maxWidth: 64,
      //                   maxHeight: 64,
      //                 ),
      //                 child: LikeButton(
      //                   size: 30,
      //                   circleColor: const CircleColor(
      //                       start: Color(0xff00ddff), end: Color(0xff00ddff)
      //                   ),
      //                   likeCount: 0,
      //                   likeBuilder: (bool isLiked){
      //                     return Icon(
      //                      Icons.favorite,
      //                       color: isLiked ? Colors.purpleAccent : Colors.grey,
      //                       size: 30,
      //                     );
      //                   },
      //                 )
      //             ),
      //           ),
      //
      //           ListTile(
      //             title: Text('g'),
      //             leading: ConstrainedBox(
      //                 constraints: BoxConstraints(
      //                   minHeight: 44,
      //                   minWidth: 44,
      //                   maxWidth: 64,
      //                   maxHeight: 64,
      //                 ),
      //                 child: LikeButton(
      //                   size: 30,
      //                   circleColor: const CircleColor(
      //                       start: Color(0xff00ddff), end: Color(0xff00ddff)
      //                   ),
      //                   likeCount: 0,
      //                   likeBuilder: (bool isLiked){
      //                     return Icon(
      //                       Icons.favorite,
      //                       color: isLiked ? Colors.purpleAccent : Colors.grey,
      //                       size: 30,
      //                     );
      //                   },
      //                 )
      //             ),
      //           ),
      //
      //           ListTile(
      //             title: Text('g'),
      //             leading: ConstrainedBox(
      //                 constraints: BoxConstraints(
      //                   minHeight: 44,
      //                   minWidth: 44,
      //                   maxWidth: 64,
      //                   maxHeight: 64,
      //                 ),
      //                 child: LikeButton(
      //                   size: 30,
      //                   circleColor: const CircleColor(
      //                       start: Color(0xff00ddff), end: Color(0xff00ddff)
      //                   ),
      //                   likeCount: 0,
      //                   likeBuilder: (bool isLiked){
      //                     return Icon(
      //                       Icons.favorite,
      //                       color: isLiked ? Colors.purpleAccent : Colors.grey,
      //                       size: 30,
      //                     );
      //                   },
      //                 )
      //             ),
      //           ),
      //         ],
      //       ),
      //
      //
      //   ),
      // ),
      //   ),
  Future<List<ProductDataModel>>ReadJsonData() async{
    final jsondata = await rootBundle.rootBundle.loadString('jsonfile/productlist.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }
}