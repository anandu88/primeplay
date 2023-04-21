import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/videodescription.dart';

class Trendingmovie extends StatelessWidget {
  
  final List trending;

  const Trendingmovie({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Trending movies',style:GoogleFonts.breeSerif(fontSize: 26) ,),
          SizedBox(height: 10,),
          Container(
            height: 200,
            child: ListView.builder(itemCount: trending.length,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index) {
              return InkWell(
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => 
                 Description(name: trending[index]['title'],
                 
                  bannerurl:  'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],
                   posterurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'], 
                   description: trending[index]['overview'], vote: trending[index]['vote_average'].toString(), 
                   launch_on: trending[index]['release_date'],
                   
                  
                 ),));
                  
                },
                child: Container(padding: EdgeInsets.all(5),
                  
                  child: Column(
                    children: [Container(height: 140,width: 250,
                   
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path']
                        ),fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),SizedBox(height: 10,),
                    Container(
                      child: Text(trending[index]['title']!=null?
                      trending[index]['title']:'loading'),
                    )],
                  ),
                ),
              );
            }, ),
          )
        ],
      ),
    );
  }
}