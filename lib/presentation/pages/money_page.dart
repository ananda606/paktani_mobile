import 'package:flutter/services.dart';
import 'package:paktani_mobile/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:paktani_mobile/domain/api/money_api.dart';
import 'package:paktani_mobile/domain/api/user_api.dart';
import 'package:paktani_mobile/domain/model/money_model.dart';
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
    return Scaffold(
        drawer: AppBar(
          title: Text('TopUp'),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: Stack(children: [
            Column(
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
                          Text('Rp.$value'),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    TextFormField(
                      cursorColor: Colors.blue,
                      controller: _topupController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: 'amount',
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            value = int.parse(_topupController.text);
                          });
                          showDialog(
                              context: context,
                              builder: ((context) {
                                return AlertDialog(
                                  title: Text('TopUp berhasil'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        child: Text('ok'),
                                      ),
                                    ),
                                  ],
                                );
                              }));
                        },
                        child: Text('Top up')),
                  ],
                ),
              ],
            ),
            SafeArea(
              child: IconButton(
                onPressed: () => Navigator.popAndPushNamed(
                    context, HomeProductPage.ROUTE_NAME),
                icon: const Icon(Icons.close),
              ),
            )
          ]),
        ));
  }
}
