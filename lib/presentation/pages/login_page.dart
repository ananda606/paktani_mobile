import 'package:flutter/material.dart';

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
  late FocusNode _emailFocusNode = FocusNode();
  late FocusNode _passFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode = new FocusNode();
    _passFocusNode = new FocusNode();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void _togglePasswordView() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                onFieldSubmitted: (val) {
                  _emailFocusNode.unfocus();
                  FocusScope.of(context).requestFocus(_emailFocusNode);
                },
                focusNode: _emailFocusNode,
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
                focusNode: _passFocusNode,
                obscureText: _isObscure,
                onFieldSubmitted: ((value) {
                  _passFocusNode.unfocus();
                  FocusScope.of(context).requestFocus(_passFocusNode);
                }),
                obscuringCharacter: '*',
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
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  Navigator.pushNamed(context, '/home_movie');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
