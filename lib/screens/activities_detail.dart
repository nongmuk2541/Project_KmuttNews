//import 'package:New_Project_KMUTTNEWS/service/add_news_service.dart';
import 'package:New_Project_KMUTTNEWS/service/logger_service.dart';
import 'package:New_Project_KMUTTNEWS/widget/circle_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ActivitiesDatail extends StatefulWidget {
  static const routeName = "/activities/detail";
  @override
  _ActivitiesDatailState createState() => _ActivitiesDatailState();
}

class _ActivitiesDatailState extends State<ActivitiesDatail> {
  @override
  Widget build(BuildContext context) {
    final ActivitiesDatailParams params =
        ModalRoute.of(context).settings.arguments as ActivitiesDatailParams;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(18.0, 15.0, 18.0, 0),
              child: Row(
                children: [
                  CircleButton(
                    icon: Icons.arrow_back_ios,
                    onTap: () => Navigator.pop(context),
                  ),
                  Spacer(),
                  CircleButton(
                    icon: Icons.share,
                    onTap: () {},
                  ),
                  CircleButton(
                    icon: Icons.favorite_border,
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Activities")
            .doc(params.id)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                children: <Widget>[
                  CircularProgressIndicator(),
                  Text("Loading........."),
                ],
              ),
            );
          }
          if (snapshot.hasData) {
            final item = snapshot.data;
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: ListView(
                children: [
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    height: 220.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          image: NetworkImage(item['picture']),
                          fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                  item['title'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                   color: Colors.black,
                   fontSize: 18,
                   fontFamily: 'Itim',
                   fontWeight: FontWeight.bold
                  ),                  
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    item['detail'],
                   style: TextStyle(
                   color: Colors.black,
                   fontSize: 15,
                   fontFamily: 'Itim',
                   
                  ), 
                  )
                ],
              ),
            );
          }
          if (snapshot.hasError) {
            logger.e("Fetch news error : ${snapshot.error.toString()}");
            return Center(
              child: Column(
                children: <Widget>[
                  Text("Error Something........."),
                ],
              ),
            );
          }
          return Center(
            child: Column(
              children: <Widget>[
                Text("No Data........."),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ActivitiesDatailParams {
  final String id;
  final String title;

  ActivitiesDatailParams(this.id, this.title);
}
