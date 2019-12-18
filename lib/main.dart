// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.


import 'dart:math';

import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Christmas Dman',
      home: Scaffold(
        appBar: AppBar(
          title: Text('D-man'),
          backgroundColor: Colors.redAccent,
        ),
        body: GomanWidget(),
      ),
    );
  }
}

class GomanWidget extends StatefulWidget {
  @override
  _GomanState createState() => _GomanState();
}
class _GomanState extends State<GomanWidget>{
  int colorsNum = 0;
  var colorList = [Colors.pinkAccent[700],Colors.redAccent[700],Colors.deepOrangeAccent[700],Colors.orangeAccent[700],Colors.amberAccent[700],Colors.yellowAccent[700],Colors.limeAccent[700],Colors.lightGreenAccent[700],Colors.greenAccent[700],Colors.tealAccent[700],Colors.cyanAccent[700],Colors.lightBlueAccent[700],Colors.blueAccent[700],Colors.indigoAccent[700],Colors.purpleAccent[700],Colors.deepPurpleAccent[700],Colors.blueGrey[700],Colors.brown,Colors.grey[700],];
  int _wordXpos = 0;
  int _wordYpos = 0;
  bool _active = false;
  final hogeWidget = List<Widget>();
  var _rng = new Random();

  void _handleTap(){
    setState(() {
      colorsNum += 1;
      if (colorsNum == 18){
        colorsNum =0;
      }
      _wordXpos = _rng.nextInt(2) - 1;
      _wordYpos = _rng.nextInt(2) - 1;
      _active = !_active;
    });
  }

void addWords(){
  var txt = new Positioned(
    top: 100 + _wordYpos.toDouble(),
    left: 65 + _wordXpos.toDouble(),
    child: Stack(children: <Widget>[
      // Stroked text as border.
      Text(
      "Merry Christmas !",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 40,
        foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6
        ..color = colorList[colorsNum],
        ),
        ),
        //Solid text as fill
        Text(
        "Merry Christmas !",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
          color: Colors.grey[300],
        ),),
    ],)
  );
  setState(() {
    hogeWidget.add(txt);
  });
}
  

  Widget build(BuildContext context){
    Widget dmanImg = GestureDetector(
      onTap: (){
        _handleTap();
        print("gman was tapped !");
        addWords();
      },
      child: Image.asset(
            'images/dman.png',
            fit: BoxFit.cover,
          ),
    );
    
    Widget dmanPositioned = Positioned(
      top: 240,
      left: 130,
      child: dmanImg,
    );

    Widget container = Stack(
      children: <Widget>[
        dmanPositioned,
      ]+
      hogeWidget,
    );
    return container;
  }

}
