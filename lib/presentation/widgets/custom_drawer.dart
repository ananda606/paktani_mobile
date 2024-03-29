import 'package:paktani_mobile/domain/model/product_model.dart';
import 'package:paktani_mobile/presentation/pages/about_page.dart';
import 'package:paktani_mobile/presentation/pages/product/home_product_page.dart';
import 'package:paktani_mobile/presentation/pages/money_page.dart';
import 'package:flutter/material.dart';
import 'package:paktani_mobile/domain/api/user_api.dart';
import 'package:paktani_mobile/domain/model/user_model.dart';

class DrawerApp extends StatefulWidget {
  final String pageRoute;

  DrawerApp({
    required this.pageRoute,
  });

  @override
  State<DrawerApp> createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  @override
  Widget build(BuildContext context) {
    UserApi userApi = UserApi();
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          // children: [
          //   FutureBuilder(
          //     future: userApi.getLoginUser(widget.userModel.email, widget.userModel.password),
          //     builder: (context, snapshot) {
          //       List<UserModel>? user = snapshot.data;
          //       if (snapshot.hasError) {
          //         return Text('something wrong');
          //       } else if (snapshot.hasData) {
          //         return UserAccountsDrawerHeader(
          //           currentAccountPicture: Icon(
          //             Icons.person,
          //             color: Colors.black,
          //           ),
          //           accountName: Text('${user?[0].email.toString()}'),
          //           accountEmail: Text('${user?[0].username.toString()}'),
          //         );
          //       } else {
          //         return Text('empty');
          //       }
          //     },
          //   ),
          ListTile(
            leading: const Icon(Icons.production_quantity_limits),
            title: const Text('Product'),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, HomeProductPage.ROUTE_NAME);
            },
          ),
          ListTile(
            leading: const Icon(Icons.monetization_on_outlined),
            title: const Text('Money'),
            onTap: () {
              Navigator.pushReplacementNamed(context, MoneyPage.ROUTE_NAME);
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
