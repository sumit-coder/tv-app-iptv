import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoPlayer3 extends StatefulWidget {
  VideoPlayer3({Key? key, required this.videoUrl}) : super(key: key);

  final String videoUrl;

  @override
  State<VideoPlayer3> createState() => _VideoPlayer3State();
}

class _VideoPlayer3State extends State<VideoPlayer3> {
  late WebViewController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      // ..loadRequest(Uri.parse("https://www.hlsplayer.org/play?url=${widget.videoUrl}"));
      ..loadRequest(Uri.parse("http://yielding-meeting.surge.sh/?url=${widget.videoUrl}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 300,
          child: WebViewWidget(controller: controller),
        ),
      ),
    );
  }
}
