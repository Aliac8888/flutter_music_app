import 'package:flutter/material.dart';

class SongRecommendationModel {
  String songName;
  String artist;
  String genre;
  String iconPath;
  bool viewIsSelected;
  Color boxColor;

  SongRecommendationModel(
      {required this.songName,
      required this.artist,
      required this.genre,
      required this.iconPath,
      required this.viewIsSelected,
      required this.boxColor});

  static List<SongRecommendationModel> getRecommendations() {
    List<SongRecommendationModel> recommendations = [];

    recommendations.add(SongRecommendationModel(
      songName: 'All Eyez On Me',
      artist: 'Tupac',
      genre: 'HipHop',
      iconPath: 'assets/icons/rap.svg',
      viewIsSelected: true,
      boxColor: Colors.blueAccent,
    ));
    recommendations.add(SongRecommendationModel(
      songName: 'Smooth Criminal',
      artist: 'MJ',
      genre: 'Pop',
      iconPath: 'assets/icons/pop.svg',
      viewIsSelected: false,
      boxColor: Colors.yellowAccent,
    ));
    recommendations.add(SongRecommendationModel(
      songName: 'Hallelujah',
      artist: 'Loren',
      genre: 'Jazz',
      iconPath: 'assets/icons/jazz.svg',
      viewIsSelected: false,
      boxColor: Colors.orangeAccent,
    ));
    recommendations.add(SongRecommendationModel(
      songName: 'Sad But true',
      artist: 'Metallica',
      genre: 'Rock',
      iconPath: 'assets/icons/rock.svg',
      viewIsSelected: false,
      boxColor: Colors.greenAccent,
    ));

    return recommendations;
  }
}
