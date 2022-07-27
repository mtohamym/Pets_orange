import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_test/data/constant.dart';
import 'package:petology_test/network/dio_helper.dart';
import 'package:petology_test/pages/help_page.dart';
import 'package:petology_test/pages/home.dart';
import 'package:petology_test/pages/request.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<dynamic> loginUser(json, String endpoint,context) async {
    Response response = DioHelper.dio
        .post(
      endpoint,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode(json),
    )
        .then((value) {
      if (value.statusCode == 200) {
        TOKEN =value.data['accessToken'];

        print("success\n"+'Token : ${(TOKEN)}');
        emit(UserLoginSuccess());
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => HelpPage()));
      } else {
        emit(UserLoginFailed());
        print("Error");
      }
    }) as Response;
  }
}
