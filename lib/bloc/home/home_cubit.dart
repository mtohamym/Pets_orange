import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_test/bloc/home/home_states.dart';
import 'package:petology_test/data/constant.dart';
import 'package:petology_test/data/models/category.dart';
import 'package:petology_test/data/models/home_model.dart';
import 'package:petology_test/network/dio_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(AppInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<Profile> profiles = [];
  List<PetsNeeds> petsNeedsData = [];

  Footer? footerData;
  FirstSection? firstSectionData;
  SecondSection? secondSectionData;

  Future<dynamic> getHomeFirstSectionsData(Context) async {
    DioHelper.dio
        .get(
      FIRST_SECTION_ENDPOINT,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
    )
        .then((value) {
      if (value.statusCode == 200) {
        print("success in first section");
        firstSectionData =
            FirstSection(value.data['title'], value.data['body']);

        emit(SectionOneSuccess());
      } else {
        print("error in first section");
        emit(SectionOneError());
      }
    });
  }

  Future<dynamic> getHomeSecondSectionsData(Context) async {
    DioHelper.dio
        .get(
      SECOND_SECTION_ENDPOINT,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
    )
        .then((value) {
      if (value.statusCode == 200) {
        print("success in second section");

        secondSectionData =
            SecondSection(value.data['title'], value.data['body']);
      } else {
        print("error in second section");
      }
    });
  }

  Future<dynamic> getHomePetsData(Context) async {
    DioHelper.dio
        .get(
      PETS_NEED_ENDPOINT,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
    )
        .then((value) {
      if (value.statusCode == 200) {
        print("Success in pets api");
        for (int i = 0; i < value.data.length; i++) {
          petsNeedsData.add(PetsNeeds.fromJson(value.data[i]));
        }
        emit(petsNeedsSuccess());
      } else {
        print("Error in pets api");
        emit(petsNeedsFaild());
      }
    });
  }

  Future<dynamic> getHomeFooterData(Context) async {
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
      } else {
        print("Error in Footer");
      }
    });
  }
}
