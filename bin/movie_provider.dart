import 'dart:convert';

import 'package:http/http.dart' as http;

import 'now_playing_response.dart';

class MovieProvider{

  final String _authority     = 'api.themoviedb.org';
  final String _unencodePath  = '3/movie/now_playing';
  final String _apiKey        = 'a27fc2203f51a1bb39546fb877cdac6a';
  final String _language      = 'es-ES';


  void getNowPlaying() async {

    final url = Uri.https(_authority, _unencodePath, {

      'api_key': _apiKey,
      'language': _language
    });

    final response  = await http.get(url);

    final NowPlayingResponse nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    print(nowPlayingResponse.results![0].title);

    // final decodedData = json.decode(response.body);
    // print(decodedData['results'][0]);

  } 




}