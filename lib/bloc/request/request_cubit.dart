import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:petology_test/bloc/request/request_states.dart';
import 'package:petology_test/data/constant.dart';
import 'package:petology_test/data/models/filters.dart';
import 'package:petology_test/network/dio_helper.dart';

class RequestCubit extends Cubit<RequestStates> {
  RequestCubit() : super(RequestInitialState());

  bool? isVaccinated = false;

  Map<String, dynamic> selections = {
    'name': "",
    'image': [""],
    'year': 0,
    'month': 0,
    'size': "",
    'breed': "",
    'gender': true,
    'hairLength': "",
    'color': "",
    'careBehavior': "",
    'houseTrained': true,
    'description': "",
    'location': "",
    'phone': "",
    'vaccinated': true,
    'categoryId': 0,
  };

  List<String> base64string = [];
  List<Uint8List>? bytesFromPicker;

  var categoryDropItems = ["Dog", "Cat"];

  List<String> genderDropItems = ["Male", "Female"];

  bool showHover = false;

  void setShowHover(bool value) {
    showHover = value;

    emit(ShowHover());
  }

  void checkVaccine() {
    isVaccinated = !isVaccinated!;
    emit(CheckBoxChanged());
  }

  static RequestCubit get(context) => BlocProvider.of(context);
  Filters? filtersData;

  Future<dynamic> getDataByCategory(String id) async {
    DioHelper.dio
        .get(
      CATEGORY_FILTERS_ENDPOINT + id,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
    )
        .then((value) {
      if (value.statusCode == 200) {
        print("RequestCategorySuccess");
        filtersData = Filters.fromJson(value.data);
        emit(RequestCategorySuccess());
      } else {
        print("RequestCategoryFailed");
        emit(RequestCategoryFailed());
      }
    });
  }

  Future<void> pickImage() async {
    bytesFromPicker = (await ImagePickerWeb.getMultiImagesAsBytes());
    for (int i = 0; i < bytesFromPicker!.length; i++) {
      base64string
          .add('data:image/png;base64,' + base64.encode(bytesFromPicker![i]));
    }

    print(bytesFromPicker![0].toString().substring(0, 40));
    emit(ImageLoaded());
  }

  Future<dynamic> postData(
      {required String name,
      required String phone,
      required String location,
      required String description}) async {
    selections['name'] = name;
    selections['phone'] = phone;
    selections['location'] = location;
    selections['description'] = description;
    selections['image'] = base64string;
    print(TOKEN);
    Map<String, Map> data = {"pet": selections};

    String dataJason = jsonEncode(data);

    print(dataJason);
    DioHelper.dio
        .post(
      PET_REQUEST_ENDPOINT,
      data: dataJason,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        'Authorization': 'Bearer $TOKEN'
      }),
    )
        .then((value) {
      if (value.statusCode == 200) {
        print("Request Success");

        emit(RequestPetSuccess());
      } else {
        print("Request Failed");
        emit(RequestPetFailed());
      }
    });
  }
}
