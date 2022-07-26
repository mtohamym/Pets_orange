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
  HomeCubit(HomeStates initialState) : super(initialState);

  static HomeCubit get(context) => BlocProvider.of(context);
  List<Profile> profiles = [];
  List<PetsNeeds> listOfPets = [];
  late Footer footerData;
  late FirstSection firstSectionData;
  late SecondSection secondSectionData;

  Future<dynamic> getHomeSectionsData(String endPoint, Context) async {
    DioHelper.dio
        .get(
      "url",
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: TOKEN
      }),
    )
        .then((value) {
      if (value.statusCode == 200) {
        firstSectionData =
            FirstSection(value.data['title'], value.data['body']);
        secondSectionData =
            SecondSection(value.data['title'], value.data['body']);
      } else {}
    });
  }

  Future<dynamic> getHomePetsData(String endPoint, Context) async {
    List? listOfData;
    DioHelper.dio
        .get(
      "url",
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: TOKEN
      }),
    )
        .then((value) {
      if (value.statusCode == 200) {
        print("Success");
        listOfData = jsonDecode(value.data);
        for (int i = 0; i < listOfData!.length; i++) {
          listOfPets!.add(
              PetsNeeds(listOfData![i]["imageUrl"], listOfData![i]["title"]));
        }
      } else {
        print("Error");
      }
    });
  }

  Future<dynamic> getHomeFooterData(String endPoint, Context) async {
    List? listOfData;
    DioHelper.dio
        .get(
      "url",
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
