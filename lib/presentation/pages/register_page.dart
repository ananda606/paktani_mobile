import 'package:flutter/material.dart';
import 'package:paktani_mobile/domain/api/user_api.dart';
import 'package:paktani_mobile/domain/model/user_model.dart';
import 'package:paktani_mobile/presentation/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  static const ROUTE_NAME = '/register_page';

  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _userAddressController = TextEditingController();
  TextEditingController _userPhoneNumberController = TextEditingController();
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
    _userAddressController = TextEditingController();
    _userPhoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _userAddressController.dispose();
    _userPhoneNumberController.dispose();
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
    UserModel userModel = UserModel(
      email: _emailController.text.toString(),
      username: _usernameController.text.toString(),
      password: _passwordController.text.toString(),
      userAddress: _userAddressController.text.toString(),
      userPhoneNumber: _userPhoneNumberController.text.toString(),
    );
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
                  'Register',
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
                  obscureText: _isObscure,
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
                  cursorColor: Colors.blue,
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: 'username',
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
                  cursorColor: Colors.blue,
                  controller: _userAddressController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: 'address',
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
                  cursorColor: Colors.blue,
                  controller: _userPhoneNumberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: 'phone number',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Forgot password'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('belum memiliki akun?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login_page');
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 8, 30, 0),
                child: ElevatedButton(
                  child: const Text('Register'),
                  onPressed: () {
                    if (_emailController.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty &&
                        _usernameController.text.isNotEmpty &&
                        _userAddressController.text.isNotEmpty &&
                        _userPhoneNumberController.text.isNotEmpty) {
                      userApi.createUser(userModel);
                      Navigator.pushNamed(context, LoginPage.ROUTE_NAME);
                    } else {
                      const AlertDialog(
                        title: Text('data tidak lengkap'),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
