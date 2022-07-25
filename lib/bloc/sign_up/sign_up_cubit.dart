import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:petology_test/bloc/sign_up/sign_up_states.dart';
import 'package:petology_test/network/dio_helper.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit(SignUpStates initialState) : super(initialState);


  Future<dynamic> registerUser(json ,String endpoint) async {
    json = {
      "email": "tohamy@gmail.com",
      "password": "01004724510",
      "firstName": "toha",
      "lastName": "moha",
      "phoneNumber": "010047245102",
      "country": "egymegy"
    };
    DioHelper.dio
        .post(
      "auth/register",
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode(json),
    )
        .then((value) {
      if (value.statusCode == 200) {
        print("success");
      } else {
        print("Error");
      }
    });
  }


}