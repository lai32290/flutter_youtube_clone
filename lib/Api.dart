import 'package:dio/dio.dart';
import 'models/Video.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

const BASE_URL = 'https://www.googleapis.com/youtube/v3';

class Api {
  search(String keyword) async {
    String youtubeApiKey = DotEnv.env['YOUTUBE_API_KEY'];

    String url = '$BASE_URL/search?part=snippet'
        '&type=video'
        '&maxResults=20'
        '&order=date'
        '&q=$keyword'
        '&key=$youtubeApiKey';
    Response response = await Dio().get(url);

    if (response.statusCode == 200) {
      List<Video> videos = response.data['items'].map<Video>((video) {
        return Video.fromJson(video);
      }).toList();

      for(var video in videos) {
        print(video.id);
      }
       
    } else {
      //
    }
  }
}
