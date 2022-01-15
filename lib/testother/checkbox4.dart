// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'dart:math';
// import 'dart:async';
// import 'package:path/path.dart' as Path;
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

// //

// class CheckboxTest4 extends StatefulWidget {
//   @override
//   CheckboxTest4State createState() => CheckboxTest4State();
// }

// class CheckboxTest4State extends State<CheckboxTest4> {
 
//   TodoService _todoService;
//   var _selectedValue;
//   var _categories = List<DropdownMenuItem>();

//   List<Todo>_todoList=List<Todo>();
//   final GlobalKey<ScaffoldState> _globalKey=GlobalKey<ScaffoldState>();




//   @override
//   initState(){
//     super.initState();
//     getAllTodos();
//     _loadCategories();
//     getValues();
//   }


//   getAllTodos()async{
//     _todoService=TodoService();
//     _todoList=List<Todo>();

//     var todos= await _todoService.readTodo();

//     todos.forEach((todo){
//       setState(() {
//         var model=Todo();
//         model.id=todo['id'];
//         model.title=todo['title'];
//         model.dueDate=todo['dueDate'];
//         model.category=todo['category'];
//         model.isFinished=todo['isFinished'];
//         _todoList.add(model);
//       });
//     });
//   }


//   _save(String key,dynamic val)async{
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool(key,val);
//   }
//   getValues() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool value=prefs.getBool('Checked');
//     return value;
//   }

//       body: ListView.builder(itemCount: _todoList.length,itemBuilder: (context, index){
//         return Padding(
//           padding:  EdgeInsets.only(top:8.0, left: 8.0, right: 8.0),
//           child: Card (
//             elevation: 8.0,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(0)
//             ),
//               child: ListTile(
//                 leading: Checkbox(
//                   checkColor: Colors.indigo,
//                   value: _todoList[index].isChecked,
//                   onChanged:(bool value){
//                       setState(() {
//                         _todoList[index].isChecked=value;


//                       });
//                       _save('Checked',value);

//         },

//                 ),
//                 title: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Text(_todoList[index].title ?? 'No Title',
//                       style: TextStyle(decoration: (_todoList[index].isChecked? TextDecoration.lineThrough: TextDecoration.none),
//                       ),
//                     ),
//                     IconButton(icon: Icon(Icons.delete,color: Colors.red,
//                     ),
//                         onPressed: (){
//                           _deleteFormDialog(context,_todoList[index].id);
//                         }
//                     ),
//                   ],
//                 ),
//                 subtitle: Text(_todoList[index].dueDate ?? 'No Due Date'),
// //                  trailing: Text(_todoList[index].dueDate ?? 'No Due Date'),
//               ),
//           ),
//         );
//       }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>TodoScreen())),
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// } 







// ////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////



























import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

//

class CheckboxTest4 extends StatefulWidget {
  @override
  CheckboxTest4State createState() => CheckboxTest4State();
}

class CheckboxTest4State extends State<CheckboxTest4> {
 List<bool> _itens = List();

  _loadingItens(){

    _itens = [];
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);

  }

  Future getList() async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection("adicionais").getDocuments();

    return qn.documents;
  }

  @override
  void initState() {
    _loadingItens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBoxList"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                child: FutureBuilder(
                    future: getList(),
                    // ignore: missing_return
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return ListView.builder(
                            padding: EdgeInsets.all(0.0),
                            itemCount: 4,
                            itemBuilder: (_, index) {
                              return ListBody(
                                children: <Widget>[Text("Loading...")],
                              );
                            });
                      } else {
                        return ListView.builder(
                            padding: EdgeInsets.all(0.0),
                            itemCount: snapshot.data.length,
                            itemBuilder: (_, index) {
                              String nome = snapshot.data[index].data["nome"];
                              String valor = snapshot.data[index].data["valor"];
                              return CheckboxListTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(nome),
                                      Text("\$ $valor")
                                    ],
                                  ),
                                  value: _itens[index],
                                  onChanged: (value) {
                                    setState(() {
                                      _itens[index] = value;
                                    });
                                  });
                            });
                      }
                    }))
          ],
        ),
      ),
    

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade200,
                width: 1.0,
              ),
            )),
        child: Padding(
            padding: EdgeInsets.only(left:16, right:16, top: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(),
                  child: GestureDetector(
                    child: Container(
                      width: (MediaQuery.of(context).size.width * 0.90),
                      height: 60,
                      decoration: BoxDecoration(
                          color: Color(0xff0269BA),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Text("Save",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ))),
                        ],
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                )
              ],
            )),

      ),
    );
  }
}















////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////















// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'dart:math';
// import 'dart:async';
// import 'package:path/path.dart' as Path;
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';


// class CheckboxTest4 extends StatefulWidget {
//   @override
//   CheckboxTest4State createState() => CheckboxTest4State();
// }


// class CheckboxTest4State extends State<CheckboxTest4> {
//  List<Offset> pointlist = <Offset>[];

 
//  getdata() async{
//   await Firestore.instance.collection("PostNews").document('biZV7cepFJA8T6FTcF08').get().then((value){
//       setState(() {
//           List<Offset> pointlist = List.from(value.data['point']);
//       }); });}

//   @override
//   void initState() {
//     super.initState();
//     getdata();
//   }











////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////





// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'dart:math';
// import 'dart:async';
// import 'package:path/path.dart' as Path;
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';


// class TechData {
//   String Name;
//   String Email;
//   String Address;

//   TechData(this.Name, this.Email, this.Address);
// }



// class CheckboxTest4 extends StatefulWidget {

//   @override
//   CheckboxTest4State createState() => CheckboxTest4State();
// }

// class CheckboxTest4State extends State<CheckboxTest4> {

//  List<bool> _itens = List();

//   _loadingItens(){

//     _itens = [];
//     _itens.add(false);
//     _itens.add(false);
//     _itens.add(false);
//     _itens.add(false);
//     _itens.add(false);

//   }

//   Future getList() async {
//     var firestore = Firestore.instance;

//     QuerySnapshot qn = await firestore.collection("adicionais").getDocuments();

//     return qn.documents;
//   }

//   @override
//   void initState() {
//     _loadingItens();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("CheckBoxList"),
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             Expanded(
//                 child: FutureBuilder(
//                     future: getList(),
//                     // ignore: missing_return
//                     builder: (_, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return ListView.builder(
//                             padding: EdgeInsets.all(0.0),
//                             itemCount: 4,
//                             itemBuilder: (_, index) {
//                               return ListBody(
//                                 children: <Widget>[Text("Loading...")],
//                               );
//                             });
//                       } else {
//                         return ListView.builder(
//                             padding: EdgeInsets.all(0.0),
//                             itemCount: snapshot.data.length,
//                             itemBuilder: (_, index) {
//                               String nome = snapshot.data[index].data["nome"];
//                               String valor = snapshot.data[index].data["valor"];
//                               return CheckboxListTile(
//                                   title: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: <Widget>[
//                                       Text(nome),
//                                       Text("\$ $valor")
//                                     ],
//                                   ),
//                                   value: _itens[index],
//                                   onChanged: (value) {
//                                     setState(() {
//                                       _itens[index] = value;
//                                     });
//                                   });
//                             });
//                       }
//                     }))
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//             color: Colors.white,
//             border: Border(
//               top: BorderSide(
//                 color: Colors.grey.shade200,
//                 width: 1.0,
//               ),
//             )),
//         child: Padding(
//             padding: EdgeInsets.only(left:16, right:16, top: 16, bottom: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(),
//                   child: GestureDetector(
//                     child: Container(
//                       width: (MediaQuery.of(context).size.width * 0.90),
//                       height: 60,
//                       decoration: BoxDecoration(
//                           color: Color(0xff0269BA),
//                           borderRadius: BorderRadius.all(Radius.circular(10))),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Padding(
//                               padding: EdgeInsets.only(left: 8, right: 8),
//                               child: Text("Save",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w500,
//                                   ))),
//                         ],
//                       ),
//                     ),
//                     onTap: () {
//                     /**/
//                     },
//                   ),
//                 )
//               ],
//             )),
//       ),
//     );
//   }
// }