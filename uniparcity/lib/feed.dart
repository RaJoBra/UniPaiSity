import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:uniparcity/CustomBottomNavBar.dart';
import 'package:uniparcity/profil.dart';
import 'dart:async';
import 'dart:convert';
import 'package:animations/animations.dart';
import 'package:webfeed/webfeed.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:uniparcity/viewRssFeed.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {

  bool isAdVisible=true;
  bool isLoading=false;
  late RssFeed rss=RssFeed();

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    try {
      setState(() {
        isLoading=true;
      });

      // This is an open REST API endpoint for testing purposes
      const API = 'https://www.iwi.hs-karlsruhe.de/intranet/feed/rss/news.xml';
      final  response = await get(Uri.parse(API));
      var channel = RssFeed.parse(response.body);
      setState(() {
        rss=channel;
        isLoading=false;
      });
    } catch (err) {
      throw err;
    }
  }

  @override
  Widget build(BuildContext context) {
    const transitionType=ContainerTransitionType.fadeThrough;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Feed"),
        actions:<Widget>[
          IconButton(onPressed: () => loadData(),
              icon: const Icon(Icons.refresh),
              ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profil()),
              );
            },
            icon: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      body:Stack(
        children: [
          isLoading==false?
          ListView.builder(
              itemCount: rss.items!.length,
              itemBuilder: (BuildContext context, index) {
                final item = rss.items![index];
                final feedItems={
                  'title':item.title,
                  'description':item.description,
                  'pubDate':item.pubDate,
                };
                print(feedItems);
                return InkWell(
                    onTap:() => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder:
                            (context) => ViewRssScreen(RssFeed: feedItems)
                        )
                    ),
                    child: ListTile(
                      title: Text(item.title.toString()),
                      subtitle:Row(
                        children: [
                          const Icon(Ionicons.time_outline),
                          Text(DateFormat('MMM dd').format(
                              DateTime.parse(
                                  item.pubDate.toString()))),
                          Spacer(),
                        ],
                      ) ,
                    )
                );
              }

          )
              :
          const Center(child: CircularProgressIndicator(),),

        ],
      ) ,

    );
  }
}