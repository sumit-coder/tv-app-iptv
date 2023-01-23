import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tv_app/services/data_services.dart';

import 'channels_list_screen.dart';
import '../../models/channel.dart';
import '../../row_data/grouped_by_category.dart';
import '../../videoplayer.dart';

class GroupedScreen extends StatefulWidget {
  GroupedScreen({Key? key}) : super(key: key);

  @override
  State<GroupedScreen> createState() => _GroupedScreenState();
}

class _GroupedScreenState extends State<GroupedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        elevation: 1,
        // centerTitle: true,
        // toolbarHeight: 100,
        title: const Text('by Category'),
        leading: IconButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 700,
            padding: EdgeInsets.only(top: 16, right: 16, left: 16),
            child: ListView.builder(
              // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 2,
              //   mainAxisSpacing: 8,
              //   crossAxisSpacing: 8,
              //   mainAxisExtent: 200,
              // ),
              itemCount: groupedByCategory.length,
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
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
                          //   child: ClipRRect(
                          //     // borderRadius: BorderRadius.circular(12),
                          //     child: Image.network(
                          //       groupedByCategory[index].topicImageUrl,
                          //       height: 140,
                          //       // fit: BoxFit.cover,
                          //     ),
                          //   ),
                          // ),
                          Positioned(
                            top: 10,
                            left: 5,
                            child: Text(
                              (index + 1).toString(),
                              // maxLines: 2,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.anton(
                                height: 1,
                                fontWeight: FontWeight.w600,
                                fontSize: 50,
                                color: Colors.black12,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -12,
                            right: -2,
                            child: Text(
                              groupedByCategory[index].topicName,
                              // maxLines: 2,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.anton(
                                height: 1,
                                fontWeight: FontWeight.w600,
                                fontSize: 50,
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
      ),
    );
  }

  onTapChannelCard(int index) {
    // print(listOfChannels[index].videoUrl);
    // if (listOfChannels[index].videoUrl.contains('.m3u8')) {
    //   log("online");
    // } else {
    //   log("offline");
    // }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChannelsListScreen(
          channelsUrlm3u: groupedByCategory[index].channelUrl,
          screenTitle: groupedByCategory[index].topicName,
        ),
      ),
    );
  }
}



// print(element.split(' ')[2].split('"')[1]); // (get logo url: final)
// print(element.split('\n')[1]); // (get logo url: final)
// print(element.split(' ')[1].split('"')[1]); // (get url name: final)
//