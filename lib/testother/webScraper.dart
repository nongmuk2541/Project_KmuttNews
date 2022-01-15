import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class WebScraper extends StatefulWidget {
  @override
  WebScraperState createState() => WebScraperState();
}

class WebScraperState extends State<WebScraper> {
  ///////////////////////////////////////
  // Generate a list of available hobbies here
  List<Map> availableHobbies = [
    {"name": "ปี 1", "isChecked": false},
    {"name": "ปี 2", "isChecked": false},
    {
      "name": "ปี 3",
      "isChecked": false,
    },
    {
      "name": "ปี 4",
      "isChecked": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kindacode.com'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'ชั้นปี :',
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'Itim',
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),

            ////////////////////////////////////
            // The checkboxes will be here
            Column(
                children: availableHobbies.map((hobby) {
              return CheckboxListTile(
                  value: hobby["isChecked"],
                  title: Text(
                    hobby["name"],
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Itim',
                    ),
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      hobby["isChecked"] = newValue;
                    });
                  });
            }).toList()),

            ////////////////////////////////////
            // Display the result here
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Wrap(
              children: availableHobbies.map((hobby) {
                if (hobby["isChecked"] == true) {
                  return Card(
                    elevation: 3,
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        hobby["name"],
                        style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Itim',
                        ),
                      ),
                    ),
                  );
                }

                return Container();
              }).toList(),
            )
          ]),
        ),
      ),
    );
  }
}














































////////////////////////////////////////////////////
////////////////////////////////////////////////////
////////////////////////////////////////////////////
////////////////////////////////////////////////////
////////////////////////////////////////////////////
////////////////////////////////////////////////////
////////////////////////////////////////////////////
////////////////////////////////////////////////////
////////////////////////////////////////////////////
////////////////////////////////////////////////////











// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'dart:math';
// import 'dart:async';
// import 'package:path/path.dart' as Path;
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';


// class WebScraper extends StatefulWidget {
//   @override
//   WebScraperState createState() => WebScraperState();
// }

// class WebScraperState extends State<WebScraper> {
//   ///////////////////////////////////////
//   // Generate a list of available hobbies here
//   List<Map> availableHobbies = [
//     {"name": "ปี 1", "isChecked": false},
//     {"name": "ปี 2", "isChecked": false},
//     {"name": "ปี 3", "isChecked": false,},
//     {"name": "ปี 4", "isChecked": false,},
// ];


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Kindacode.com'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Text('ชั้นปี :',
//               style: TextStyle(
//                         fontSize: 15.0,
//                         fontFamily: 'Itim',),
//                 ),
//             SizedBox(height: 10),
//             Divider(),
//             SizedBox(height: 10),

//             ////////////////////////////////////
//             // The checkboxes will be here
//             Column(
//                 children: availableHobbies.map((hobby) {
//               return CheckboxListTile(
//                   value: hobby["isChecked"],
//                   title: Text(hobby["name"],
//                         style:  TextStyle(
//                         fontSize: 12.0,
//                         fontFamily: 'Itim',),),
//                   onChanged: (newValue) {
//                     setState(() {
//                       hobby["isChecked"] = newValue;
//                     });
//                   });
//             }).toList()),

//             ////////////////////////////////////
//             // Display the result here
//             SizedBox(height: 10),
//             Divider(),
//             SizedBox(height: 10),
//             Wrap(
//               children: availableHobbies.map((hobby) {
//                 if (hobby["isChecked"] == true) {
//                   return Card(
//                     elevation: 3,
//                     color: Colors.amber,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(hobby["name"],
//                         style:  TextStyle(
//                         fontSize: 12.0,
//                         fontFamily: 'Itim',),                      
//                       ),
//                     ),
//                   ); 
//                 }

//                 return Container();
//               }).toList(),
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }

