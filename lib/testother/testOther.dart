import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'package:path/path.dart' as Path;
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:New_Project_KMUTTNEWS/screens/login_view.dart';
import 'package:New_Project_KMUTTNEWS/screens/search_news.dart';
import 'package:New_Project_KMUTTNEWS/testother/addNews.dart';
import 'package:New_Project_KMUTTNEWS/testother/addData.dart';
import 'package:New_Project_KMUTTNEWS/testother/checkbox.dart';
import 'package:New_Project_KMUTTNEWS/testother/checkbox1.dart';
import 'package:New_Project_KMUTTNEWS/testother/checkbox2.dart';
import 'package:New_Project_KMUTTNEWS/testother/checkbox3.dart';
import 'package:New_Project_KMUTTNEWS/testother/checkbox4.dart';
import 'package:New_Project_KMUTTNEWS/testother/searchYear.dart';
import 'package:New_Project_KMUTTNEWS/testother/webScraper.dart';
import 'package:New_Project_KMUTTNEWS/testother/login_page.dart';

class TestOther extends StatefulWidget {
  @override
  TestOtherState createState() => TestOtherState();
}

class TestOtherState extends State<TestOther> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Test",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Itim',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.login_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Login();
                }));
              });
            },
          ),
        ],
      ),
      // backgroundColor: Colors.deepOrange[100],
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        children: <Widget>[
          SizedBox(height: 15),
          registerButton(context),
          SizedBox(height: 15),
          addData(context),
          SizedBox(height: 15),
          post(context),
          SizedBox(height: 15),
          checkbox(context),
          SizedBox(height: 15),
          checkbox1(context),
          SizedBox(height: 15),
          checkbox2(context),
          SizedBox(height: 15),
          checkbox3(context),
          SizedBox(height: 15),
          checkbox4(context),
          SizedBox(height: 15),
          searchYear(context),
          SizedBox(height: 15),
          webScraper(context),
          SizedBox(height: 15),
          loginView(context),
          SizedBox(height: 15),
          // loginView(context),
          SizedBox(height: 70),

          //    editProfile(context),
        ],
      ),
    );
  }

  Widget registerButton(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Colors.orange[500],
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Text(
        "Searcch News",
        style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'Itim',
            fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Search()));
      },
    );
  }

  Widget addData(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Colors.orange[500],
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Text(
        "addNews",
        style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'Itim',
            fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddNews()));
      },
    );
  }

  Widget post(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Colors.orange[500],
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Text(
        "TestaddData",
        style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'Itim',
            fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddData()));
      },
    );
  }

  Widget checkbox(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Colors.orange[500],
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Text(
        "checkbox",
        style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'Itim',
            fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CheckboxTest()));
      },
    );
  }

  Widget checkbox1(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Colors.orange[500],
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Text(
        "checkbox1",
        style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'Itim',
            fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CheckboxTest1()));
      },
    );
  }

  Widget checkbox2(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Colors.orange[500],
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Text(
        "checkbox2",
        style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'Itim',
            fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CheckboxTest2()));
      },
    );
  }

  Widget checkbox3(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Colors.orange[500],
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Text(
        "checkbox3",
        style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'Itim',
            fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CheckboxTest3()));
      },
    );
  }

  Widget checkbox4(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Colors.orange[500],
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Text(
        "checkbox4",
        style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'Itim',
            fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CheckboxTest4()));
      },
    );
  }

  Widget searchYear(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Colors.orange[500],
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Text(
        "searchYear",
        style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'Itim',
            fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SearchYear()));
      },
    );
  }

  Widget webScraper(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Colors.orange[500],
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Text(
        "webScraper",
        style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'Itim',
            fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WebScraper()));
      },
    );
  }

  Widget loginView(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Colors.orange[500],
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Text(
        "loginView",
        style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'Itim',
            fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
    );
  }
}
