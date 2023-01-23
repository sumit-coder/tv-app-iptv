import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tv_app/services/data_services.dart';

import 'channels_list_screen_auto.dart';
import 'old/channels_list_screen.dart';
import '../models/channel.dart';
import '../row_data/grouped_by_category.dart';
import '../videoplayer.dart';

class GroupedScreenAuto extends StatefulWidget {
  GroupedScreenAuto({Key? key, required this.screenName, required this.groupChannelsUrl})
      : super(key: key);

  final String screenName;
  final String groupChannelsUrl;

  @override
  State<GroupedScreenAuto> createState() => _GroupedScreenAutoState();
}

class _GroupedScreenAutoState extends State<GroupedScreenAuto> {
  late Map<dynamic, dynamic> listOfChannelsByGroup;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListOfChannelsByCountry(catURL_m3u: widget.groupChannelsUrl).then((value) {
      setState(() {
        listOfChannelsByGroup = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue.shade200,
      //   elevation: 1,
      //   // centerTitle: true,
      //   toolbarHeight: 52,
      //   title: Text(widget.screenName),
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     padding: EdgeInsets.zero,
      //     constraints: BoxConstraints(),
      //     icon: const Icon(Icons.arrow_back),
      //   ),
      // ),
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
                      SizedBox(width: 12),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.blue.shade200,
                        ),
                      ),
                      SizedBox(width: 12),
                      Baseline(
                        baseline: 28,
                        baselineType: TextBaseline.alphabetic,
                        child: Text(
                          widget.screenName,
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
            isLoading
                ? Expanded(
                    child: Center(child: CircularProgressIndicator(color: Colors.blue.shade200)))
                : SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          56,
                      child: ListView.builder(
                        itemCount: listOfChannelsByGroup.length,
                        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
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
                                      bottom: 0,
                                      left: 5,
                                      child: Row(
                                        children: [
                                          Text(
                                            listOfChannelsByGroup.entries
                                                .elementAt(index)
                                                .value
                                                .length
                                                .toString(),
                                            // maxLines: 2,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.anton(
                                              height: 1,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20,
                                              color: Colors.black12,
                                            ),
                                          ),
                                          Text(
                                            " Channels",
                                            // maxLines: 2,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.anton(
                                              height: 1,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: Colors.black12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                          fontSize: 42,
                                          color: Colors.black12,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -12,
                                      right: -2,
                                      child: Text(
                                        listOfChannelsByGroup.entries.elementAt(index).key,
                                        // to get group name
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
          ],
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
    List<Map> listOfChannelsFromGroup = listOfChannelsByGroup.entries.elementAt(index).value;
    // this will give the list of channels of group

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChannelsListScreenAuto(
          listOfChannelsFromGroup: listOfChannelsFromGroup,
          screenTitle: listOfChannelsByGroup.entries.elementAt(index).key,
        ),
      ),
    );
  }
}



// print(element.split(' ')[2].split('"')[1]); // (get logo url: final)
// print(element.split('\n')[1]); // (get logo url: final)
// print(element.split(' ')[1].split('"')[1]); // (get url name: final)
//