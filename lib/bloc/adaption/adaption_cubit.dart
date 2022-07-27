import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_test/bloc/adaption/adaption_states.dart';

import '../../data/constant.dart';
import '../../data/models/filters.dart';
import '../../data/models/pet.dart';
import '../../network/dio_helper.dart';

class AdaptionCubit extends Cubit<AdaptionStates> {
  AdaptionCubit() : super(InitialState());

  static AdaptionCubit get(context) => BlocProvider.of(context);
  Filters? filtersData;
  List<Pet> listOfData = [];
  Map<String, dynamic> selections = {};

  Future<dynamic> getFiltersByCategory(String id) async {
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
        emit(FilterSuccess());
      } else {
        print("RequestCategoryFailed");

        emit(FilterError());
      }
    });
  }

  Future<dynamic> getPetsData(String categoryId) async {
    DioHelper.dio
        .get(
      GET_PETS_ENDPOINT + categoryId + "/pets",
      queryParameters: selections,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        'Authorization': 'Bearer $TOKEN'
      }),
    )
        .then((value) {
      if (value.statusCode == 200) {
        print("RequestCategorySuccess");
        for (int i = 0; i < value.data.length; i++) {
          listOfData.add(Pet.fromJson(value.data[i]));
        }
        emit(LoadDataSuccess());
      } else {
        print("RequestCategoryFailed");

        emit(LoadDataFaild());
      }
    });
  }
}
