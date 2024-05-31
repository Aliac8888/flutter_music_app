import 'package:flutter/material.dart';

class PopularSongsModel {
  String songName;
  String artist;
  String genre;
  String iconPath;
  bool boxIsSelected;
  Color boxColor;

  PopularSongsModel(
      {required this.songName,
      required this.artist,
      required this.genre,
      required this.iconPath,
      required this.boxIsSelected,
      required this.boxColor});

  static List<PopularSongsModel> getPopulars() {
    List<PopularSongsModel> popularSongs = [];

    popularSongs.add(PopularSongsModel(
      songName: 'All Eyez On Me',
      artist: 'Tupac',
      genre: 'HipHop',
      iconPath: 'assets/icons/rap.svg',
      boxIsSelected: true,
      boxColor: Colors.blueAccent,
    ));
    popularSongs.add(PopularSongsModel(
      songName: 'Smooth Criminal',
      artist: 'MJ',
      genre: 'Pop',
      iconPath: 'assets/icons/pop.svg',
      boxIsSelected: false,
      boxColor: Colors.yellowAccent,
    ));
    popularSongs.add(PopularSongsModel(
      songName: 'Hallelujah',
      artist: 'Loren',
      genre: 'Jazz',
      iconPath: 'assets/icons/jazz.svg',
      boxIsSelected: false,
      boxColor: Colors.orangeAccent,
    ));

    return popularSongs;
  }
}
