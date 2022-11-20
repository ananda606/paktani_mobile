import 'package:paktani_mobile/common/constants.dart';
import 'package:paktani_mobile/presentation/pages/watchlist_movies_page.dart';
import 'package:paktani_mobile/presentation/pages/watchlist_tvseries_page.dart';
import 'package:flutter/material.dart';

class WatchlistPage extends StatelessWidget {
  static const ROUTE_NAME = '/watchlist_page';

  const WatchlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBox) {
          return <Widget>[
            new SliverAppBar(
              title: Text('Watchlist'),
              bottom: TabBar(
                indicatorColor: kPrussianBlue,
                tabs: [
                  _tabBarWatchlist('TV Series', Icons.live_tv),
                  _tabBarWatchlist('Movies', Icons.movie_creation_outlined),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          children: <Widget>[
            WatchlistTVSeriesPage(),
            WatchlistMoviesPage(),
          ],
        ),
      )),
    );
  }

  Widget _tabBarWatchlist(String title, IconData iconData) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Icon(iconData),
      ),
    );
  }
}
