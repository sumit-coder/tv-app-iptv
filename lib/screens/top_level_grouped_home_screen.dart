import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tv_app/screens/grouped_screen_auto.dart';
import 'package:tv_app/services/data_services.dart';

import '../row_data/row_data.dart';
import 'old/channels_list_screen.dart';
import '../models/channel.dart';
import '../row_data/grouped_by_category.dart';
import '../videoplayer.dart';

class TopLevelGroupedHomeScreen extends StatefulWidget {
  TopLevelGroupedHomeScreen({Key? key}) : super(key: key);

  @override
  State<TopLevelGroupedHomeScreen> createState() => _TopLevelGroupedHomeScreenState();
}

class _TopLevelGroupedHomeScreenState extends State<TopLevelGroupedHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue.shade200,
      //   elevation: 1,
      //   // centerTitle: true,
      //   // toolbarHeight: 100,
      //   flexibleSpace: ,
      // ),
      backgroundColor: Color.fromARGB(255, 244, 250, 255),
      body: SafeArea(
        child: Column(
          children: [
            Card(
              elevation: 1,
              margin: EdgeInsets.zero,
              child: Container(
                color: Colors.blue.shade300,
                height: 56,
                child: Container(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 16),
                      Baseline(
                        baseline: 28,
                        baselineType: TextBaseline.alphabetic,
                        child: Text(
                          'Watch Me TV',
                          style: TextStyle(
                            color: Colors.blue.shade200,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: 700,
                padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                child: ListView.builder(
                  itemCount: topLevelRowDataByTopLevelCategorys.length,
                  // shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 1,
                      clipBehavior: Clip.hardEdge,
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      color: Colors.blue.shade200,
                      child: InkWell(
                        onTap: () {
                          onTapChannelCard(index);
                        },
                        child: Container(
                          height: 88,
                          child: Stack(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Positioned(
                                top: 10,
                                left: 5,
                                child: Row(
                                  children: [
                                    Text(
                                      (index + 1).toString(),
                                      // maxLines: 2,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.anton(
                                        height: 1,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: Colors.black12,
                                      ),
                                    ),
                                    Text(
                                      " Grouped by",
                                      // maxLines: 2,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.anton(
                                        height: 1,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: Colors.black12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: -12,
                                right: -2,
                                child: Text(
                                  topLevelRowDataByTopLevelCategorys[index]['categoryName'],
                                  // to get group name
                                  // maxLines: 2,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.anton(
                                    height: 1,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 42,
                                    color: Colors.blue.shade100,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTapChannelCard(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GroupedScreenAuto(
          screenName: 'by ' + topLevelRowDataByTopLevelCategorys[index]['categoryName'],
          groupChannelsUrl: topLevelRowDataByTopLevelCategorys[index]['playlistUrl'],
        ),
      ),
    );
  }
}



// print(element.split(' ')[2].split('"')[1]); // (get logo url: final)
// print(element.split('\n')[1]); // (get logo url: final)
// print(element.split(' ')[1].split('"')[1]); // (get url name: final)
//