import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_test/bloc/how_to_feed/how_to_feed_states.dart';
import 'package:petology_test/data/constant.dart';

import '../../data/models/home_model.dart';
import '../../data/models/how_to_feed.dart';
import '../../network/dio_helper.dart';

class HowToFeedCubit extends Cubit<HowToFeedStates> {
  HowToFeedCubit() : super(AppInitialState());

  HowToFeed? howToFeedData;

  static HowToFeedCubit get(context) => BlocProvider.of(context);
  bool showHover = false;

  void setShowHover(bool value) {
    showHover = value;

    emit(ShowHover());
  }

  Future<dynamic> getHowToFeedData(String id) async {
    DioHelper.dio
        .get(
      HOW_TO_FEED_SECTION_ENDPOINT + id,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
    )
        .then((value) {
      if (value.statusCode == 200) {
        print("Success in How to feed");
        howToFeedData = HowToFeed(value.data['title'], value.data['body']);

        emit(LoadSuccess());
      } else {
        print("Error in How to feed");
        emit(LoadError());
      }
    });
  }
}
