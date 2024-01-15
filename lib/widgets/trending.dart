import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TrendindMovies extends StatelessWidget {
  final List? trending;

  const TrendindMovies({Key? key, this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Trending Movies',
            size: 26,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: trending!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (Context) => Description(
                            name: trending![index]['original_title'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                trending![index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500' +
                                trending![index]['poster_path'],
                            description: trending![index]['overview'],
                            vote: trending![index]['vote_average'].toString(),
                            launch_on: trending![index]['release_date'],
                          ),
                        ),
                      );
                    },
                    child: trending![index]['title'] != null
                        ? Container(
                            width: 140,
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500' +
                                                  trending![index]
                                                      ['poster_path']))),
                                ),
                                Container(
                                  child: ModifiedText(
                                    text: trending![index]['original_title'] !=
                                            null
                                        ? trending![index]['original_title']
                                        : 'Loading',
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
