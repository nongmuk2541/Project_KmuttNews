
//https://stackoverflow.com/questions/59312786/flutter-custom-toggle-buttons-selection

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';



class CheckboxTest2 extends StatefulWidget {
  @override
  CheckboxTest2State createState() => CheckboxTest2State();
}

class CheckboxTest2State extends State<CheckboxTest2> {
List<String> selectedCategory = new List<String>();
  String all = 'All';
  String category1 = 'category 1';
  String category2 = 'category 2';
  String category3 = 'category 3';
  String category4 = 'category 4';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Test'),
            ),
            body: Container(
                padding: const EdgeInsets.all(20.0),
                child: header()
            )));
  }

  Widget header(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 4.0, left: 0.0, right: 0.0, bottom: 6.0),
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 4.0,),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          splashColor: Colors.blue[100],
                          onTap: (){
                            selectedCategory.add(all);
                            selectedCategory.add(category1);
                            selectedCategory.add(category2);
                            selectedCategory.add(category3);
                            selectedCategory.add(category4);
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: selectedCategory.contains(all) ? Colors.blueAccent[100] : Colors.grey[500],
                              borderRadius: BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text('All',
                              style: TextStyle(color: Colors.white, fontSize: 10.0, fontWeight: FontWeight.w500),),
                          ),
                        ),
                        SizedBox(width: 2.0,),
                        InkWell(
                          splashColor: Colors.blue[100],
                          onTap: (){
                            selectedCategory = new List<String>();
                            selectedCategory.add(category1);
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: selectedCategory.contains(category1) ? Colors.blue[100] : Colors.grey[300],
                              borderRadius: BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text('category 1',
                              style: TextStyle(color: Colors.grey[900], fontSize: 10.0, fontWeight: FontWeight.w500),),
                          ),
                        ),
                        SizedBox(width: 2.0,),
                        InkWell(
                          splashColor: Colors.blue[100],
                          onTap: (){
                            selectedCategory = new List<String>();
                            selectedCategory.add(category2);
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: selectedCategory.contains(category2) ? Colors.blue[100] : Colors.grey[300],
                              borderRadius: BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text('category 2',
                              style: TextStyle(color: Colors.grey[900], fontSize: 10.0, fontWeight: FontWeight.w500),),
                          ),
                        ),
                        SizedBox(width: 2.0,),
                        InkWell(
                          splashColor: Colors.blue[100],
                          onTap: (){
                            selectedCategory = new List<String>();
                            selectedCategory.add(category3);
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: selectedCategory.contains(category3) ? Colors.blue[100] : Colors.grey[300],
                              borderRadius: BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text('category 3',
                              style: TextStyle(color: Colors.grey[900], fontSize: 10.0, fontWeight: FontWeight.w500),),
                          ),
                        ),
                        SizedBox(width: 2.0,),
                        InkWell(
                          splashColor: Colors.blue[100],
                          onTap: (){
                            selectedCategory = new List<String>();
                            selectedCategory.add(category4);
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: selectedCategory.contains(category4) ? Colors.blue[100] : Colors.grey[300],
                              borderRadius: BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text('category 4',
                              style: TextStyle(color: Colors.grey[900], fontSize: 10.0, fontWeight: FontWeight.w500),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.0,)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}