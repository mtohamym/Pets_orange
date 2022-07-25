import 'package:flutter/material.dart';
import 'package:petology_test/pages/home.dart';
import 'package:petology_test/pages/login.dart';

import 'network/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}
