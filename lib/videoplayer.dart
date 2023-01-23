import 'package:flutter/material.dart';
import 'package:video_viewer/video_viewer.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer({Key? key, required this.channelUrl}) : super(key: key);

  final String channelUrl;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: FutureBuilder<Map<String, VideoSource>>(
            future: VideoSource.fromM3u8PlaylistUrl(
              // "https://d1vd9xhq6jlm48.cloudfront.net/out/v1/71fcc57c8fe74c5b938451bc2435a93e/index_4.m3u8",
              widget.channelUrl,
              formatter: (quality) =>
                  quality == "Auto" ? "Automatic" : "${quality.split("x").last}p",
            ),
            builder: (_, data) {
              return data.hasData
                  ? Stack(
                      children: [
                        ClipRect(
                          child: VideoViewer(
                            autoPlay: true,
                            source: data.data!,
                            onFullscreenFixLandscape: true,
                            style: VideoViewerStyle(
                                progressBarStyle: ProgressBarStyle(
                                    fullScreenExit: Container(), fullScreen: Container())
                                // thumbnail: Image.network(
                                //   "https://play-lh.googleusercontent.com/aA2iky4PH0REWCcPs9Qym2X7e9koaa1RtY-nKkXQsDVU6Ph25_9GkvVuyhS72bwKhN1P",
                                // ),
                                ),
                          ),
                        ),
                      ],
                    )
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
