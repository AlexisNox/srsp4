// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "login": "Authorization",
  "name": "Username",
  "namepress": "Enter username",
  "mail": "E-mail",
  "mailpress": "Enter E-mail",
  "password": "Password",
  "passwordpress": "Enter password",
  "enterbutton": "Log in",
  "question1": "Are you not with us yet?",
  "registerss": "Register",
  "registeration": "Registration",
  "namber": "Phone Number",
  "namberpress": "Enter phone number",
  "question2": "Do you have an account?",
  "enterss": "Log in",
  "registerbutton": "Registration",
  "welcome": "Welcome"
};
static const Map<String,dynamic> kk = {
  "login": "Авторизация",
  "name": "Пайдаланушы аты",
  "namepress": "Пайдаланушы атын енгізіңіз",
  "mail": "Пошта мекенжайы",
  "mailpress": "Пошта мекенжайын енгізіңіз",
  "password": "Құпия сөз",
  "passwordpress": "Құпия сөзді енгізіңіз",
  "enterbutton": "Кіру",
  "question1": "Сіз әлі бізбен бірге емессіз бе?",
  "registerss": "Тіркелу",
  "registeration": "Тіркеу",
  "namber": "Телефон нөмірі",
  "namberpress": "Телефон нөмірін енгізіңіз",
  "question2": "Есептік жазбаңыз бар ма?",
  "enterss": "Кіру",
  "registerbutton": "Тіркеу",
  "welcome": "Қош келдіңіз"
};
static const Map<String,dynamic> ru = {
  "login": "Авторизация",
  "name": "Имя пользователя",
  "namepress": "Введите имя пользователя",
  "mail": "Почтовый адресс",
  "mailpress": "Введите почтовый адресс",
  "password": "Пароль",
  "passwordpress": "Введите пароль",
  "enterbutton": "Войти",
  "question1": "Ты еще не с нами?",
  "registerss": "Зарегистрируйся",
  "registeration": "Регистрация",
  "namber": "Номер телефона",
  "namberpress": "Введите номер телефона",
  "question2": "Имеете аккаутн?",
  "enterss": "Войти",
  "registerbutton": "Регистрация",
  "welcome": "Приветствуем"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "kk": kk, "ru": ru};
}
