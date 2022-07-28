import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:petology_test/bloc/help_friend/help_states.dart';

import '../../data/constant.dart';
import '../../network/dio_helper.dart';

class HelpCubit extends Cubit<HelpStates> {
  HelpCubit() : super(InitialState());
  static HelpCubit get(context) => BlocProvider.of(context);

  String? base64string;
  Uint8List? bytesFromPicker;

  Map<String, dynamic> data = {
    "categoryId": 0,
    "imageBase64": "",
    "location": "",
    "phoneNumber": ""
  };
  bool showHover = false;

  void setShowHover(bool value) {
    showHover = value;

    emit(ShowHover());
  }

  String categoryDrop = '';
  Future<void> pickImage() async {
    bytesFromPicker = (await ImagePickerWeb.getImageAsBytes());

    base64string = 'data:image/png;base64,' + base64.encode(bytesFromPicker!);

    emit(ImageLoaded());
  }

  Future<dynamic> postData(String location, String phone) async {
    print(TOKEN);
    data['imageBase64'] = base64string;
    data['location'] = location;
    data['phoneNumber'] = phone;

    String dataJason = jsonEncode(data);

    print(dataJason);
    DioHelper.dio
        .post(
      HELP_PET_REQUEST_ENDPOINT,
      data: dataJason,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        'Authorization': 'Bearer $TOKEN'
      }),
    )
        .then((value) {
      if (value.statusCode == 200) {
        print("Request Success");

        emit(HelpSendSuccess());
      } else {
        print("Request Failed");
        emit(HelpSendError());
      }
    });
  }
}
