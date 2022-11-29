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
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
                //  backgroundImage: AssetImage('assets/circle-g.png'),
                ),
            accountName: Text('User'),
            accountEmail: Text('user@gmail.com'),
          ),
          ListTile(
            leading: const Icon(Icons.monetization_on),
            title: const Text('Gopay'),
            onTap: () {},
            trailing: const Text('Rp.1.000.000'),
          ),
          ListTile(
            leading: const Icon(Icons.tv),
            title: const Text('TVSeries'),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, HomeTVSeriesPage.ROUTE_NAME);
            },
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Movies'),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeMoviePage.ROUTE_NAME);
            },
          ),
          ListTile(
            leading: const Icon(Icons.save_alt),
            title: const Text('Watchlist'),
            onTap: () {
              Navigator.pushNamed(context, WatchlistPage.ROUTE_NAME);
            },
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
            },
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
          ),
        ],
      ),
    );
  }
}
