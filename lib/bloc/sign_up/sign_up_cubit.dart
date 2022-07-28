import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_test/bloc/sign_up/sign_up_states.dart';
import 'package:petology_test/network/dio_helper.dart';
import 'package:petology_test/pages/home.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());
  static SignUpCubit get(context) => BlocProvider.of(context);
  bool showHover = false;

  void setShowHover(bool value) {
    showHover = value;

    emit(ShowHover());
  }

  Future<dynamic> registerUser(json, String endpoint, context) async {
    DioHelper.dio
        .post(
      endpoint,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode(json),
    )
        .then((value) {
      if (value.statusCode == 200) {
        print("success");
        print('Token : ${(value.data['accessToken'])}');
        emit(UserSigendUpSuccess());
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => Home()));
      } else {
        print("Error");
      }
    });
  }
}
