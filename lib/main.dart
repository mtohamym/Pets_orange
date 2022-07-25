import 'package:flutter/material.dart';
import 'package:petology_test/pages/home.dart';

import 'network/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(Home());
}


