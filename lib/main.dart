import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/top_level_grouped_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.bebasNeue()
              .fontFamily //satisfy().fontFamily //().fontFamily // ().fontFamily,
          ),
      home: const MyHomePage(title: 'Flutter TV App'),
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
        child: TopLevelGroupedHomeScreen(),
      ),
    );
  }
}

// tvg-id="Zoom.in" tvg-logo="https://i.imgur.com/kcDJ4g0.png" group-title="Undefined",Zoom (1080p)
//      http://103.81.104.118/hls/stream8.m3u8