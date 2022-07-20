import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../api/api_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                FutureBuilder(
                  future: ApiService().getNews(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.articles.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                              margin: const EdgeInsets.all(10.0),
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[850],
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        Colors.grey.shade600.withOpacity(0.5),
                                    blurRadius: 5,
                                    offset: Offset.fromDirection(0, 4),
                                    spreadRadius: 3.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: snapshot
                                        .data.articles[index].urlToImage,
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                            'assets/images/bitcoin.jpg'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          snapshot.data.articles[index].title,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          snapshot
                                              .data.articles[index].description,
                                          style: TextStyle(
                                            color: Colors.grey.shade200,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
