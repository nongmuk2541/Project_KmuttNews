
//https://stackoverflow.com/questions/58499358/alert-box-with-multi-select-chip-in-flutter

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';



class CheckboxTest3 extends StatefulWidget {
  @override
  CheckboxTest3State createState() => CheckboxTest3State();
}

class CheckboxTest3State extends State<CheckboxTest3> {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> reportList = [ "ปี 1", "ปี 2", "ปี 3", "ปี 4"];
  final database = Firestore.instance;


  List<String> selectedYearList = List();

  _showReportDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("ชั้นปี" ,          
              style: TextStyle(
              color: Colors.black,
              fontSize: 11,
              fontFamily: 'Itim',
          ),),
            content: Container(
              constraints: BoxConstraints(
                  maxHeight: 100.0,
              ),
              child: SingleChildScrollView(
                child: MultiSelectChip(
                  reportList,
                  onSelectionChanged: (selectedList) {
                    setState(() {
                      selectedYearList = selectedList;
                    });
                      print(selectedYearList);
                  },
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("ตกลง",
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontFamily: 'Itim',
                ),),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                "ชั้นปี" ,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontFamily: 'Itim',
                  fontWeight: FontWeight.bold),),    
              onPressed: () => _showReportDialog(),
            ),
            Text(selectedYearList.join(" , ")),


             SizedBox(height: 50.0),
                    RaisedButton(
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                     color: Colors.orange[500],
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: Text(
                     "โพสต์",
                     style: TextStyle(
                     color: Colors.white,
                     fontSize: 15,
                     fontFamily: 'Itim',
                     fontWeight: FontWeight.bold),
                     ),
                        onPressed: () {
 database
              .collection('PostNews')
              .add({
                      // "searchKeywords": indexList,  
                      // "years": FieldValue.arrayUnion([year1Val,year2Val,year3Val,year4Val]),  
                      // "year": FieldValue.arrayUnion([selectedReportList]),(list)});
                       "year": FieldValue.arrayUnion(selectedYearList),

  
                      // "years": FieldValue.arrayUnion(["year1Val","year2Val","year3Val"]),  
                      });
        }
            )  
          ],
        ),
      ),
    );






  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(this.reportList, {this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = List();

  _buildChoiceList() {
    List<Widget> choices = List();

    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item,
               style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontFamily: 'Itim',
                ),
          ),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    });

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}















////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////






// //https://stackoverflow.com/questions/58499358/alert-box-with-multi-select-chip-in-flutter

// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'dart:math';
// import 'dart:async';
// import 'package:path/path.dart' as Path;
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';



// class CheckboxTest3 extends StatefulWidget {
//   @override
//   CheckboxTest3State createState() => CheckboxTest3State();
// }

// class CheckboxTest3State extends State<CheckboxTest3> {
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<String> reportList = [ "ปี 1", "ปี 2", "ปี 3", "ปี 4"];

//   List<String> selectedReportList = List();

//   _showReportDialog() {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("ชั้นปี" ,          
//               style: TextStyle(
//               color: Colors.black,
//               fontSize: 11,
//               fontFamily: 'Itim',
//           ),),
//             content: Container(
//               constraints: BoxConstraints(
//                   maxHeight: 100.0,
//               ),
//               child: SingleChildScrollView(
//                 child: MultiSelectChip(
//                   reportList,
//                   onSelectionChanged: (selectedList) {
//                     setState(() {
//                       selectedReportList = selectedList;
//                     });
//                   },
//                 ),
//               ),
//             ),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text("ตกลง",
//                     style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 11,
//                     fontFamily: 'Itim',
//                 ),),
//                 onPressed: () => Navigator.of(context).pop(),
//               )
//             ],
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {

    
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             RaisedButton(
//               child: Text(
//                 "ชั้นปี" ,
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 13,
//                   fontFamily: 'Itim',
//                   fontWeight: FontWeight.bold),),    
//               onPressed: () => _showReportDialog(),
//             ),
//             Text(selectedReportList.join(" , ")),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MultiSelectChip extends StatefulWidget {
//   final List<String> reportList;
//   final Function(List<String>) onSelectionChanged;

//   MultiSelectChip(this.reportList, {this.onSelectionChanged});

//   @override
//   _MultiSelectChipState createState() => _MultiSelectChipState();
// }

// class _MultiSelectChipState extends State<MultiSelectChip> {
//   // String selectedChoice = "";
//   List<String> selectedChoices = List();

//   _buildChoiceList() {
//     List<Widget> choices = List();

//     widget.reportList.forEach((item) {
//       choices.add(Container(
//         padding: const EdgeInsets.all(2.0),
//         child: ChoiceChip(
//           label: Text(item,
//                style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 11,
//                     fontFamily: 'Itim',
//                 ),
//           ),
//           selected: selectedChoices.contains(item),
//           onSelected: (selected) {
//             setState(() {
//               selectedChoices.contains(item)
//                   ? selectedChoices.remove(item)
//                   : selectedChoices.add(item);
//               widget.onSelectionChanged(selectedChoices);
//             });
//           },
//         ),
//       ));
//     });

//     return choices;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       children: _buildChoiceList(),
//     );
//   }
// }