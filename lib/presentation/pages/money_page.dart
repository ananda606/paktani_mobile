import 'package:paktani_mobile/common/constants.dart';
import 'package:flutter/material.dart';

class MoneyPage extends StatefulWidget {
  static const ROUTE_NAME = '/money';

  @override
  State<MoneyPage> createState() => _MoneyPageState();
}

class _MoneyPageState extends State<MoneyPage> {
  
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
                            Icon(Icons.monetization_on),
                            SizedBox(
                              width: 20,
                            ),
                            Text('Money'),
                          ],
                        ),
                        Text(
                          'Rp.${value.toString()}',
                          style: TextStyle(fontSize: 40),
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
                        icon: Icon(
                          Icons.add,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            value -= 1000;
                          });
                        },
                        icon: Icon(
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
              onPressed:()=>Navigator.pop(context),
              icon: Icon(Icons.close),
            ),
          )
        ],
      ),
    );
  }
}
