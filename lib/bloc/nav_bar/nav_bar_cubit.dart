import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_test/bloc/nav_bar/nav_bar_status.dart';

class NavBarCubit extends Cubit<NavBarStatus> {
  NavBarCubit() : super(AppInitialState());

  static NavBarCubit get(context) => BlocProvider.of(context);

  List isHovering = [false, false, false, false];

  void setHoverFor(int index, bool value) {
    isHovering[index] = value;
    emit(UpdateSuccess());
  }


}
