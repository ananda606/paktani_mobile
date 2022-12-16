import 'package:paktani_mobile/common/constants.dart';
import 'package:paktani_mobile/common/utils.dart';
import 'package:paktani_mobile/presentation/pages/about_page.dart';
import 'package:paktani_mobile/presentation/pages/product/search_product_page.dart';
import 'package:paktani_mobile/presentation/pages/product/home_product_page.dart';
import 'package:paktani_mobile/presentation/pages/product/product_detail_page.dart';
import 'package:paktani_mobile/presentation/pages/register_page.dart';
import 'package:paktani_mobile/presentation/pages/money_page.dart';
import 'package:flutter/material.dart';
import 'package:paktani_mobile/presentation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PakTani',

      theme: ThemeData.dark().copyWith(
        colorScheme: kColorScheme,
        primaryColor: kRichBlack,
        scaffoldBackgroundColor: kRichBlack,
        textTheme: kTextTheme,
      ),

    //home: HomeProductPage(),
      //home: FormAddScreen(),
      //home: TestPage(),
      home: LoginPage(),
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
          case SearchProductPage.ROUTE_NAME:
            return MaterialPageRoute(builder: (_) => SearchProductPage());
          case ProductDetailPage.ROUTE_NAME:
            final id = settings.arguments as int;
            return MaterialPageRoute(builder: (_) => ProductDetailPage(id: id));

          case AboutPage.ROUTE_NAME:
            return MaterialPageRoute(builder: (_) => AboutPage());

          case LoginPage.ROUTE_NAME:
            return MaterialPageRoute(builder: (_) => LoginPage());
          case RegisterPage.ROUTE_NAME:
            return MaterialPageRoute(builder: (_) => RegisterPage());
          default:
            return MaterialPageRoute(builder: (_) {
              return const Scaffold(
                body: Center(
                  child: Text('Page not found :('),
                ),
              );
            });
        }
      },
    );
  }
}
