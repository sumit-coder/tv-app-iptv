import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;

import '../models/channel.dart';

Future<List<Channel>> getListOfChannels({required String catURL_m3u}) async {
  List<Channel> listOfChannels = [];
  http.Response response = await http.get(Uri.parse(catURL_m3u));

  List<String> listOfChannelsRow = response.body.split('#EXTINF:-1');

  listOfChannelsRow.forEach(
    (element) {
      try {
        // print(element.split(' ')[2].split('"')[1]); // (get logo url: final)
        // print(element.split('\n')[1]); // (get logo url: final)
        // print(element.split(' ')[1].split('"')[1]); // (get url name: final)
        //
        listOfChannels.add(
          Channel(
            name: element.split(' ')[1].split('"')[1], // same
            nameUrl: element.split(' ')[1].split('"')[1], // same
            logoUrl: element.split(' ')[2].split('"')[1],
            videoUrl: element.split('\n')[1],
          ),
        );
      } catch (e) {
        log('channel error');
      }
    },
  );
  print(listOfChannels[0].name);

  return listOfChannels;

  // print(response.body);
}

Future<Map> getListOfChannelsByCountry({required String catURL_m3u}) async {
  List<Map> listOfChannels = [];
  http.Response response = await http.get(Uri.parse(catURL_m3u));

  List<String> listOfChannelsRow = response.body.split('#EXTINF:-1');

//   String rowData =
//       '''#EXTINF:-1 tvg-id="TVMInternacional.mz" tvg-logo="https://i.imgur.com/fRV6p50.png" group-title="Åland",TVM Internacional (480p) [Not 24/7]
// http://online.tvm.co.mz:1935/live/smil:Channel2.smil/playlist.m3u8
// #EXTINF:-1 tvg-id="UNWebTV.us" tvg-logo="https://i.imgur.com/UcAwBep.png" group-title="Åland",UN Web TV (540p)
// https://cdnapi.kaltura.com/p/2503451/sp/250345100/playManifest/entryId/1_gb6tjmle/protocol/https/format/applehttp/a.m3u8
// #EXTINF:-1 tvg-id="WION.in" tvg-logo="https://i.imgur.com/Wc5Z3iS.png" group-title="Åland",Wion (576p)
// http://210.210.155.37/uq2663/h/h91/index.m3u8
// #EXTINF:-1 tvg-id="WorldPokerTour.us" tvg-logo="https://i.imgur.com/98kLMjj.png" group-title="Åland2",World Poker Tour (1080p) [Not 24/7]
// https://d3w4n3hhseniak.cloudfront.net/v1/master/9d062541f2ff39b5c0f48b743c6411d25f62fc25/WPT-SportsTribal/120.m3u8
// ''';

  // List<String> listOfChannelsRow = rowData.split('#EXTINF:-1');

  // print(listOfChannelsRow[1]);

  listOfChannelsRow.forEach(
    (element) {
      try {
        // print(element.split(' ')[2].split('"')[1]); // (get logo url: final)
        // print(element.split(' ')[3].split('"')[1]); // (get group-title: final)
        // print(element.split('\n')[1]); // (get video url: final)
        // print(element.split(' ')[1].split('"')[1]); // (get url name: final)
        //
        listOfChannels.add({
          "name": element.split(' ')[1].split('"')[1], // no Name
          "nameUrl": element.split(' ')[1].split('"')[1], // Url Name
          "logoUrl": element.split(' ')[2].split('"')[1], // Logo Image Url
          "groupTitle": element.split(' ')[3].split('"')[1], // Group Title
          "videoUrl": element.split('\n')[1], // Video Url m3u8
        });
      } catch (e) {
        log('channel error');
      }
    },
  );

  Map channelsByCountrysMap = groupBy(listOfChannels, (Map obj) => obj['groupTitle']);
  // this will saprate All Objects by groupTitle

  // print(listOfChannels);
  print(channelsByCountrysMap.length);

  return channelsByCountrysMap;

  // print(response.body);
}
