import 'package:paktani_mobile/common/constants.dart';
import 'package:paktani_mobile/common/utils.dart';
import 'package:paktani_mobile/presentation/pages/money_page.dart';
import 'package:paktani_mobile/presentation/pages/about_page.dart';
import 'package:paktani_mobile/presentation/pages/movie_detail_page.dart';
import 'package:paktani_mobile/presentation/pages/home_movie_page.dart';
import 'package:paktani_mobile/presentation/pages/onair_tvseries_page.dart';
import 'package:paktani_mobile/presentation/pages/popular_movies_page.dart';
import 'package:paktani_mobile/presentation/pages/popular_tvseries_page.dart';
import 'package:paktani_mobile/presentation/pages/product/home_product_page.dart';
import 'package:paktani_mobile/presentation/pages/register_page.dart';
import 'package:paktani_mobile/presentation/pages/search_page.dart';
import 'package:paktani_mobile/presentation/pages/top_rated_movies_page.dart';
import 'package:paktani_mobile/presentation/pages/home_tvseries_page.dart';
import 'package:paktani_mobile/presentation/pages/top_rated_tvseries_page.dart';
import 'package:paktani_mobile/presentation/pages/tvseries_detail_page.dart';
import 'package:paktani_mobile/presentation/pages/search_page_tvseries.dart';
import 'package:paktani_mobile/presentation/pages/watchlist_movies_page.dart';
import 'package:paktani_mobile/presentation/pages/watchlist_page.dart';
import 'package:paktani_mobile/presentation/pages/watchlist_tvseries_page.dart';
import 'package:paktani_mobile/presentation/provider/movie/movie_detail_notifier.dart';
import 'package:paktani_mobile/presentation/provider/movie/movie_list_notifier.dart';
import 'package:paktani_mobile/presentation/provider/movie/movie_search_notifier.dart';
import 'package:paktani_mobile/presentation/provider/tvseries/onair_tvseries_notifier.dart';
import 'package:paktani_mobile/presentation/provider/movie/popular_movies_notifier.dart';
import 'package:paktani_mobile/presentation/provider/tvseries/popular_tvseries_notifier.dart';
import 'package:paktani_mobile/presentation/provider/product/product_detail_notifier.dart';
import 'package:paktani_mobile/presentation/provider/product/product_list_notifier.dart';
import 'package:paktani_mobile/presentation/provider/movie/top_rated_movies_notifier.dart';
import 'package:paktani_mobile/presentation/provider/tvseries/top_rated_tvseries_notifier.dart';
import 'package:paktani_mobile/presentation/provider/tvseries/tvseries_detail_notifier.dart';
import 'package:paktani_mobile/presentation/provider/tvseries/tvseries_list_notifier.dart';
import 'package:paktani_mobile/presentation/provider/tvseries/tvseries_search_notifier.dart';
import 'package:paktani_mobile/presentation/provider/movie/watchlist_movie_notifier.dart';
import 'package:paktani_mobile/presentation/provider/tvseries/watchlist_tvseries_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:paktani_mobile/injection.dart' as di;
import 'package:paktani_mobile/presentation/pages/login_page.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<ProductListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<ProductDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<OnAirTVSeriesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TVSeriesListNotifier>(),
        ),
        //
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TVSeriesDetailNotifier>(),
        ),
        //
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TVSeriesSearchNotifier>(),
        ),
        //
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedTVSeriesNotifier>(),
        ),
        //
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularTVSeriesNotifier>(),
        ),
        //

        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistMovieNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistTVSeriesNotifier>(),
        ),
        //
      ],
      child: MaterialApp(
        title: 'PakTani',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: HomeMoviePage(),
        //home: LoginPage(),
        //home: MoneyPage(),
        debugShowCheckedModeBanner: false,
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            //
            case MoneyPage.ROUTE_NAME:
              return MaterialPageRoute(
                builder: (_) => MoneyPage(),
              );
            //
            case HomeProductPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => HomeProductPage());
            case HomeMoviePage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case HomeTVSeriesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => HomeTVSeriesPage());
            case OnAirTVSeriesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => OnAirTVSeriesPage());
            //
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case PopularTVSeriesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularTVSeriesPage());
            //
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case TopRatedTVSeriesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedTVSeriesPage());
            //
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case TVSeriesDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TVSeriesDetailPage(id: id),
                settings: settings,
              );
            //
            case SearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case SearchPageTVSeries.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchPageTVSeries());
            //
            case WatchlistPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistPage());
            case WatchlistMoviesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case WatchlistTVSeriesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistTVSeriesPage());
            //
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => AboutPage());
            //
            case LoginPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => LoginPage());
            case RegisterPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => RegisterPage());
            
            case MoneyPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => MoneyPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
