import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_test/bloc/footer/footer_states.dart';
import 'package:petology_test/data/constant.dart';

import '../../data/models/home_model.dart';
import '../../network/dio_helper.dart';

class FooterCubit extends Cubit<FooterStates> {
  FooterCubit() : super(AppInitialState());

  Footer? footerData;

  static FooterCubit get(context) => BlocProvider.of(context);

  Future<dynamic> getFooterData(Context) async {
    List? listOfData;
    DioHelper.dio
        .get(
      Footer_ENDPOINT,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: TOKEN
      }),
    )
        .then((value) {
      if (value.statusCode == 200) {
        print("Success in Footer");
        footerData = Footer(value.data['email'], value.data['location'],
            value.data['phone'].toString(), value.data['location2']);

        emit(LoadSuccess());
      } else {
        print("Error in Footer");
        emit(LoadError());
      }
    });
  }
}
