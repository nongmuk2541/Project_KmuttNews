import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class CheckboxTest extends StatefulWidget {
  @override
  CheckboxTestState createState() => CheckboxTestState();
}

class CheckboxTestState extends State<CheckboxTest> {
  ///////////////////////////////////////
  // Generate a list of available hobbies here
  List<Map> availableHobbies = [
    {"name": "ปี 1", "isChecked": false},
    {"name": "ปี 2", "isChecked": false},
    {"name": "ปี 3", "isChecked": false,},
    {"name": "ปี 4", "isChecked": false,},
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
            Text('ชั้นปี :',
              style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Itim',),
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
                  title: Text(hobby["name"],
                        style:  TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Itim',),),
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
                      child: Text(hobby["name"],
                        style:  TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Itim',),                      
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


// class CheckboxTest extends StatefulWidget {
//   @override
//   CheckboxTestState createState() => CheckboxTestState();
// }

// class CheckboxTestState extends State<CheckboxTest> {
//    bool _isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Select Exercises')),
//       body: _buildBody(context),
//     );
//    }

//    Widget _buildBody(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: Firestore.instance.collection('exercises').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) return LinearProgressIndicator();

//         return _buildList(context, snapshot.data.documents);
//       },
//     );
//    }

//    Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) 
//    {
//     return ListView(
//       padding: const EdgeInsets.only(top: 20.0),
//       children: snapshot.map((data) => _buildListItem(context, 
//    data)).toList(),
//     );
//   }

//    Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
//     final record = Record.fromSnapshot(data);

//     return Padding(
//       key: ValueKey(record.name),
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey),
//           borderRadius: BorderRadius.circular(5.0),
//         ),
//         child: ListTile(
//           title: Text(record.name),
//           trailing: Checkbox(
//             value: _isChecked,
//             onChanged: (bool value) {
//             setState(() {
//               _isChecked = value;
//             });
//           },
//           )
//         ),
//         ),
//        );
//      }
//     }

//     class Record {
//     final String name;
//     final DocumentReference reference;

//     Record(this.name, this.reference);

//     Record.fromMap(Map<String, dynamic> map, {this.reference})
//       : assert(map['name'] != null),
//         name = map['name'];

//    Record.fromSnapshot(DocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data, reference: snapshot.reference);

//     @override
//     String toString() => "Record<$name:>";
//     }