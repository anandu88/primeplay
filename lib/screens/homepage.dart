import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../widgets/toprated.dart';
import '../widgets/trending.dart';
import '../widgets/tv.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List trendingmovies=[];
  List topratedmovies=[];
  List tvshows=[];

  final String APIKEY='709e47765a519a511af39d381915df32';
  final readaccestoken='yJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MDllNDc3NjVhNTE5YTUxMWFmMzlkMzgxOTE1ZGYzMiIsInN1YiI6IjY0MmE1MzIxYTNlNGJhMmJiMDRmMzYwMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RfByKJweT1G1Ce9ooqVvJEYDiZ5lRlbYTr_MmrIQ_T8';

  @override
  void initState(){
    super.initState();
    loadmovies();
  
  }
  loadmovies()async{
    TMDB tmdbwithcoustomLogs= TMDB(ApiKeys(APIKEY,readaccestoken ),
    logConfig: ConfigLogger(
      showErrorLogs: true,
      showLogs: true));
      Map trendingresult=await tmdbwithcoustomLogs.v3.trending.getTrending();
       Map topratedresult=await tmdbwithcoustomLogs.v3.movies.getTopRated();
        Map tvresult=await tmdbwithcoustomLogs.v3.tv.getPopular();
      setState(() {
        trendingmovies=trendingresult['results'];
        topratedmovies=topratedresult['results'];
        tvshows=tvresult['results'];

      });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(title: Text('PRIMRPLAY'),
      backgroundColor: Colors.transparent,),
      body: ListView(
      children: [
        Trendingmovie(trending:trendingmovies),
      
        Toprated(toprated: topratedmovies,),
        
        TV(tv: tvshows)
       
      ],
      ),
    );
  }
}