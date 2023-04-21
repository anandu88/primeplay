import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/videodescription.dart';

class TV extends StatelessWidget {
  
  final List tv;

  const TV({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('popular TV',style:GoogleFonts.breeSerif(fontSize: 26) ,),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(itemCount: tv.length,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index) {
              return InkWell(
               onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => 
                 Description(name: tv[index]['title'],
                 
                  bannerurl:  'https://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path'],
                   posterurl: 'https://image.tmdb.org/t/p/w500'+tv[index]['poster_path'], 
                   description: tv[index]['overview'], vote: tv[index]['vote_average'].toString(), 
                   launch_on: tv[index]['release_date'],
                   
                  
                 ),));
                  
                },
                child:tv[index]['title'] !=null?Container(
                  width: 140,
                  child: Column(
                    children: [Container(height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500'+tv[index]['poster_path']
                        ))
                      ),
                    ),
                    Container(
                      child: Text(tv[index]['original_name']!=null?
                      tv[index]['original_name']:'loading'),
                    )],
                  ),
                ):Container()
              );
            }, ),
          )
        ],
      ),
    );
  }
}