import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TopRated extends StatelessWidget {
  final List? toprated;

  const TopRated({Key? key, this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Top Rated Movies',
            size: 26,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: toprated!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (Context) => Description(
                            name: toprated![index]['original_title'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                toprated![index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500' +
                                toprated![index]['poster_path'],
                            description: toprated![index]['overview'],
                            vote: toprated![index]['vote_average'].toString(),
                            launch_on: toprated![index]['release_date'],
                          ),
                        ),
                      );
                    },
                    child: toprated![index]['title'] != null
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
                                                  toprated![index]
                                                      ['poster_path']))),
                                ),
                                Container(
                                  child: ModifiedText(
                                    text: toprated![index]['original_title'] !=
                                            null
                                        ? toprated![index]['original_title']
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
