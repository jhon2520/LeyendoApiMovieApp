
import 'dart:convert';

import 'movie.dart';

class NowPlayingResponse{

  Dates? dates;
  int? page;
  int? totalPages;
  int? totalResults;
  List<Movie>? results;

  NowPlayingResponse({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults
  });

  factory NowPlayingResponse.fromJson(String str){
    return NowPlayingResponse.fromMap(json.decode(str));
  }

  factory NowPlayingResponse.fromMap(Map<String,dynamic> json){
    return NowPlayingResponse(
      dates         : Dates.fromMap(json['dates']),
      page          : json['page'],
      results       : List<Movie>.from(json['results'].map((x)=> Movie.fromMap(x))),
      totalPages    : json['total_pages'],
      totalResults  : json['total_results'],
    );
  }



}

class Dates{

  DateTime? maximum;
  DateTime? minimum;

  Dates({
    this.maximum,
    this.minimum
  });

  factory Dates.fromMap(Map<String,dynamic> json)
  {
    return Dates(
      maximum: DateTime.parse(json['maximum']),
      minimum: DateTime.parse(json['minimum'])
    );
  }

}