import 'package:flutter/material.dart';
import 'package:paktani_mobile/domain/api/user_api.dart';
import 'package:paktani_mobile/domain/model/user_model.dart';
import 'package:paktani_mobile/common/constants.dart';
import 'package:paktani_mobile/presentation/pages/product/home_product_page.dart';
import 'package:paktani_mobile/presentation/pages/shop/home_shop_page.dart';

class LoginPage extends StatefulWidget {
  static const ROUTE_NAME = '/login_page';

  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordView() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserApi userApi = UserApi();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            const Center(
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: 80,
              height: 50,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "must not empty";
                  } else {
                    return null;
                  }
                },
                enabled: true,
                onFieldSubmitted: (val) {},
                cursorColor: Colors.blue,
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Email',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 80,
              alignment: Alignment.center,
              child: TextFormField(
                enabled: true,
                obscureText: _isObscure,
                controller: _passwordController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Password',
                  suffix: InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Forgot password'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Belum memiliki akun?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register_page');
                  },
                  child: const Text('Daftar'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 8, 30, 0),
              child: FutureBuilder(
                  future: userApi.getLoginUser(_emailController.text.toString(),
                      _passwordController.text.toString()),
                  builder: (context, snapshot) {
                    List<UserModel>? user = snapshot.data;
                    if (snapshot.data?.length == null) {
                      return ElevatedButton(
                        child: Text('Login'),
                        onPressed: () {
                          if (user == null) {
                          } else {
                            if (_emailController.text == 'admin' &&
                                _passwordController.text == 'admin') {
                              Navigator.pushNamed(
                                context,
                                HomeShopPage.ROUTE_NAME,
                              );
                            }
                            Navigator.pushNamed(
                              context,
                              '/home_product',
                            );
                          }
                        },
                      );
                    }

                    // UserModel userModel=UserModel(email: _emailController.text.toString(), password: _passwordController.text.toString(), username: username, userAddress: userAddress, userPhoneNumber: userPhoneNumber)
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return ElevatedButton(
                        child: Text('Login'),
                        onPressed: () {
                          if (user == null) {
                          } else {
                            if (_emailController.text == 'admin' &&
                                _passwordController.text == 'admin') {
                              Navigator.pushNamed(
                                  context, HomeShopPage.ROUTE_NAME);
                            }
                            Navigator.pushNamed(
                                context, HomeProductPage.ROUTE_NAME);
                          }
                        },
                      );
                    } else {
                      return ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () {
                          if (user == null) {
                          } else {
                            if (_emailController.text == 'admin' &&
                                _passwordController.text == 'admin') {
                              Navigator.pushNamed(
                                  context, HomeShopPage.ROUTE_NAME);
                            }
                            Navigator.pushNamed(context, '/home_product');
                          }
                        },
                      );
                    }
                  }),
            ),
            ElevatedButton(
              child: const Text('admin page'),
              onPressed: () {
                Navigator.pushNamed(context, HomeShopPage.ROUTE_NAME);
              },
            )
          ],
        ),
      ),
    );
  }
}
