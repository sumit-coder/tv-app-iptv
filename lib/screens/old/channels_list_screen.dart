import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tv_app/services/data_services.dart';

import '../../models/channel.dart';
import '../../player2.dart';
import '../../player3.dart';
import '../../videoplayer.dart';

class ChannelsListScreen extends StatefulWidget {
  ChannelsListScreen({Key? key, required this.channelsUrlm3u, required this.screenTitle})
      : super(key: key);

  final String channelsUrlm3u;
  final String screenTitle;

  @override
  State<ChannelsListScreen> createState() => _ChannelsListScreenState();
}

class _ChannelsListScreenState extends State<ChannelsListScreen> {
  List<Channel> listOfChannels = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getListOfChannels(
      catURL_m3u: widget.channelsUrlm3u,
    ).then((value) {
      setState(() {
        listOfChannels = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        elevation: 1,
        centerTitle: true,
        toolbarHeight: 64,
        // title: Text(widget.screenTitle),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Baseline(
              baseline: 33,
              baselineType: TextBaseline.alphabetic,
              child: Text(
                widget.screenTitle,
                // maxLines: 2,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.anton(
                  height: 1,
                  fontWeight: FontWeight.w600,
                  fontSize: 34,
                  color: Colors.blue.shade100,
                ),
              ),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
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
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 220,
              ),
              itemCount: listOfChannels.length,
              // shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
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
                              listOfChannels[index].logoUrl,
                              height: 140,
                              // fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12, left: 8, right: 8),
                          child: Text(
                            listOfChannels[index].name,
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
      ),
    );
  }

  onTapChannelCard(int index) {
    print(listOfChannels[index].videoUrl);
    if (listOfChannels[index].videoUrl.contains('.m3u8')) {
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
          channelUrl: listOfChannels[index].videoUrl,
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