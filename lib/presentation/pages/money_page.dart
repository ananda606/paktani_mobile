import 'package:paktani_mobile/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:paktani_mobile/presentation/pages/product/home_product_page.dart';

class MoneyPage extends StatefulWidget {
  static const ROUTE_NAME = '/money';

  @override
  State<MoneyPage> createState() => _MoneyPageState();
}

class _MoneyPageState extends State<MoneyPage> {
  int value = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                        Text(
                          'Rp.${value.toString()}',
                          style: const TextStyle(fontSize: 40),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(32.0),
                  color: kDavysGrey,
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            value += 10000;
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            value -= 1000;
                          });
                        },
                        icon: const Icon(
                          Icons.remove,
                        ),
                      ),
                      Text('$value'),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
