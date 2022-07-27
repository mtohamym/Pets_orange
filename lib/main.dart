import 'package:flutter/material.dart';
import 'package:petology_test/pages/adaption.dart';
import 'package:petology_test/pages/help_page.dart';
import 'package:petology_test/pages/home.dart';
import 'package:petology_test/pages/how_to.dart';
import 'package:petology_test/pages/login.dart';
import 'package:petology_test/pages/request.dart';
import 'package:petology_test/pages/signup.dart';

import 'network/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(MaterialApp(home: LoginPage()));
}
