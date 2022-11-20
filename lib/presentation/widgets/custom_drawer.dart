import 'package:paktani_mobile/presentation/pages/home_movie_page.dart';
import 'package:paktani_mobile/presentation/pages/home_tvseries_page.dart';
import 'package:paktani_mobile/presentation/pages/about_page.dart';
import 'package:paktani_mobile/presentation/pages/watchlist_page.dart';
import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  final String pageRoute;
  DrawerApp({required this.pageRoute});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
                //  backgroundImage: AssetImage('assets/circle-g.png'),
                ),
            accountName: Text('User'),
            accountEmail: Text('user@gmail.com'),
          ),
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('Gopay'),
            onTap: () {},
            trailing: Text('Rp.1.000.000'),
          ),
          ListTile(
            leading: Icon(Icons.tv),
            title: Text('TVSeries'),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, HomeTVSeriesPage.ROUTE_NAME);
            },
          ),
          ListTile(
            leading: Icon(Icons.movie),
            title: Text('Movies'),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeMoviePage.ROUTE_NAME);
            },
          ),
          ListTile(
            leading: Icon(Icons.save_alt),
            title: Text('Watchlist'),
            onTap: () {
              Navigator.pushNamed(context, WatchlistPage.ROUTE_NAME);
            },
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
            },
            leading: Icon(Icons.info_outline),
            title: Text('About'),
          ),
        ],
      ),
    );
  }
}
