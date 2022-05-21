import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'dart:math';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends NyState<Post> {
  var rnd = Random();
  int _imgIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width + 200,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Image.asset(
                    getImageAsset('icons/bell.png'),
                    color: Colors.blue,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 70,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'User ${rnd.nextInt(100)}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'current location or description',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          getImageAsset('icons/more_dot.png'),
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  PageView(
                    onPageChanged: ((value) => setState(() {
                          _imgIndex = value + 1;
                        })),
                    children: [
                      Image.asset(
                        getImageAsset('1308931.jpg'),
                        fit: BoxFit.fitWidth,
                      ),
                      Image.asset(
                        getImageAsset('icons/more.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 45,
                      height: 30,
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black.withOpacity(0.5),
                      ),
                      child: Text(
                        "$_imgIndex/2",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ),
                ],
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              getImageAsset('icons/heart.png'),
                              width: 25,
                              color: Theme.of(context).primaryColor,
                            ),
                            Image.asset(
                              getImageAsset('icons/comment.png'),
                              color: Theme.of(context).primaryColor,
                              width: 25,
                            ),
                            Image.asset(
                              getImageAsset('icons/send.png'),
                              color: Theme.of(context).primaryColor,
                              width: 25,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: Container(
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 2 -
                                MediaQuery.of(context).size.width / 6 * 2 -
                                15,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      width: 6,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      width: 4,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      width: 4,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      width: 4,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      width: 4,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Image.asset(
                                getImageAsset('icons/save-instagram.png'),
                                color: Theme.of(context).primaryColor,
                                width: 25,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text("3 lượt thích",
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Người dùng ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(
                      text:
                          'aslkhsdfkhsdafkhsdf ksdhfsdlfhsdlkfhskdlafhasdl;fhsldkfhaskldfhsadfhaskldfhdl;k',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      )),
                ])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
