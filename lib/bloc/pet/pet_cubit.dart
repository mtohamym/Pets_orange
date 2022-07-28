import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_test/bloc/pet/pet_states.dart';

import '../../data/constant.dart';
import '../../data/models/filters.dart';
import '../../data/models/pet.dart';
import '../../network/dio_helper.dart';

class PetCubit extends Cubit<PetStates> {
  PetCubit() : super(InitialState());

  static PetCubit get(context) => BlocProvider.of(context);

  Pet? pet;

  bool showHover = false;

  int imageIndex = 0;

  void setShowHover(bool value) {
    showHover = value;

    emit(ShowHover());
  }

  void changeImageIndex(int direction) {
    imageIndex += direction;

    if (imageIndex > 2)
      imageIndex = 0;
    else if (imageIndex < 0) imageIndex = 2;

    emit(ImageIndexChanged());
  }

  Future<dynamic> getPetData(String petId) async {
    DioHelper.dio
        .get(
      GET_PET_ENDPOINT + petId,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        'Authorization': 'Bearer $TOKEN'
      }),
    )
        .then((value) {
      if (value.statusCode == 200) {
        print("RequestCategorySuccess");
        pet = Pet.fromJson(value.data);
        emit(LoadDataSuccess());
      } else {
        print("RequestCategoryFailed");

        emit(LoadDataFaild());
      }
    });
  }
}
