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

  // List categoryDropItems = [
  //   'Dog',
  //   'Cat',
  // ];

  String? breedSelect;
  String? agesSelect;
  String? sizeSelect;
  String? genderSelect;
  String? hairLengthSelect;
  String? behaviourSelect;
  String? colorDropSelect;

  String? base64string;
  Uint8List? bytesFromPicker;

  void selectDrop(String filterName, String newValue) {
    if (filterName == "breed") {
      breedSelect = newValue;
    } else if (filterName == "ages") {
      agesSelect = newValue;
    } else if (filterName == "size") {
      sizeSelect = newValue;
    } else if (filterName == "gender") {
      genderSelect = newValue;
    } else if (filterName == "colors") {
      colorDropSelect = newValue;
    } else if (filterName == "hairLength") {
      hairLengthSelect = newValue;
    } else if (filterName == "behaviour") {
      behaviourSelect = newValue;
    }
    emit(SelectDropValue());
  }

  var categoryDropItems = ["Dog", "Cat"];

  // List<DropdownMenuItem<String>> categoryDropItems = [
  //   DropdownMenuItem(child: Text("Dog"), value: "1"),
  //   DropdownMenuItem(child: Text("Cat"), value: "2"),
  // ];
  List<String> genderDropItems = ["Dog", "Cat"];
  // List<DropdownMenuItem<String>> genderDropItems = [
  //   DropdownMenuItem(child: Text("male"), value: "0"),
  //   DropdownMenuItem(child: Text("female"), value: "1"),
  // ];

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
    bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
    base64string = base64.encode(bytesFromPicker!);
    print(base64string);
    emit(ImageLoaded());
  }
}
