import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:srs4/ofor/bottom_bar.dart';
import 'package:srs4/ofor/header_widget.dart';
import 'package:srs4/login_registra/registra_page.dart';
import 'package:srs4/translations/locale_keys.g.dart';
import 'package:srs4/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required User usersInfo}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _headerHeight = 170;
  bool _hidepassword = true;

  final _formKey = GlobalKey<FormState>();


  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _usernameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passFocus = FocusNode();

  User newUser = User();

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true,
                  Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  // This will be the login form
                  child: Column(
                    children: [
                      SizedBox(height: 0.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: Text(LocaleKeys.login.tr(),
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45),
                                ),
                              ),
                              const SizedBox(height: 15),
                              TextFormField(
                                focusNode: _usernameFocus,
                                autofocus: true,
                                onFieldSubmitted: (_) {
                                  _fieldFocusChange(
                                      context, _usernameFocus, _emailFocus);
                                },
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white38,
                                  labelText: LocaleKeys.name.tr(),
                                  hintText: LocaleKeys.namepress.tr(),
                                  prefixIcon: Icon(
                                    Icons.assignment_ind,
                                    color: Colors.black45,
                                  ),
                                ),
                                validator: validateUsername,
                                onSaved: (value) => newUser.username = value!,
                              ),
                              const SizedBox(height: 7),
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white38,
                                  labelText: LocaleKeys.mail.tr(),
                                  hintText: LocaleKeys.mailpress.tr(),
                                  prefixIcon: Icon(
                                    Icons.alternate_email,
                                    color: Colors.black45,
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: validateEmail,
                                onSaved: (value) => newUser.email = value!,
                              ),
                              const SizedBox(height: 7),
                              TextFormField(
                                focusNode: _passFocus,
                                controller: _passController,
                                obscureText: _hidepassword,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white38,
                                  labelText: LocaleKeys.password.tr(),
                                  hintText: LocaleKeys.passwordpress.tr(),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                        _hidepassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.black45),
                                    onPressed: () {
                                      setState(() {
                                        _hidepassword = !_hidepassword;
                                      });
                                    },
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.paste_sharp,
                                    color: Colors.black45,
                                  ),
                                ),
                                validator: _validatePassword,
                              ),
                              const SizedBox(height: 10),
                              Container(
                                child: ElevatedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                        LocaleKeys.enterbutton.tr().toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) => HomePage()
                                          ),
                                              (Route<dynamic> route) => false
                                      );
                                    }
                                  },
                                ),
                              ),

                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Text(
                                      LocaleKeys.question1.tr(),
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 13),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RegistraPage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      LocaleKeys.registerss.tr(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.purple,
                                        fontSize: 13,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      _showMessage(
          message:
          'Неверно заполненные данные! Пожалуйста, попробуйте еще раз');
    }
  }

  String? validateUsername(String? value) {
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (value == null) {
      return 'Имя пользователя требуется.';
    } else if (!nameExp.hasMatch(value)) {
      return 'Пожалуйста, введите буквы алфавита.';
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    if (value == null) {
      return 'Электронная почта не может быть пустой';
    } else if (!_emailController.text.contains('@')) {
      return 'Неверный адрес электронной почты';
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (_passController.text.length <= 7) {
      return '8 символов требуется для пароля';
    } else {
      return null;
    }
  }

  void _showMessage({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor: const Color(0xFFEF5350),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 10),
        ),
      ),
    );
  }
}
