import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_test/data/models/category.dart';

import 'category_states.dart';

class CategorySelectCubit extends Cubit<CategorySelectStatus> {
  CategorySelectCubit() : super(AppInitialState());

  static CategorySelectCubit get(context) => BlocProvider.of(context);

  List<Profile> profiles = [];

  void setProfiles() {
    profiles.add(new Profile("Dogs", "ic_dog.png", false));
    profiles.add(new Profile("Cats", "ic_cat.png", false));
  }

  void setHoverFor(int index, bool value) {
    profiles[index].isSelected = value;
    emit(UpdateSuccess());
  }
}
