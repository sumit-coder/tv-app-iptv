import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m3u_nullsafe/m3u_nullsafe.dart';
import 'package:tv_app/player3.dart';
import 'package:tv_app/screens/old/channels_list_screen.dart';
import 'package:tv_app/services/data_services.dart';
import 'package:tv_app/videoplayer.dart';

import 'player2.dart';
import 'screens/old/grouped_screen.dart';
import 'screens/grouped_screen_auto.dart';
import 'screens/top_level_grouped_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.bebasNeue()
              .fontFamily //satisfy().fontFamily //().fontFamily // ().fontFamily,
          ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // child: GroupedScreen(),
        // child: Column(
        //   children: [
        //     MaterialButton(
        //       onPressed: () {
        //         getListOfChannelsByCountry(catURL_m3u: '');
        //       },
        //       child: const Text("Hi"),
        //     ),
        //   ],
        // ),
        // child: GroupedScreenAuto(),
        child: TopLevelGroupedHomeScreen(),
        // child: VideoPlayer3(videoUrl: '',),
        // child: ChannelsListScreen(
        //   channelsUrlm3u: 'https://iptv-org.github.io/iptv/categories/animation.m3u',
        // ),
        // child: VideoPlayer(),
        // child: Column(
        //   children: [
        //     MaterialButton(
        //       onPressed: () {
        //         List<String> listOfChannels = channelsData.split('#EXTINF:-1');

        //         listOfChannels.forEach((element) {
        //           // log(element.split(' ').toString());
        //           // print(element.split(' '));
        //           try {
        //             // print(element.split(' ')[1]); // (get tvg id: row)
        //             // print(element.split(' ')[2]); // (get tvg-logo: row)
        //             // print(element.split(' ')[3]); // (get group-title: row)
        //             print(element.split('\n')[1]); // (get url: final)
        //             // print(element.);
        //           } catch (e) {
        //             print('object');
        //           }
        //         });

        //         // print(listOfChannels[1].split(' ')[1]);
        //       },
        //       child: Text('.M3U'),
        //     )
        //   ],
        // ),
      ),
    );
  }
}

// tvg-id="Zoom.in" tvg-logo="https://i.imgur.com/kcDJ4g0.png" group-title="Undefined",Zoom (1080p)
//      http://103.81.104.118/hls/stream8.m3u8