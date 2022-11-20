import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const ROUTE_NAME = '/login_page';
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
    // Future.microtask(() => null)
  }

  void _togglePasswordView() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.center,
                      width: 80,
                      height: 80,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "must not empty";
                          } else {
                            return null;
                          }
                        },
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
                      margin: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                      ),
                      height: 50,
                      width: 80,
                      alignment: Alignment.center,
                      child: TextFormField(
                        obscureText: _isObscure,
                        obscuringCharacter: '*',
                        autofocus: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelText: 'Password',
                          suffix: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
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
                          onPressed: () {},
                          child: const Text('Daftar'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 8, 30, 0),
                      child: ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home_movie');
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
