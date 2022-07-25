import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_test/bloc/home/home_states.dart';
import 'package:petology_test/data/models/category.dart';
import 'package:petology_test/network/dio_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(HomeStates initialState) : super(initialState);

  static HomeCubit get(context) => BlocProvider.of(context);
  List<Profile> profiles = [];

  Future<dynamic> getHomeData() async {
    var json = {
      "email": "tohamy@gmail.com",
      "password": "01004724510",
      "firstName": "toha",
      "lastName": "moha",
      "phoneNumber": "010047245102",
      "country": "egymegy"
    };

    DioHelper.dio
        .post(
      "url",
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode(json),
    )
        .then((value) {
      if (value.statusCode == 200) {

      } else {

      }
    });
  }

}
