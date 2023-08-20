import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:movie_app/services/api_service.dart';
import 'package:movie_app/models/movie_detail_model.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final String title, poster;

  const DetailScreen(
      {super.key, required this.id, required this.title, required this.poster});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetailModel> movie;
  late SharedPreferences prefs;
  late String homepage;
  bool isLiked = false;
  static const prefKey = "likedMovies";

  @override
  void initState() {
    super.initState();
    movie = ApiService.getMovieById(widget.id);
    initPrefs();
  }

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedMovies = prefs.getStringList(prefKey);
    if (likedMovies != null) {
      if (likedMovies.contains(widget.id.toString()) == true) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await prefs.setStringList(prefKey, []);
    }
  }

  onHeartTap() async {
    final likedMovies = prefs.getStringList(prefKey);

    if (likedMovies != null) {
      if (isLiked) {
        likedMovies.remove(widget.id.toString());
      } else {
        likedMovies.add(widget.id.toString());
      }

      await prefs.setStringList(prefKey, likedMovies);
      setState(() {
        isLiked = !isLiked;
      });
    }
  }

  void onShare(String text) async {
    final box = context.findRenderObject() as RenderBox?;

    await Share.share(text,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 20),
            onPressed: () => onShare(widget.title),
            icon: const Icon(
              Icons.share,
              size: 20,
              color: Colors.white,
            ),
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 20),
            onPressed: () => _launchInWebViewOrVC(Uri.parse(homepage)),
            icon: const Icon(
              Icons.home,
              size: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/original/${widget.poster}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(0.35),
                  Colors.black.withOpacity(0.35),
                  Colors.black,
                ],
                stops: const [0.0, 0.3, 0.3, 0.9],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: FutureBuilder(
              future: movie,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  homepage = snapshot.data!.homepage;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'MontserratBold',
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${snapshot.data!.runtime} min',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'MontserratSemiBold',
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.star_rate_rounded,
                            size: 20,
                            color: Color(0xff6337be),
                          ),
                          Text(
                            snapshot.data!.voteAverage.toStringAsFixed(1),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'MontserratSemiBold',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var genre in snapshot.data?.genres)
                                Padding(
                                    padding: const EdgeInsets.only(
                                      right: 5,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.white70,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 3,
                                          horizontal: 6,
                                        ),
                                        child: Text(
                                          genre['name'],
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12,
                                            fontFamily: 'MontserratSemiBold',
                                          ),
                                        ),
                                      ),
                                    )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 30),
                        child: Text(
                          snapshot.data!.overview,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontFamily: 'MontserratRegular',
                            height: 1.3,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: IconButton(
                              onPressed: onHeartTap,
                              icon: isLiked
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      color: Colors.grey,
                                    ),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Color(0xff14b9cc),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "바로예매",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ],
                      )
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
