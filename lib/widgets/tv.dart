import 'package:flutter/material.dart';

import '../utils/text.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({Key? key, required this.tv}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: 'Popular TV Shows',
            size: 26,
          ),
          SizedBox(height: 10),
          Container(
              // color: Colors.red,
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(5),
                      // color: Colors.green,
                      width: 250,
                      
                      child:tv[index]['backdrop_path']!=null? Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          tv[index]['backdrop_path']),
                                  fit: BoxFit.cover),
                            ),
                            height: 140,
                          ),
                          SizedBox(height: 5),
                          Container(
                            child: modified_text(
                                size: 15,
                                text: tv[index]['original_name'] ?? 'Loading'),
                          )
                        ],
                      ):const Center(child: Text("Films details not available ")),
                    );
                  }))
        ],
      ),
    );
  }
}
