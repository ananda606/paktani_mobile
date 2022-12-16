import 'package:flutter/services.dart';
import 'package:paktani_mobile/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:paktani_mobile/domain/api/user_api.dart';
import 'package:paktani_mobile/domain/model/user_model.dart';
import 'package:paktani_mobile/presentation/pages/product/home_product_page.dart';

class MoneyPage extends StatefulWidget {
  static const ROUTE_NAME = '/money';

  @override
  State<MoneyPage> createState() => _MoneyPageState();
}

class _MoneyPageState extends State<MoneyPage> {
  TextEditingController _topupController = TextEditingController();
  int value = 0;
  @override
  void initState() {
    super.initState();
    _topupController = TextEditingController();
  }

  @override
  void dispose() {
    _topupController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserApi userApi = UserApi();
   
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: userApi.getUser(),
              builder: (context, snapshot) {
                List<UserModel>? userModelList = snapshot.data;

                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: kOxfordBlue,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.monetization_on),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text('Money'),
                                ],
                              ),
                              userModelList?[0].email == null
                                  ? Text('Rp.0')
                                  : Text(
                                      'Rp.${userModelList?[0].email}',
                                      style: const TextStyle(fontSize: 40),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    FutureBuilder(
                        future: userApi.getUser(),
                        builder: (context, snapshot) {
                          return TextButton(
                              onPressed: () {
                                setState(() {});
                              },
                              child: Text('Top up'));
                        }),
                  ],
                );
              }),
          SafeArea(
            child: IconButton(
              onPressed: () => Navigator.popAndPushNamed(
                  context, HomeProductPage.ROUTE_NAME),
              icon: const Icon(Icons.arrow_back),
            ),
          )
        ],
      ),
    );
  }
}
