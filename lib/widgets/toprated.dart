import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/videodescription.dart';

class Toprated extends StatelessWidget {
  
  final List toprated;

  const Toprated({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Top Rated movies',style:GoogleFonts.breeSerif(fontSize: 26) ,),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(itemCount: toprated.length,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index) {
              return InkWell(
                 onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => 
                 Description(name: toprated[index]['title'],
                 
                  bannerurl:  'https://image.tmdb.org/t/p/w500'+toprated[index]['backdrop_path'],
                   posterurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'], 
                   description: toprated[index]['overview'], vote: toprated[index]['vote_average'].toString(), 
                   launch_on: toprated[index]['release_date'],
                   
                  
                 ),));
                  
                },
                child: Container(
                  width: 140,
                  child: Column(
                    children: [Container(height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                        ))
                      ),
                    ),
                    Container(
                      child: Text(toprated[index]['title']!=null?
                      toprated[index]['title']:'loading'),
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