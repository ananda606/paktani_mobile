import 'package:paktani_mobile/common/constants.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const ROUTE_NAME = '/about';

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
                    child: Text('PakTani'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32.0),
                  color: kDavysGrey,
                  child: Text(
                    'PakTani merupakan aplikasi yang dibuat untuk membantu petani dalam menjual dan mendapatkan produk pertanian',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
          SafeArea(
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.close),
            ),
          )
        ],
      ),
    );
  }
}
