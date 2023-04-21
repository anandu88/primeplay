import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  final String name,description,bannerurl,posterurl,vote,launch_on;
  const Description({super.key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.launch_on});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 250,
                    width: double.infinity,
                    child: Image.network(bannerurl,fit: BoxFit.cover,),
                  )),
                  Positioned(bottom: 10,child:Text('average rating -'+vote,style: GoogleFonts.roboto(fontSize: 17))),
                  

                ],
              ),
            ),
            SizedBox(height: 10,),
            Container( 
              padding: EdgeInsets.all(8),
              child:Text(name!=null?name:'not loaded',style: GoogleFonts.roboto(fontSize: 22),) ,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text('Releasing on- '+launch_on,style: GoogleFonts.roboto(fontSize: 14),),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl,),
                ),
                Flexible(
                  child: Container(
                    child: Text(description,style: GoogleFonts.roboto(fontSize: 17),),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ) ;
  }
}