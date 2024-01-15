import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TvShows extends StatelessWidget {
  final List? tvshow;

  const TvShows({Key? key, this.tvshow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Popular TV Shows',
            size: 26,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: tvshow?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (Context) => Description(
                            name: tvshow![index]['original_name'] ?? 'N/A',
                            bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                (tvshow![index]['backdrop_path'] ?? ''),
                            posterurl: 'https://image.tmdb.org/t/p/w500' +
                                (tvshow![index]['poster_path'] ?? ''),
                            description: tvshow![index]['overview'] ??
                                'No description available',
                            vote: (tvshow![index]['vote_average'] ?? 0.0)
                                .toString(),
                            launch_on: tvshow![index]['release_date'] ?? 'N/A',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      (tvshow![index]['backdrop_path'] ?? ''),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: ModifiedText(
                              text: tvshow![index]['original_name'] != null
                                  ? tvshow![index]['original_name']
                                  : 'Loading',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
