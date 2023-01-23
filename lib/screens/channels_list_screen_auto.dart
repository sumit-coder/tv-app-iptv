import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tv_app/services/data_services.dart';

import '../models/channel.dart';
import '../player2.dart';
import '../player3.dart';
import '../videoplayer.dart';

class ChannelsListScreenAuto extends StatefulWidget {
  ChannelsListScreenAuto(
      {Key? key, required this.listOfChannelsFromGroup, required this.screenTitle})
      : super(key: key);

  final List<Map> listOfChannelsFromGroup;
  final String screenTitle;

  @override
  State<ChannelsListScreenAuto> createState() => _ChannelsListScreenAutoState();
}

class _ChannelsListScreenAutoState extends State<ChannelsListScreenAuto> {
  // List<Map> listOfChannels = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // setState(() {

    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          widget.screenTitle,
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
                height:
                    MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - 56,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 220,
                  ),
                  padding: EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 16),

                  itemCount: widget.listOfChannelsFromGroup.length,
                  // shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    // if there is no data for the chennal like name or image url
                    if (widget.listOfChannelsFromGroup[index]['logoUrl'] == '' &&
                        widget.listOfChannelsFromGroup[index]['name'] == '') {
                      return Card(
                        elevation: 1,
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        color: Colors.red.shade200,
                        child: InkWell(
                          onTap: () {
                            onTapChannelCard(index);
                          },
                          child: Center(
                            child: Text(
                              'No Info',
                              style: TextStyle(color: Colors.red.shade100),
                            ),
                          ),
                        ),
                      );
                    }
                    return Card(
                      elevation: 1,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      color: Colors.blue.shade200,
                      child: InkWell(
                        onTap: () {
                          onTapChannelCard(index);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
                              child: ClipRRect(
                                // borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  widget.listOfChannelsFromGroup[index]['logoUrl'],
                                  height: 140,
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12, left: 8, right: 8),
                              child: Text(
                                widget.listOfChannelsFromGroup[index]['name'],
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  // fontWeight: FontWeight.w00,
                                  color: Colors.white,
                                  fontSize: 18,
                                  // letterSpacing: 1,
                                ),
                              ),
                            )
                          ],
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
    print(widget.listOfChannelsFromGroup[index]['videoUrl']);
    // print(widget.listOfChannelsFromGroup[index]['name']);
    // print(widget.listOfChannelsFromGroup[index]['logoUrl']);
    // print(widget.listOfChannelsFromGroup[index]);
    if (widget.listOfChannelsFromGroup[index]['videoUrl'].contains('.m3u8')) {
      log("online");
    } else {
      log("offline");
    }

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => VideoPlayer(
    //       channelUrl: listOfChannels[index].videoUrl,
    //     ),
    //   ),
    // );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoApp(
          channelUrl: widget.listOfChannelsFromGroup[index]['videoUrl'],
        ),
      ),
    );

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => VideoPlayer3(
    //       videoUrl: listOfChannels[index].videoUrl,
    //     ),
    //   ),
    // );
  }
}



// print(element.split(' ')[2].split('"')[1]); // (get logo url: final)
// print(element.split('\n')[1]); // (get logo url: final)
// print(element.split(' ')[1].split('"')[1]); // (get url name: final)
//