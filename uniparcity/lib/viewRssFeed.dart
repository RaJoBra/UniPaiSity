import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:uniparcity/feed.dart';
import 'package:intl/intl.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewRssScreen extends StatefulWidget {
  final  RssFeed;
  ViewRssScreen({Key? key, required this.RssFeed}) : super(key: key);


  @override
  State<ViewRssScreen> createState() => _ViewRssScreenState(this.RssFeed);
}

class _ViewRssScreenState extends State<ViewRssScreen> {
  final RssFeed;
  _ViewRssScreenState(this.RssFeed);


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon:Icon(Ionicons.arrow_back),
          onPressed: ()=> Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) => Feed(title: '')
              )
          ),
        ),
        title: Text(RssFeed['title']),
        centerTitle: true,
      ),
      body:Stack(
        children: [
          Container(
              child: ListView(
                children: [
                  SizedBox(height: 10,),
                  Text(RssFeed['title'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Ionicons.time_outline),
                      Text(DateFormat('MMM dd').format(
                          DateTime.parse(
                              RssFeed['pubDate'].toString()))),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 10,),
                  SizedBox(height: 15,),
                  Html(
                    data: RssFeed['description'],
                  )
                ],
              )
          )

        ],
      ) ,

    );
  }
}