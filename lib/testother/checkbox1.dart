// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'dart:math';
// import 'dart:async';
// import 'package:path/path.dart' as Path;
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';


// //https://medium.com/@azpm95/dynamic-checkbox-widgets-in-flutter-29973504c410

// class CheckboxTest1 extends StatefulWidget {
//   @override
//   CheckboxTest1State createState() => CheckboxTest1State();
// }

// class CheckboxTest1State extends State<CheckboxTest1> {
// bool year1Val = false;
// bool year2Val = false;
// bool year3Val = false;
// bool year4Val = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Dynamic Checkboxes"),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // [ปี 1] checkbox
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text("ปี 1"),
//                   Checkbox(
//                     value: year1Val,
//                     onChanged: (bool value) {
//                       setState(() {
//                         year1Val = value;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//               // [ปี 2] checkbox
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text("ปี 2"),
//                   Checkbox(
//                     value: year2Val,
//                     onChanged: (bool value) {
//                       setState(() {
//                         year2Val = value;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//               // [ปี 3] checkbox
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text("ปี 3"),
//                   Checkbox(
//                     value: year3Val,
//                     onChanged: (bool value) {
//                       setState(() {
//                         year3Val = value;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//               // [ปี 4] checkbox
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text("ปี 4"),
//                   Checkbox(
//                     value: year4Val,
//                     onChanged: (bool value) {
//                       setState(() {
//                         year4Val = value;
//                       });
//                     },
//                   ),
//                 ],
//               ),             
//             ],
//           ),
//         ));
//   }
// }





///////////////////////////////////////////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////


////https://medium.com/@azpm95/dynamic-checkbox-widgets-in-flutter-29973504c410

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


//https://medium.com/@azpm95/dynamic-checkbox-widgets-in-flutter-29973504c410

class CheckboxTest1 extends StatefulWidget {
  @override
  CheckboxTest1State createState() => CheckboxTest1State();
}

class CheckboxTest1State extends State<CheckboxTest1> {
bool year1Val = false;
bool year2Val = false;
bool year3Val = false;
bool year4Val = false;

Widget checkbox(String title, bool boolValue) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title),
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {
            /// manage the state of each value
            setState(() {
              switch (title) {
                case "ปี 1":
                  year1Val = value;
                  break;
                case "ปี 2":
                  year2Val = value;
                  break;
                case "ปี 3":
                  year3Val = value;
                  break;
                case "ปี 4":
                  year4Val = value;
                  break;
           
              }
            });
          },
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dynamic Checkboxes"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  checkbox("ปี 1", year1Val),
                  checkbox("ปี 2", year2Val),
                  checkbox("ปี 3", year3Val),
                  checkbox("ปี 4", year4Val),
                ],
              ),
            ],
          ),
        )
    );
  }
}