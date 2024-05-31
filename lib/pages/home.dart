import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_basics_rewind/models/category_model.dart';
import 'package:flutter_basics_rewind/models/popular_songs_model.dart';
import 'package:flutter_basics_rewind/models/song_recommend_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<SongRecommendationModel> recommendations = [];
  List<PopularSongsModel> popularSongs = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getRecommendations() {
    recommendations = SongRecommendationModel.getRecommendations();
  }

  void _getPopularSongs() {
    popularSongs = PopularSongsModel.getPopulars();
  }

  @override
  void initState() {
    super.initState();
    _getCategories();
    _getRecommendations();
    _getPopularSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchField(),
          const SizedBox(
            height: 40,
          ),
          _categoriesSection(),
          const SizedBox(
            height: 40,
          ),
          _recommendationSection(),
          const SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Popular Songs',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: popularSongs[index].boxIsSelected
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: popularSongs[index].boxIsSelected
                              ? [
                                  BoxShadow(
                                      color: const Color(0xff1D1617)
                                          .withOpacity(0.07),
                                      offset: const Offset(0, 10),
                                      blurRadius: 40,
                                      spreadRadius: 0)
                                ]
                              : []),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(
                                popularSongs[index].iconPath,
                                height: 40,
                                width: 65,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                popularSongs[index].songName,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "${popularSongs[index].genre} | ${popularSongs[index].artist}",
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 25,
                    );
                  },
                  itemCount: popularSongs.length)
            ],
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  Column _recommendationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Recommendation Songs',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 240,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  width: 210,
                  decoration: BoxDecoration(
                      color: recommendations[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        recommendations[index].iconPath,
                        height: 50,
                      ),
                      Column(
                        children: [
                          Text(
                            recommendations[index].songName,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          Text(
                            "${recommendations[index].genre} | ${recommendations[index].artist}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black45,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        child: Center(
                          child: Text(
                            'Listen',
                            style: TextStyle(
                                color: recommendations[index].viewIsSelected
                                    ? Colors.white
                                    : const Color(0xffC58BF2),
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(colors: [
                              recommendations[index].viewIsSelected
                                  ? const Color(0xff9DCEFF)
                                  : Colors.transparent,
                              recommendations[index].viewIsSelected
                                  ? const Color(0xff92A3FD)
                                  : Colors.transparent,
                            ])),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 25,
                );
              },
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
              itemCount: recommendations.length),
        )
      ],
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 120,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 25,
                );
              },
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(categories[index].iconPath),
                        ),
                      ),
                      Text(categories[index].name)
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0),
      ]),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: const Icon(CupertinoIcons.search),
            suffixIcon: IntrinsicHeight(
              child: Container(
                width: 100,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Colors.black,
                      thickness: 0.1,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Icon(CupertinoIcons.ellipsis_circle),
                    SizedBox(
                      width: 8,
                    )
                  ],
                ),
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search Rapper',
            hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
            contentPadding: const EdgeInsets.all(15),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        "Music App",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
          child: const Icon(CupertinoIcons.arrow_left),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(CupertinoIcons.ellipsis),
          ),
        )
      ],
    );
  }
}
